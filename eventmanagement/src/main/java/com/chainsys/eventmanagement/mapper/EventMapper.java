package com.chainsys.eventmanagement.mapper;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.eventmanagement.model.Event;

public class EventMapper implements RowMapper<Event> {

	@Override
	public Event mapRow(ResultSet rs, int rowNum) throws SQLException {
		 Event event = new Event();
		 event.setEventId(rs.getInt("event_id"));
		 event.setUserName(rs.getString("user_name"));
	        event.setVenueName(rs.getString("venue_name"));
	        event.setPhotographyName(rs.getString("photography_vendor"));
	        event.setCateringName(rs.getString("catering_vendor"));
	        event.setEventName(rs.getString("event_name"));
	        Date eventDate = rs.getDate("event_date");
	        if (eventDate != null) {
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	            String formattedDate = dateFormat.format(eventDate);
	            event.setDateString(formattedDate);
	        }
		return event;
	}

}
