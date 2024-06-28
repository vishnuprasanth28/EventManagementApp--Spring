package com.chainsys.eventmanagement.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.model.User;
@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	public int insertUser(User user) {
		String saveUser ="INSERT INTO Users (username, password, email, mobile) VALUES (?, ?, ?, ?)";
		Object[] params = {user.getUserName(),user.getPassword(),user.getEmail(),user.getMobile()};
	
		return jdbcTemplate.update(saveUser, params);
	}
	  public boolean userLogin(User user) {
	        String query = "SELECT username FROM Users WHERE username=? AND password=? AND is_admin=0";
	        try {
	        	 Object[] paras={user.getUserName(), user.getPassword()};
	            String username = jdbcTemplate.queryForObject(query, String.class, paras);
	            return username != null;
	        } catch (EmptyResultDataAccessException e) {
	            return false;
	        }
	    }
}
