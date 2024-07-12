package com.chainsys.eventmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.eventmanagement.dao.BookingsDAO;
import com.chainsys.eventmanagement.dao.BookingsDAOImpl;
import com.chainsys.eventmanagement.model.Show;




@Controller
public class BookingController {
	@Autowired
	BookingsDAO bookingsDao;
	
	
	
	
	@PostMapping("/book")
    public String getEvents(@RequestParam("eventType") String eventType,Model model) {
		
		model.addAttribute("shows",bookingsDao.getAllShows(eventType));
		
        return "bookings.jsp";
    }
	@PostMapping("/bookTickets")
	public String getTickets(Model model,@RequestParam("showId") int showId,@RequestParam("userId") int user,@RequestParam("numTickets") int tickets,@RequestParam("totalPrice")String total) {
		  double totalPrice = Double.parseDouble(total);
		    int totalPriceInt = (int) totalPrice;
		    
		    
			Show show = new Show();
			show.setId(showId);
			show.setUserId(user);
			show.setTicketsBooked(tickets);
			show.setPrice(totalPriceInt);
			bookingsDao.updateTicketsCount(showId, tickets);
			bookingsDao.storeBookingsDetails(show);
			model.addAttribute("data", show);
		return "payment.jsp";
		
	}
	@PostMapping("/tickets")
	public String getBookedTickets(Model model,@RequestParam("showId") int showId,@RequestParam("tickets") int tickets) {
		Show show = bookingsDao.getBookingDetails(showId);
		show.setTicketsBooked(tickets);
		show.setTicketId(BookingsDAOImpl.generateTicketId());
		model.addAttribute("bookingDetails",show);
		
		return "tickets.jsp";
	}
	
}
