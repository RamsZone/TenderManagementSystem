package com.DAO;

import java.util.List;

import com.entity.Forum_Order;
import com.entity.Tender_Order;


public interface ForumDAO {
	
	public boolean saveForum(List<Forum_Order> f);
	public List<Forum_Order> getTender(String email);
	public List<Forum_Order> getAllOrder();
	public Forum_Order getTenderById(int id);
	public boolean answerforum(int id, String status, String email);


	
}
