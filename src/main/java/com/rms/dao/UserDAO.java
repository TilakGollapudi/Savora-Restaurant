package com.rms.dao;

import com.rms.model.User;

public interface UserDAO {

	boolean registerUser(String fullName, String email, String phone, String password, String address);

	String loginUser(String email, String password);

	User getUserByEmail(String email);
}