package com.DAO;

import com.entity.User;

public interface UserDAO{
	public boolean userRegister(User me);
	public boolean checkPassword(int id, String ps);
	public boolean updateProfile(User me);
	public boolean checkUser(String em);
}