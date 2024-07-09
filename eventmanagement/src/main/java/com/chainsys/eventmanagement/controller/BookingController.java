package com.chainsys.eventmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chainsys.eventmanagement.dao.BookingsDAO;
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
			model.addAttribute("price", total);
		return "payment.jsp";
		
	}
}
