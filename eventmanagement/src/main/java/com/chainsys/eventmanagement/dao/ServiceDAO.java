package com.chainsys.eventmanagement.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.model.Event;
import com.chainsys.eventmanagement.model.Vendor;
import com.chainsys.eventmanagement.model.Venue;
@Repository
public interface ServiceDAO {
	public List<Venue> getAllVenues();
	public void addVenue(Venue venue);
	public List<Vendor> getAllvendors();
	public void deleteVenue(int id);
	public void updateVenueDetails(Venue venue);
	public void addVendor(Vendor vendor);
	public void deleteVendor(int id);
	public List<Event> getEvents();
	
}
