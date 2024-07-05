package com.chainsys.eventmanagement.model;

public class Event {

	private String userName;
	private String venueName;
	private String photographyName;
	private String cateringName;
	private String eventName;
	private int venueId;  
	private int venuePrice;
	private String eventType;
	private String dateString;
	private int photoGraphyId;
	
	private int photographyPrice;
	private int cateringId;
	private int cateringPrice;
	private double estimatedPrice;
	private int userId;
	private int eventId;
	
	public Event() {
		
	}
	
	@Override
	public String toString() {
		return "Event [userName=" + userName + ", venueName=" + venueName + ", photographyName=" + photographyName
				+ ", cateringName=" + cateringName + ", eventName=" + eventName + ", venueId=" + venueId
				+ ", venuePrice=" + venuePrice + ", eventType=" + eventType + ", dateString=" + dateString
				+ ", photoGraphyId=" + photoGraphyId + ", photographyPrice=" + photographyPrice + ", cateringId="
				+ cateringId + ", cateringPrice=" + cateringPrice + ", estimatedPrice=" + estimatedPrice + ", userId="
				+ userId + ", eventId=" + eventId + "]";
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
	public String getPhotographyName() {
		return photographyName;
	}
	public void setPhotographyName(String photographyName) {
		this.photographyName = photographyName;
	}
	public String getCateringName() {
		return cateringName;
	}
	public void setCateringName(String cateringName) {
		this.cateringName = cateringName;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public int getVenueId() {
		return venueId;
	}
	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}
	public int getVenuePrice() {
		return venuePrice;
	}
	public void setVenuePrice(int venuePrice) {
		this.venuePrice = venuePrice;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public String getDateString() {
		return dateString;
	}
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}
	public int getPhotoGraphyId() {
		return photoGraphyId;
	}
	public void setPhotoGraphyId(int photoGraphyId) {
		this.photoGraphyId = photoGraphyId;
	}
	public int getPhotographyPrice() {
		return photographyPrice;
	}
	public void setPhotographyPrice(int photographyPrice) {
		this.photographyPrice = photographyPrice;
	}
	public int getCateringId() {
		return cateringId;
	}
	public void setCateringId(int cateringId) {
		this.cateringId = cateringId;
	}
	public int getCateringPrice() {
		return cateringPrice;
	}
	public void setCateringPrice(int cateringPrice) {
		this.cateringPrice = cateringPrice;
	}
	public double getEstimatedPrice() {
		return estimatedPrice;
	}
	public void setEstimatedPrice(double estimatedPrice) {
		this.estimatedPrice = estimatedPrice;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	
}
