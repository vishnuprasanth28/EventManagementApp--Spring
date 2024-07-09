package com.chainsys.eventmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.mapper.ShowMapper;

import com.chainsys.eventmanagement.model.Show;

@Repository
public class BookingsDAOImpl implements BookingsDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Show> getAllShows(String category){
		String toGetShows ="SELECT id,name,category,location,date,start_time,end_time,tickets_count,ticket_price,poster_image FROM shows WHERE (DATE(date) != CURDATE() OR TIME(start_time) <= ADDTIME(CURTIME(), '02:00:00'))  AND category = ? ORDER BY category";
		return jdbcTemplate.query(toGetShows,new ShowMapper(), new Object[] {category} );
	}
	public void insertShow(Show show) {
		String toAddShow="insert into shows (name, category, location, date, start_time, end_time, tickets_count,ticket_price,poster_image)values(?,?,?,?,?,?,?,?,?)";
		Object[] showParams = {show.getName(),show.getCategory(),show.getLocation(),show.getDate(),show.getStartTime(),show.getEndTime(),show.getTicketsCount(),show.getPrice(),show.getPosterImage()};
		jdbcTemplate.update(toAddShow, showParams);
	}
	@Override
	public void updateTicketsCount(int showId,int tickets) {
		String toUpdateTickets="UPDATE shows SET tickets_count = tickets_count - ? WHERE id = ?";
		Object[] params = {showId,tickets};
		jdbcTemplate.update(toUpdateTickets, params);
	}
	@Override
	public void storeBookingsDetails(Show show) {
		String toStoreBookings="insert into ticket_bookings (user_id,show_id,tickets_count,amount) values(?,?,?,?)";
		Object[] bookingParas = {show.getUserId(),show.getId(),show.getTicketsBooked(),show.getPrice()};
		jdbcTemplate.update(toStoreBookings, bookingParas);
		}
}
