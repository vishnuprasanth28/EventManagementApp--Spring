package com.chainsys.eventmanagement.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.eventmanagement.dao.BookingsDAOImpl;
import com.chainsys.eventmanagement.dao.ServiceDAO;
import com.chainsys.eventmanagement.dao.UserDAO;
import com.chainsys.eventmanagement.model.Show;
import com.chainsys.eventmanagement.model.User;
import com.chainsys.eventmanagement.model.Vendor;
import com.chainsys.eventmanagement.model.Venue;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	UserDAO userDao;
	@Autowired
	ServiceDAO serviceDao;
	
	@Autowired
	BookingsDAOImpl bookingsDaoImpl;
	
	private static final String ADMIN_JSP = "admindashboard.jsp";
	private static final String VENUE_LIST_ATTRIBUTE = "venueList";
	
	 @PostMapping("/adminLogin")
	    public String adminLogin(@RequestParam("Username") String userName,@RequestParam("Password") String password, HttpSession session, Model model) {
	      
	        User user = new User();
	        user.setUserName(userName);
	        user.setPassword(password);

	        try {
	            if (userDao.adminLogin(user)) {
	                session.setAttribute("admin", user.getUserName());
	              model.addAttribute(VENUE_LIST_ATTRIBUTE, serviceDao.getAllVenues());
	             
	               model.addAttribute("listOfVendors", serviceDao.getAllvendors());
	               model.addAttribute("bookedEvents", serviceDao.getEvents());
	                return ADMIN_JSP; 
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "error"; 
	    }
	 @PostMapping("/addVenue")
	    public String addVenue(@RequestParam("name") String name,
	                           @RequestParam("location") String location,
	                           @RequestParam("capacity") int capacity,
	                           @RequestParam("Contact") String contact,
	                           @RequestParam("price") int price,
	                           @RequestParam("venue_image") MultipartFile venueImage,
	                           Model model) throws IOException {
	        
	        byte[] imageBytes = venueImage.getBytes();
	        
	        Venue venue = new Venue();
	        venue.setVenueName(name);
	        venue.setLocation(location);
	        venue.setCapacity(capacity);
	        venue.setContactPhone(contact);
	        venue.setPrice(price);
	        venue.setImage(imageBytes);
	        
	        try {
	        	serviceDao.addVenue(venue);
	            List<Venue> venueList = serviceDao.getAllVenues();
	            model.addAttribute(VENUE_LIST_ATTRIBUTE, venueList);
	            model.addAttribute("listOfVendors", serviceDao.getAllvendors());
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("error", "Failed to add venue. Please try again.");
	        }
	 
	        return ADMIN_JSP;
}
	@PostMapping("/deleteVenue")
	public String deleteVenue(@RequestParam("deleteid") int idToDelete, Model model)	 {
		 
		serviceDao.deleteVenue(idToDelete);
		 model.addAttribute(VENUE_LIST_ATTRIBUTE, serviceDao.getAllVenues());
         model.addAttribute("listOfVendors", serviceDao.getAllvendors());
		
		 return ADMIN_JSP;
	}
	@PostMapping("/updateVenue")
	public String updateVenue(@RequestParam("venueId") int idToUpdate,@RequestParam("capacity") int capacity,@RequestParam("price") int amount ,@RequestParam("contact") String contact,Model model)	 {
		
		Venue venue = new Venue();
		venue.setVenueId(idToUpdate);
		venue.setCapacity(capacity);
		venue.setPrice(amount);
		venue.setContactPhone(contact);
		
		serviceDao.updateVenueDetails(venue);
		 model.addAttribute(VENUE_LIST_ATTRIBUTE, serviceDao.getAllVenues());
         model.addAttribute("listOfVendors", serviceDao.getAllvendors());
		
		 return ADMIN_JSP;
	}
	
	 @PostMapping("/addVendor")
	    public String addVendor(@RequestParam("vendorName") String name,
	                           @RequestParam("vendorType") String vendorType,
	                           @RequestParam("vendorContact") String contact,
	                           @RequestParam("price") int price,
	                           @RequestParam("profile_image") MultipartFile vendorImage,
	                           Model model) throws IOException{
		 Vendor vendor = new Vendor();
		 vendor.setVendorName(name);
		 vendor.setVendorType(vendorType);
		 vendor.setContact(contact);
		 vendor.setPrice(price);
		 
		 byte[] imageByte = vendorImage.getBytes();
		 vendor.setImage(imageByte);
		 
		 serviceDao.addVendor(vendor);
		 model.addAttribute(VENUE_LIST_ATTRIBUTE, serviceDao.getAllVenues());
         model.addAttribute("listOfVendors", serviceDao.getAllvendors());
		
		 return ADMIN_JSP;
		 
	 }
	 
	 @PostMapping("/deleteVendor")
	 public String deleteVendor(@RequestParam("deleteid") int idToDelete, Model model) {
		 
		 serviceDao.deleteVendor(idToDelete);
		 model.addAttribute(VENUE_LIST_ATTRIBUTE, serviceDao.getAllVenues());
         model.addAttribute("listOfVendors", serviceDao.getAllvendors());
		 return ADMIN_JSP;
		 
		 
	 }
	 @PostMapping("/addshow")
	    public String addShow(@RequestParam("showName") String ShowName,
	                           @RequestParam("category") String category,
	                           @RequestParam("location") String location,
	                           @RequestParam("date") Date date,
	                           @RequestParam("startTime") String startTimeStr,
	                           @RequestParam("endTime") String endTimeStr,
	                           @RequestParam("tickets_count") int ticketsCount,
	                           @RequestParam("price") int price,
	                           @RequestParam("poster_image") MultipartFile posterImage,
	                           Model model) throws IOException {
	       
		 DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		  LocalTime startTime = LocalTime.parse(startTimeStr, timeFormatter);
	        LocalTime endTime = LocalTime.parse(endTimeStr, timeFormatter);
		 
	        byte[] posterImages = posterImage.getBytes();
	        Time sqlStartTime = Time.valueOf(startTime);
	        Time sqlEndTime = Time.valueOf(endTime);
	      
	        Show show = new Show();
	        show.setName(ShowName);
	        show.setCategory(category);
	        show.setLocation(location);
	        show.setDate(date);
	        show.setStartTime(sqlStartTime);
	        show.setEndTime(sqlEndTime);
	        show.setTicketsCount(ticketsCount);
	        show.setPrice(price);
	        show.setPosterImage(posterImages);
	        
	        try {
	        	bookingsDaoImpl.insertShow(show);
	            List<Venue> venueList = serviceDao.getAllVenues();
	            model.addAttribute(VENUE_LIST_ATTRIBUTE, venueList);
	            model.addAttribute("listOfVendors", serviceDao.getAllvendors());
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("error", "Failed to add venue. Please try again.");
	        }
	 
	        return ADMIN_JSP;
}
	 
}
