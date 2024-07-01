package com.chainsys.eventmanagement.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.eventmanagement.dao.UserDAO;
import com.chainsys.eventmanagement.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class UserController {
	
	@Autowired
	UserDAO userDao;
	
	@RequestMapping("/index")
	public String view() {
		
		
		return "index.jsp";
	}
	
	 @PostMapping("/adminLogin")
	    public String adminLogin(HttpServletRequest request, HttpSession session, Model model) {
	        String name = request.getParameter("Username");
	        String password = request.getParameter("Password");

	        User user = new User();
	        user.setUserName(name);
	        user.setPassword(password);

	        try {
	            if (userDao.adminLogin(user)) {
	                session.setAttribute("admin", user.getUserName());
	             //   model.addAttribute("venueList", dbOperation.getAllVenues());
	              //  model.addAttribute("listOfVendors", dbOperation.getVendor());
	              //  model.addAttribute("bookedEvents", dbOperation.getEvents());
	                return "admin.jsp"; 
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "error"; 
	    }

	    @PostMapping("/registerUser")
	    public String registerUser(@RequestParam("username") String UserName,@RequestParam("mobile") String contact,@RequestParam("email") String email,@RequestParam("confirmPassword") String confirmPassword) {
	       
	        User user = new User();
	        user.setUserName(UserName);
	        user.setPassword(confirmPassword);
	        user.setMobile(contact);
	        user.setEmail(email);

	        try {
	        	userDao.insertUser(user);
	             
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "registration.jsp"; 
	    }

	    @PostMapping("/userLogin")
	    public String userLogin(HttpSession session,@RequestParam("Username") String UserName,@RequestParam("Password") String Password) {
	       

	        User user = new User();
	        user.setUserName(UserName);
	        user.setPassword(Password);
	        System.out.println(UserName);
	        try {
	            if (userDao.userLogin(user)) {
	               user.setUserId(userDao.getUserId(user));
	                session.setAttribute("user", user);
	                return "index.jsp";
	            } else {
	                return "redirect:/login.jsp?error=true";
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "error"; 
	    }
	}
	

