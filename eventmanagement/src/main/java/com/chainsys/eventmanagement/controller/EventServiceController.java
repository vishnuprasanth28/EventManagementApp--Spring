package com.chainsys.eventmanagement.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.eventmanagement.dao.ServiceDAOImpl;
import com.chainsys.eventmanagement.model.Event;
import com.chainsys.eventmanagement.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EventServiceController {
	
	@Autowired
	ServiceDAOImpl serviceImpl;
	private static final String EVENT = "event";
	@PostMapping("/getVenue")
	public String getVenue(@RequestParam("eventType")String eventType,@RequestParam("eventDate")String eventDate,@RequestParam("location")String location,Model model) throws SQLException {
		
		 java.sql.Date dateTosort = java.sql.Date.valueOf(eventDate);
		 
		 model.addAttribute("venues",serviceImpl.getAvailableVenues(dateTosort, location));
		 model.addAttribute(EVENT, eventType);
		 model.addAttribute("date", dateTosort);
		
		return "venue.jsp";
	}

	@PostMapping("/addService")
	public String getServices(@RequestParam("eventType")String eventType,@RequestParam("date")String eventDate,@RequestParam("venuePrice")String venuePrice,@RequestParam("venueId")String venueId,Model model) throws SQLException{
		
		 java.sql.Date dateTosort = java.sql.Date.valueOf(eventDate);
		 
		 model.addAttribute("photography", serviceImpl.getPhotographers(dateTosort));
		 model.addAttribute("catering", serviceImpl.getCatering(dateTosort));
		 model.addAttribute("venueId", venueId);
		 model.addAttribute("venuePrice", venuePrice);
		 model.addAttribute(EVENT, eventType);
		 
		return "addservices.jsp";
	}
	
	@PostMapping("/checkout")
	public String handleCheckout( @RequestParam("eventType") String eventType,
            @RequestParam("venue") int venue,
            @RequestParam("venuePrice") int venuePrice,
            @RequestParam("date") String dateString,
            @RequestParam(value = "selectedPhotographers", required = false) String photographerId,
            @RequestParam(value = "selectedCaterings", required = false) String caterId,
            HttpServletRequest request,Model model) {
		
		
		 int selectedPhotographerId = -1;
	        int photographyPrice = 0;
	        if (photographerId != null && !photographerId.isEmpty()) {
	            selectedPhotographerId = Integer.parseInt(photographerId);
	            photographyPrice = Integer.parseInt(request.getParameter("pricePhoto_" + selectedPhotographerId));
	        }

	        int selectedCateringId = -1;
	        int cateringPrice = 0;
	        if (caterId != null && !caterId.isEmpty()) {
	            selectedCateringId = Integer.parseInt(caterId);
	            cateringPrice = Integer.parseInt(request.getParameter("priceCatering_" + selectedCateringId));
	        }

	        double total = venuePrice + photographyPrice + (double) cateringPrice;

	        Event event = new Event();
	        event.setCateringPrice(cateringPrice);
	        event.setPhotographyPrice(photographyPrice);
	        event.setEventType(eventType);
	        event.setDateString(dateString);
	        event.setEstimatedPrice(total);
	        event.setVenueId(venue);
	        event.setVenuePrice(venuePrice);
	        event.setCateringId(selectedCateringId);
	        event.setPhotoGraphyId(selectedPhotographerId);
	        
	        model.addAttribute(EVENT, event);
		
		return "checkout.jsp";
	}
	@PostMapping("/payment")
	public String makePayment(@RequestParam("event") String eventType,@RequestParam("venueId") int venueId,@RequestParam("date") String eventDateStr,
								@RequestParam("photographyVendorId") int photographyId,
								@RequestParam("cateringVendorId") int cateringId,@RequestParam("estimatedPrice") String totalPrice,HttpSession session) {
		
	
		User user =	(User) session.getAttribute("user");
		
		Event events = new Event();
		events.setDateString(eventDateStr);
		events.setUserId(user.getUserId());
		events.setVenueId(venueId);
		events.setCateringId(cateringId);
		events.setEventName(eventType);
		events.setPhotoGraphyId(photographyId);

		serviceImpl.storeBookedEvents(events);
		return "payment.jsp";
	}
	
}
