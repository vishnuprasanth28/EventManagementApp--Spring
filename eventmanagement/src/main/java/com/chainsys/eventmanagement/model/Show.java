package com.chainsys.eventmanagement.model;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;
import java.util.Arrays;

public class Show {
	   @Override
	public String toString() {
		return "Show [id=" + id + ", name=" + name + ", category=" + category + ", location=" + location + ", date="
				+ date + ", startTime=" + startTime + ", endTime=" + endTime + ", ticketsCount=" + ticketsCount
				+ ", posterImage=" + Arrays.toString(posterImage) + ", price=" + price + ", ticketsBooked="
				+ ticketsBooked + ", userId=" + userId + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public Time getEndTime() {
		return endTime;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
	public int getTicketsCount() {
		return ticketsCount;
	}
	public void setTicketsCount(int ticketsCount) {
		this.ticketsCount = ticketsCount;
	}
	private int id;
	    private String name;
	    private String category;
	    private String location;
	    private Date date;
	    private Time startTime;
	    private Time endTime;
	    private int ticketsCount;
	    
	    public byte[] getPosterImage() {
			return posterImage;
		}
		public void setPosterImage(byte[] posterImage) {
			this.posterImage = posterImage;
		}
		private byte[] posterImage;
		private int price;
	    public int getTicketsBooked() {
			return ticketsBooked;
		}
		public void setTicketsBooked(int ticketsBooked) {
			this.ticketsBooked = ticketsBooked;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		private int ticketsBooked;
	    private int userId;
	    
		
	public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
	public Show() {
		
	}
	    
}
