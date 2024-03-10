package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Tender_Order;

public class TenderOrderImpl implements TenderOrderDAO {

	private Connection conn;

	public TenderOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean saveOrder(List<Tender_Order> olist) {
		boolean f = false;

		try {
			String sql = "insert into tender_order(orderid, email, phno, vendor_name, tender_name, bidamount, deadline, message, status, crnno) values(?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Tender_Order o : olist) {
				ps.setString(1, o.getOrderid());
				ps.setString(2, o.getEmail());
				ps.setString(3, o.getPhno());
				ps.setString(4, o.getVendorname());
				ps.setString(5, o.getTendername());
				ps.setString(6, o.getPrice());
				ps.setString(7, o.getDeadline());
				ps.setString(8, o.getMessage());
				ps.setString(9, o.getStatus());
				ps.setString(10, o.getCrnno());
				ps.addBatch();

			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return f;
	}
	
	public List<Tender_Order> getTender(String email) {
		List<Tender_Order> list = new ArrayList<Tender_Order>();
		Tender_Order o = null;
		try {

			String sql = "select * from tender_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				o = new Tender_Order();
				o.setId(rs.getInt("id"));
				o.setTendername(rs.getString("tender_name"));
				o.setDeadline(rs.getString("deadline"));
				o.setEmail(rs.getString("email"));
				o.setMessage(rs.getString("message"));
				o.setPhno(rs.getString("phno"));
				o.setStatus(rs.getString("status"));
				o.setVendorname(rs.getString("vendor_name"));
				o.setOrderid(rs.getString("orderid"));
				o.setPrice(rs.getString("bidamount"));
				o.setCrnno(rs.getString("crnno"));
				list.add(o);

				
				
				

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	
	public List<Tender_Order> getAllOrder() {
		List<Tender_Order> list = new ArrayList<Tender_Order>();
		Tender_Order o = null;
		try {

			String sql = "select * from tender_order order by tender_name DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				o = new Tender_Order();
				o.setId(rs.getInt("id"));
				o.setTendername(rs.getString("tender_name"));
				o.setDeadline(rs.getString("deadline"));
				o.setEmail(rs.getString("email"));
				o.setMessage(rs.getString("message"));
				o.setPhno(rs.getString("phno"));
				o.setStatus(rs.getString("status"));
				o.setVendorname(rs.getString("vendor_name"));
				o.setOrderid(rs.getString("orderid"));
				o.setPrice(rs.getString("bidamount"));
				o.setCrnno(rs.getString("crnno"));
				list.add(o);

				
				
				

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	
//	public Tender_Order getTenderbyemail(String email) {
//		
//		Tender_Order o = null;
//		try {
//
//			String sql = "select * from tender_order where email=?";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setString(1, email);
//			
//			ResultSet rs = ps.executeQuery();
//			while (rs.next())
//			{
//				o = new Tender_Order();
//				o.setId(rs.getInt("id"));
//				o.setTendername(rs.getString("tender_name"));
//				o.setDeadline(rs.getString("deadline"));
//				o.setEmail(rs.getString("email"));
//				o.setMessage(rs.getString("message"));
//				o.setPhno(rs.getString("phno"));
//				o.setStatus(rs.getString("status"));
//				o.setVendorname(rs.getString("vendor_name"));
//				o.setOrderid(rs.getString("orderid"));
//				o.setPrice(rs.getString("bidamount"));
//
//				
//				
//				
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return o;
//
//	
//	
//	}
	public Tender_Order getTenderById(int id) {
	    Tender_Order o = null;
	    try {
	        // Write your SQL query to retrieve Tender_Order by ID
	        String sql = "SELECT * FROM tender_order WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            o = new Tender_Order();
	            // Populate the Tender_Order object with data from the ResultSet
	            o.setId(rs.getInt("id"));
	            o.setStatus(rs.getString("status"));
	            o.setEmail(rs.getString("email"));
	            // Populate other attributes similarly
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return o;
	}

	
//	public boolean updateCommentstatus(int id, String status) {
//	    boolean f = false;
//	    try {
//	        String sql = "update tender_order set status=? where id=?";
//	        PreparedStatement ps = conn.prepareStatement(sql);
//	        ps.setInt(1, id);
//	        ps.setString(2, status);
//	        int i = ps.executeUpdate();
//	        if (i == 1) {
//	            f = true;
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//	    return f;
//	}
	
	public boolean updateCommentstatus(int id, String status, String email) {
	    boolean f = false;
	    try {
	        String sql = "update tender_order set status=? where id=? and email=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, status);
	        ps.setInt(2, id);
	        ps.setString(3, email);
	        
	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        } else {
	            // Log a warning if the update affected 0 or more than 1 row
	            System.out.println("Unexpected number of rows affected by update: " + i);
	        }
	    } catch (SQLException e) {
	        // Log SQL exceptions
	        System.out.println("SQL Exception: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        // Log any other exceptions
	        System.out.println("Exception: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return f;
	}

}
