package com.chainsys.eventmanagement.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.eventmanagement.model.User;

@Repository
public interface UserDAO{
	public int insertUser(User user);
	 public boolean userLogin(User user);
	 public boolean adminLogin(User user);
	 public int getUserId(User user);
}
