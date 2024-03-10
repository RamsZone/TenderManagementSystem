package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.entity.User;

public class UserDAOImpl implements UserDAO {
    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean userRegister(User me) {
        boolean f = false;
        try {
            String sql = "Insert into user (name, email, phno, password, crnno) Values (?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, me.getName());
                ps.setString(2, me.getEmail());
                ps.setString(3, me.getPhno());
                ps.setString(4, me.getPassword());
                ps.setString(5, me.getCrnno());

                int i = ps.executeUpdate();
                if (i == 1) {
                    f = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

	public User login(String email, String password) {
		User me=null;
		
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
			    me = new User();
			    me.setId(rs.getInt(1));
			    me.setName(rs.getString(2));
			    me.setEmail(rs.getString(3));
			    me.setPhno(rs.getString(4));
			    me.setPassword(rs.getString(5));
			    me.setCrnno(rs.getString(6));
			    
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return me;
		
	}

	public boolean checkPassword(int id, String ps) {
		boolean f=true;
		try {
			
			String sql = "select * from user where id=?, password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				f=false; 
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}
	
	
	public boolean updateProfile(User me) {
		boolean f = false;
        try {
            String sql = "update user set name=?, email=?, phno=?, crnno=? where id=?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, me.getName());
                ps.setString(2, me.getEmail());
                ps.setString(3, me.getPhno());
                ps.setString(4, me.getCrnno());
                ps.setInt(5, me.getId());

                int i = ps.executeUpdate();
                if (i == 1) {
                    f = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
		
		
		
		 
	
	}


	@Override
	public boolean checkUser(String em) {
		
		boolean f=true;
		
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				f=false;
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
}
