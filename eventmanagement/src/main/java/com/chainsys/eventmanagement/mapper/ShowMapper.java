package com.chainsys.eventmanagement.mapper;

import java.sql.Blob;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.jdbc.core.RowMapper;


import com.chainsys.eventmanagement.model.Show;

public class ShowMapper implements RowMapper<Show>{

	@Override
	public Show mapRow(ResultSet rs, int rowNum) throws SQLException {
		
	    Show show = new Show();
        show.setId(rs.getInt("id"));
        show.setName(rs.getString("name"));
        show.setCategory(rs.getString("category"));
        show.setLocation(rs.getString("location"));
        show.setDate((Date) rs.getObject("date"));
        show.setStartTime((Time) rs.getObject("start_time"));
        show.setEndTime((Time) rs.getObject("end_time"));
        
        show.setTicketsCount(rs.getInt("tickets_count"));
        show.setPrice(rs.getInt("ticket_price"));
        Blob blob = rs.getBlob("poster_image");
        if (blob != null) {
            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
            show.setPosterImage(imageBytes);
        }
		return show;
	}

}
