package com.chainsys.eventmanagement.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.mapper.EventMapper;
import com.chainsys.eventmanagement.mapper.VendorMapper;
import com.chainsys.eventmanagement.mapper.VendorServiceMapper;
import com.chainsys.eventmanagement.mapper.VenueMapper;
import com.chainsys.eventmanagement.model.Event;
import com.chainsys.eventmanagement.model.Vendor;
import com.chainsys.eventmanagement.model.Venue;
@Repository
public class ServiceDAOImpl implements ServiceDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public void addVenue(Venue venue) {
		String venueToAdd ="INSERT INTO Venue (venue_name, venue_address, capacity, contact_phone, price, venue_image) VALUES (?, ?, ?, ?, ?, ?)";
		Object[] venueParams = {venue.getVenueName(),venue.getLocation(),venue.getCapacity(),venue.getContactPhone(),venue.getPrice(),venue.getImage()};
		jdbcTemplate.update(venueToAdd, venueParams);
		}
	@Override
	public void addVendor(Vendor vendor) {
		String toAddVendor="INSERT INTO vendor (vendor_name, vendor_contact, vendor_type, price, profile) VALUES (?, ?, ?, ?, ?)";
		Object[] vendorParams = {vendor.getVendorName(),vendor.getContact(),vendor.getVendorType(),vendor.getPrice(),vendor.getImage()};
		jdbcTemplate.update(toAddVendor, vendorParams);
		
	}
	
	@Override
	public List<Venue> getAllVenues(){
		String toGetVenues ="SELECT venue_id,venue_name, venue_address, capacity, contact_phone, price,venue_image FROM Venue";
		
		return jdbcTemplate.query(toGetVenues, new VenueMapper());
	}
	@Override
	public List<Vendor> getAllvendors(){
		String toGetVendors ="SELECT vendor_id,vendor_name, vendor_contact, vendor_type, price, profile FROM vendor";
		return jdbcTemplate.query(toGetVendors, new VendorMapper());
	}
	@Override
	public void deleteVenue(int id) {
		String queryTodelete="DELETE FROM Venue WHERE venue_id = ?";
		jdbcTemplate.update(queryTodelete, new Object[] {id});
	}
	@Override
	public void updateVenueDetails(Venue venue) {
		String updateVenue = "Update Venue set capacity=?,contact_phone=?,price=? where venue_id=?";
		
		jdbcTemplate.update(updateVenue, new Object[] {venue.getCapacity(),venue.getContactPhone(),venue.getPrice(),venue.getVenueId()});
	}
	@Override
	public void deleteVendor(int id) {
		String toDeleteVendor="DELETE FROM vendor WHERE vendor_id = ?";
		jdbcTemplate.update(toDeleteVendor, new Object[] {id});
	}
	@Override
	public List<Event> getEvents() {
		String eventsBooked ="SELECT e.event_id, u.username AS user_name, v.venue_name, " +
                "pv.vendor_name AS photography_vendor, cv.vendor_name AS catering_vendor, " +
                "e.event_name, e.event_date " +
                "FROM Events e " +
                "INNER JOIN Users u ON e.user_id = u.user_id " +
                "INNER JOIN Venue v ON e.venue_id = v.venue_id " +
                "LEFT JOIN Vendor pv ON e.photography_id = pv.vendor_id " +
                "LEFT JOIN Vendor cv ON e.catering_id = cv.vendor_id";
		return jdbcTemplate.query(eventsBooked, new EventMapper());
	}
	
	public List<Venue> getAvailableVenues(Date date,String location) throws SQLException{
		String selectVenue = "SELECT venue_id,venue_name, venue_address, capacity, contact_phone, price,venue_image FROM Venue WHERE venue_id NOT IN (SELECT venue_id FROM Events WHERE event_date = ?)AND venue_address LIKE CONCAT('%', ?, '%')";
		Object[] parasForVenue= {date,location};
		return jdbcTemplate.query(selectVenue,new VenueMapper(), parasForVenue );
	}
	
	public List<Vendor> getPhotographers(Date date) {
		String selectVendors = "SELECT vendor_id, vendor_name, vendor_contact, price, profile FROM vendor WHERE vendor_type = 'photography' AND NOT EXISTS (SELECT photography_id FROM Events WHERE event_date = ? AND photography_id = vendor_id)";
		return jdbcTemplate.query(selectVendors,new VendorServiceMapper(), new Object[] {date} );
	}
	public List<Vendor> getCatering(Date date) {
		String selectCatering = "SELECT vendor_id, vendor_name, vendor_contact, price, profile FROM vendor WHERE vendor_type = 'Catering' AND NOT EXISTS (SELECT catering_id FROM Events WHERE event_date = ? AND catering_id = vendor_id)";
		return jdbcTemplate.query(selectCatering,new VendorServiceMapper(), new Object[] {date} );
	}
	public void storeBookedEvents(Event event) {
		String storeEvents="insert into Events (user_id,event_name,event_date,venue_id,photography_id,catering_id) values (?,?,?,?,?,?)";
		java.sql.Date eventDate = java.sql.Date.valueOf(event.getDateString());
		Object[] eventParams= {event.getUserId(),event.getEventName(),eventDate,event.getVenueId(),event.getPhotoGraphyId(),event.getCateringId()};
		jdbcTemplate.update(storeEvents, eventParams);
	}
}
