package com.chainsys.eventmanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.eventmanagement.model.User;

public class UserMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setUserId(rs.getInt("user_id"));
		user.setUserName(rs.getString("username"));
		user.setEmail(rs.getString("email"));
		user.setMobile(rs.getString("mobile"));
		
		
		return user;
	}

}
