package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Forum_Order;
import com.entity.Tender_Order;

public class ForumDAOImpl implements ForumDAO {

	private Connection conn;

	public ForumDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveForum(List<Forum_Order> flist) {
		boolean f = false;

		try {
			String sql = "insert into forum(forumid,  fquestion, vendorname, email, phno, crnno, status) values(?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Forum_Order o : flist) {
				ps.setString(1, o.getForumid());
				//ps.setString(2, o.getTname());
				// ps.setString(3, o.getFtitle());
				ps.setString(2, o.getFquestion());
				ps.setString(3, o.getVfname());
				ps.setString(4, o.getVfemail());
				ps.setString(5, o.getVfphno());
				ps.setString(6, o.getVfcrnno());
				ps.setString(7, o.getStatus());
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

	public List<Forum_Order> getTender(String email) {
		List<Forum_Order> list = new ArrayList<Forum_Order>();
		Forum_Order f = null;
		try {

			String sql = "select * from forum where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = new Forum_Order();
				f.setId(rs.getInt("id"));
				f.setForumid(rs.getString("forumid"));
				//f.setTname(rs.getString("ftendername"));
				// f.setFtitle(rs.getString("ftitle"));
				f.setFquestion(rs.getString("fquestion"));
				f.setVfname(rs.getString("vendorname"));
				f.setVfcrnno(rs.getString("crnno"));
				f.setStatus(rs.getString("status"));
				f.setVfemail(rs.getString("email"));
				f.setVfphno(rs.getString("phno"));
				list.add(f);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public List<Forum_Order> getAllOrder() {
		List<Forum_Order> list = new ArrayList<Forum_Order>();
		Forum_Order f = null;
		try {

			String sql = "select * from forum order by vendorname ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = new Forum_Order();
				f.setId(rs.getInt("id"));
				f.setForumid(rs.getString("forumid"));
				//f.setTname(rs.getString("ftendername"));
				// f.setFtitle(rs.getString("ftitle"));
				f.setFquestion(rs.getString("fquestion"));
				f.setVfname(rs.getString("vendorname"));
				f.setVfcrnno(rs.getString("crnno"));
				f.setStatus(rs.getString("status"));
				f.setVfemail(rs.getString("email"));
				f.setVfphno(rs.getString("phno"));
				list.add(f);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public Forum_Order getTenderById(int id) {
		Forum_Order f = null;
		try {
			// Write your SQL query to retrieve Tender_Order by ID
			String sql = "SELECT * FROM forum WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				f = new Forum_Order();
				// Populate the Tender_Order object with data from the ResultSet
				f.setId(rs.getInt("id"));
				f.setStatus(rs.getString("status"));
				f.setVfemail(rs.getString("email"));
				// Populate other attributes similarly
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean answerforum(int id, String status, String email) {
		boolean f = false;
		try {
			String sql = "update forum set status=? where id=? and email=?";
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

//		public List<Forum_Order> getAllVendorQuestions() {
//		    List<Forum_Order> questions = new ArrayList<>();
//		    try {
//		        String sql = "SELECT * FROM forum ORDER BY id DESC";
//		        PreparedStatement ps = conn.prepareStatement(sql);
//		        ResultSet rs = ps.executeQuery();
//		        while (rs.next()) {
//		            Forum_Order f = new Forum_Order();
//		            f.setId(rs.getInt("id"));
//		            f.setStatus(rs.getString("status"));
//		            f.setVfemail(rs.getString("email"));
//		            f.setFquestion(rs.getString("fquestion"));
//		            f.setForumid(rs.getString("forumid"));
//		            f.setTname(rs.getString("ftendername"));
//		            //f.setFtitle(rs.getString("ftitle"));
//		            f.setVfname(rs.getString("vendorname"));
//		            f.setVfcrnno(rs.getString("crnno"));
//		            f.setVfphno(rs.getString("phno"));
//		            questions.add(f);
//		        }
//		    } catch (SQLException e) {
//		        // Log SQL exceptions
//		        System.out.println("SQL Exception: " + e.getMessage());
//		        e.printStackTrace();
//		    } catch (Exception e) {
//		        // Log any other exceptions
//		        System.out.println("Exception: " + e.getMessage());
//		        e.printStackTrace();
//		    }
//		    return questions;
//		}



	

}
