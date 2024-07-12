package com.chainsys.eventmanagement.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.model.Show;
@Repository
public interface BookingsDAO {
	
	public List<Show> getAllShows(String category);
	public void updateTicketsCount(int showId,int tickets);
	public void storeBookingsDetails(Show show);
	public Show getBookingDetails(int showId) ;
}
