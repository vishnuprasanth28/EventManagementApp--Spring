package com.chainsys.eventmanagement.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.eventmanagement.dao.UserDAO;
import com.chainsys.eventmanagement.exception.EmailException;
import com.chainsys.eventmanagement.exception.PasswordException;
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
	 private static final String REGISTRATION_JSP = "registration.jsp";
	 private static final String ERROR_CONSTANT = "error";
	@RequestMapping("/index")
	public String view() {
		
		
		return "index.jsp";
	}
	
	

	    @PostMapping("/registerUser")
	    public String registerUser(@RequestParam("username") String userName,@RequestParam("mobile") String contact,@RequestParam("email") String email,@RequestParam("confirmPassword") String confirmPassword,Model model) 
	    		throws EmailException, PasswordException {
	       
	    	
	        
	        if (!userValidator.validateUsername(userName)) {
	            model.addAttribute(ERROR_CONSTANT, "Invalid username format");
	            return REGISTRATION_JSP;
	            
	        }
	       
	        
	        if (!userValidator.validateMobile(contact)) {
	            model.addAttribute(ERROR_CONSTANT, "Invalid mobile number format");
	            return REGISTRATION_JSP;
	        }
	        
	        if (!userValidator.validateEmail(email)) {
	            model.addAttribute(ERROR_CONSTANT, "Invalid email format");
	            return REGISTRATION_JSP;
	        }
	       
	        if (!userValidator.passwordsMatch(confirmPassword)) {
	            model.addAttribute(ERROR_CONSTANT, "Passwords do not match");
	            return REGISTRATION_JSP;
	        }
	        
	        User user = new User();
	        user.setUserName(userName);
	        user.setPassword(confirmPassword);
	        user.setMobile(contact);
	        user.setEmail(email);
	        try {
	        	userDao.insertUser(user);
	        	 model.addAttribute("success", "Registration success");
	        	 return "user.jsp"; 
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute(ERROR_CONSTANT, "Registration failed");
	            return REGISTRATION_JSP;
	        }
	        
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
	                return "redirect:/user.jsp?error=true";
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return ERROR_CONSTANT; 
	    }
	    
	    @PostMapping("/logout")
	     public String userLogout(HttpSession session, HttpServletRequest request) {
	         session = request.getSession(false);
	         if(session != null) {
	             session.invalidate();
	         }
	         
	         return "redirect:/index.jsp";
	     }
	}
	

