package com.chainsys.eventmanagement.mapper;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.eventmanagement.model.Vendor;

public class VendorServiceMapper implements RowMapper<Vendor> {

	@Override
	public Vendor mapRow(ResultSet rs, int rowNum) throws SQLException {
		Vendor vendor = new Vendor();
        vendor.setVendorId(rs.getInt("vendor_id"));
        vendor.setVendorName(rs.getString("vendor_name"));
        vendor.setContact(rs.getString("vendor_contact"));
       
        vendor.setPrice(rs.getInt("price"));
        Blob blob = rs.getBlob("profile");
        if (blob != null) {
            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
            vendor.setImage(imageBytes);
        }
	return vendor;
	}

}
