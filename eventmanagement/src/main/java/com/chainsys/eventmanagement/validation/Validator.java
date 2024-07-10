package com.chainsys.eventmanagement.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
@Component
public class Validator {

	 public boolean validateString(String name) {
	       
	        String regex = "[A-Za-z]+";
	        Pattern pattern = Pattern.compile(regex);
	        Matcher matcher = pattern.matcher(name);
	        return matcher.matches();
	    }
	 public boolean validateContact(String contact) {
	       
	        String regex = "^\\d{10}$";
	        Pattern pattern = Pattern.compile(regex);
	        Matcher matcher = pattern.matcher(contact);
	        return matcher.matches();
	    }
}
