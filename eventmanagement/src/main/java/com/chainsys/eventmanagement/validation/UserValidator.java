package com.chainsys.eventmanagement.validation;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

import com.chainsys.eventmanagement.exception.EmailException;
import com.chainsys.eventmanagement.exception.PasswordException;

@Component
public class UserValidator {

	

    public boolean validateUsername(String username) {
       
        String regex = "[A-Za-z]+";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(username);
        return matcher.matches();
    }

    public boolean validateMobile(String mobile) {
       
        String regex = "^\\d{10}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(mobile);
        return matcher.matches();
    }

    public boolean validateEmail(String email) throws EmailException {
       
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[a-zA-Z]{2,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean passwordsMatch(String confirmPassword) throws PasswordException{
    	String regex = "(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(confirmPassword);
        Boolean password= matcher.matches();
        if(Boolean.TRUE.equals(password)) {
        	return true;
        	
        }else {
        	  
        	throw new PasswordException();
        
        }
      
    }
}
