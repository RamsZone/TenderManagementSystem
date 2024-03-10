package com.DAO;

import java.util.List;

import com.entity.Cart;


public interface CartDAO {
	
	public boolean addCart(Cart c);
	public List<Cart >getTenderbyUser(int userId);
	public boolean deleteUserTender (int tid, int uid, int cid);
	

}
