package com.chainsys.eventmanagement.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.eventmanagement.dao.UserDAO;
import com.chainsys.eventmanagement.model.User;
import com.chainsys.eventmanagement.validation.UserValidator;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class UserController {
	
	@Autowired
	UserDAO userDao;
	
	 @Autowired
	    private UserValidator userValidator;
	
	@RequestMapping("/index")
	public String view() {
		
		
		return "index.jsp";
	}
	
	 @PostMapping("/adminLogin")
	    public String adminLogin(@RequestParam("Username") String userName,@RequestParam("Password") String password, HttpSession session, Model model) {
	      
	        User user = new User();
	        user.setUserName(userName);
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
	    public String registerUser(@RequestParam("username") String UserName,@RequestParam("mobile") String contact,@RequestParam("email") String email,@RequestParam("confirmPassword") String confirmPassword,Model model) {
	       
	    	
	        
	        if (!userValidator.validateUsername(UserName)) {
	            model.addAttribute("error", "Invalid username format");
	            return "registration.jsp";
	            
	        }
	       
	        
	        if (!userValidator.validateMobile(contact)) {
	            model.addAttribute("error", "Invalid mobile number format");
	            return "registration.jsp";
	        }
	        
	        if (!userValidator.validateEmail(email)) {
	            model.addAttribute("error", "Invalid email format");
	            return "registration.jsp";
	        }
	       
	        if (!userValidator.passwordsMatch(confirmPassword)) {
	            model.addAttribute("error", "Passwords do not match");
	            return "registration.jsp";
	        }
	        
	        User user = new User();
	        user.setUserName(UserName);
	        user.setPassword(confirmPassword);
	        user.setMobile(contact);
	        user.setEmail(email);
	        try {
	        	userDao.insertUser(user);
	        	 model.addAttribute("success", "Registration success");
	             
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "registration.jsp"; 
	    }

	    @PostMapping("/userLogin")
	    public String userLogin(HttpSession session,@RequestParam("Username") String userName,@RequestParam("Password") String password) {
	       

	        User user = new User();
	        user.setUserName(userName);
	        user.setPassword(password);
	        
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
	

