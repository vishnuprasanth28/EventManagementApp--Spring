package com.chainsys.eventmanagement.dao;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.mapper.ShowMapper;

import com.chainsys.eventmanagement.model.Show;

@Repository
public class BookingsDAOImpl implements BookingsDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;
	private static final Random random = new Random();
	@Override
	public List<Show> getAllShows(String category) {
		String toGetShows = "SELECT id,name,category,location,date,start_time,end_time,tickets_count,ticket_price,poster_image FROM shows WHERE (DATE(date) != CURDATE() OR TIME(start_time) <= ADDTIME(CURTIME(), '02:00:00'))  AND category = ? ORDER BY category";
		return jdbcTemplate.query(toGetShows, new ShowMapper(), category);
	}

	public void insertShow(Show show) {
		String toAddShow = "insert into shows (name, category, location, date, start_time, end_time, tickets_count,ticket_price,poster_image)values(?,?,?,?,?,?,?,?,?)";
		Object[] showParams = { show.getName(), show.getCategory(), show.getLocation(), show.getDate(),
				show.getStartTime(), show.getEndTime(), show.getTicketsCount(), show.getPrice(),
				show.getPosterImage() };
		jdbcTemplate.update(toAddShow, showParams);
	}

	@Override
	public void updateTicketsCount(int showId, int tickets) {
		String toUpdateTickets = "UPDATE shows SET tickets_count = tickets_count - ? WHERE id = ?";
		Object[] params = { showId, tickets };
		jdbcTemplate.update(toUpdateTickets, params);
	}

	@Override
	public void storeBookingsDetails(Show show) {
		String toStoreBookings = "insert into ticket_bookings (user_id,show_id,tickets_count,amount) values(?,?,?,?)";
		Object[] bookingParas = { show.getUserId(), show.getId(), show.getTicketsBooked(), show.getPrice() };
		jdbcTemplate.update(toStoreBookings, bookingParas);
	}

	@Override
	public Show getBookingDetails(int showId) {
		String toGetShowDetails = "select name, location, date, start_time, end_time from shows where id=?";
		RowMapper<Show> rowMapper = (rs, rowNum) -> {
			Show show = new Show();
			show.setName(rs.getString("name"));
			show.setLocation(rs.getString("location"));
			show.setDate(rs.getDate("date"));
			show.setStartTime(rs.getTime("start_time"));
			show.setEndTime(rs.getTime("end_time"));
			return show;
		};

		return jdbcTemplate.queryForObject(toGetShowDetails, rowMapper, showId);
	}

	public static String generateTicketId() {
		int length = 8;
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder ticketId = new StringBuilder();
		for (int i = 0; i < length; i++) {
			char randomChar = characters.charAt(random.nextInt(characters.length()));
			ticketId.append(randomChar);
		}

		return ticketId.toString();
	}

}
