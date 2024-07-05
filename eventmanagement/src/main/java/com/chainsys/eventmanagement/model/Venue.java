package com.chainsys.eventmanagement.model;

import java.util.Arrays;

public class Venue {
	
	 private int venueId;
	    private String venueName;
	    private int capacity;
	    private String location;
	    private byte[] image;
	    private int price;
	    private String contactPhone;
	    
	    public Venue()
	    {
	    	
	    }
	    
		@Override
		public String toString() {
			return "Venue [venueId=" + venueId + ", venueName=" + venueName + ", capacity=" + capacity + ", location="
					+ location + ", image=" + Arrays.toString(image) + ", price=" + price + ", contactPhone="
					+ contactPhone + "]";
		}
		public int getVenueId() {
			return venueId;
		}
		public void setVenueId(int venueId) {
			this.venueId = venueId;
		}
		public String getVenueName() {
			return venueName;
		}
		public void setVenueName(String venueName) {
			this.venueName = venueName;
		}
		public int getCapacity() {
			return capacity;
		}
		public void setCapacity(int capacity) {
			this.capacity = capacity;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public byte[] getImage() {
			return image;
		}
		public void setImage(byte[] image) {
			this.image = image;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getContactPhone() {
			return contactPhone;
		}
		public void setContactPhone(String contactPhone) {
			this.contactPhone = contactPhone;
		}
}
