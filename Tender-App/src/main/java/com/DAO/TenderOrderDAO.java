package com.DAO;

import java.util.List;

import com.entity.Tender_Order;

public interface TenderOrderDAO {
	
	
	public boolean saveOrder(List<Tender_Order> o);
	public List<Tender_Order> getTender(String email);
	public List<Tender_Order> getAllOrder();
	
//	public Tender_Order getTenderbyemail(String email);
	public Tender_Order getTenderById(int id);
	public boolean updateCommentstatus(int id, String status, String email);

}
