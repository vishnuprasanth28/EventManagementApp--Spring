package com.chainsys.eventmanagement.model;

import java.util.Arrays;

public class Vendor {

	private int vendorId;
	private String vendorName;
	private String contact;
	private String vendorType;
	private byte[] image;
    private int price;
    
    public Vendor(){
    
    }
    
	@Override
	public String toString() {
		return "Vendor [vendorId=" + vendorId + ", vendorName=" + vendorName + ", contact=" + contact + ", vendorType="
				+ vendorType + ", image=" + Arrays.toString(image) + ", price=" + price + "]";
	}
	public int getVendorId() {
		return vendorId;
	}
	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getVendorType() {
		return vendorType;
	}
	public void setVendorType(String vendorType) {
		this.vendorType = vendorType;
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
}
