package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO{

	
	private Connection conn;
	public CartDAOImpl(Connection conn) {
		
		this.conn=conn;
	}
	
	
	
	
	@Override
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			
			String sql="insert into cart(tid, uid, cname, ctype, cprice, clocation, cdesc, cdeadline) values(?,?,?,?,?,?,?,?) ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getTid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getCname());
			ps.setString(4, c.getCtype());
			ps.setString(5, c.getCprice());
			ps.setString(6, c.getClocation());
			ps.setString(7, c.getCdesc());
			ps.setString(8, c.getCdeadline());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return f;
	}




	
	public List<Cart> getTenderbyUser(int userId) {
		
		List<Cart> list=new ArrayList<Cart>();
		Cart c=null;
		
		
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			    c=new Cart();
			    c.setCid(rs.getInt(1));
			    c.setTid(rs.getInt(2));
			    c.setUid(rs.getInt(3));			    
			    c.setCname(rs.getString(4));
			    c.setCtype(rs.getString(5));
			    c.setCprice(rs.getString(6));
			    c.setClocation(rs.getString(7));
			    c.setCdesc(rs.getString(8));
			    c.setCdeadline(rs.getString(9));
			    list.add(c);
			}

			
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return list;
	}




	@Override
	public boolean deleteUserTender(int tid, int uid, int cid) {
		boolean f=false;
		
		try {
			String sql="delete from cart where tid=? and uid=? and cid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, tid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
		
			int i=ps.executeUpdate();
			if(i==1){
				f=true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}
	
	
	
	
	

}
