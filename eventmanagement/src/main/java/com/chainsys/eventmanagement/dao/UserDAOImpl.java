package com.chainsys.eventmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.mapper.UserMapper;
import com.chainsys.eventmanagement.model.User;
@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	@Override
	public int insertUser(User user) {
		String saveUser ="INSERT INTO Users (username, password, email, mobile) VALUES (?, ?, ?, ?)";
		Object[] params = {user.getUserName(),user.getPassword(),user.getEmail(),user.getMobile()};
	
		return jdbcTemplate.update(saveUser, params);
	}
	
	@Override
	  public boolean userLogin(User user) {
	        String query = "SELECT username FROM Users WHERE username=? AND password=? AND is_admin=0";
	        try {
	        	 Object[] paras={user.getUserName(), user.getPassword()};
	            String userName = jdbcTemplate.queryForObject(query, String.class, paras);
	            
	            return userName != null;
	        } catch (EmptyResultDataAccessException e) {
	            return false;
	        }
	    }
	@Override
	  public boolean adminLogin(User user) {
	        String query = "SELECT username FROM Users WHERE username=? AND password=? AND is_admin=1";
	        try {
	        	 Object[] paras={user.getUserName(), user.getPassword()};
	            String username = jdbcTemplate.queryForObject(query, String.class, paras);
	            return username != null;
	        } catch (EmptyResultDataAccessException e) {
	            return false;
	        }
	    } 
	@Override
	  public int getUserId(User user) {
		  String getId="select user_id from Users where username=?";
		  Integer userId = jdbcTemplate.queryForObject(getId,Integer.class, new Object[]{user.getUserName()});
		  return userId != null? userId :0; 
	}
		  
	  }

