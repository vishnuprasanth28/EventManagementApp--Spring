package com.chainsys.eventmanagement.mapper;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.eventmanagement.model.Venue;

public class VenueMapper  implements RowMapper<Venue> {

	@Override
	public Venue mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Venue venue = new Venue();
        venue.setVenueId(rs.getInt("venue_id"));
        venue.setVenueName(rs.getString("venue_name"));
        venue.setLocation(rs.getString("venue_address"));
        venue.setCapacity(rs.getInt("capacity"));
        venue.setContactPhone(rs.getString("contact_phone"));
        venue.setPrice(rs.getInt("price"));
        
        
        Blob blob = rs.getBlob("venue_image");
        if (blob != null) {
            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
            venue.setImage(imageBytes);
        }

        return venue;
    }
	

}
