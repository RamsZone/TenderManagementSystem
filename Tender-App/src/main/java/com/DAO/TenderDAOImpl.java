package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Tenderdtls;

public class TenderDAOImpl implements TenderDAO {

	private Connection conn;

	public TenderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Tenderdtls> getAllTenders() {
		List<Tenderdtls> list = new ArrayList<Tenderdtls>();
		try {
			String sql = "select * from tender_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Tenderdtls t = new Tenderdtls();
				t.setTenderid(rs.getInt("tenderid"));
				t.setTendername(rs.getString("tendername"));
				t.setTendertype(rs.getString("tendertype"));
				t.setBaseprice(rs.getString("baseprice"));
				t.setDeadline(rs.getString("deadline"));
				t.setLocation(rs.getString("location"));
				t.setDescription(rs.getString("description"));
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean addtenders(Tenderdtls t) {
		boolean f = false;
		try {
			String sql = "insert into tender_dtls(tenderid, tendername, tendertype, baseprice, deadline, location, description) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, t.getTenderid()); // Set the tenderId
			ps.setString(2, t.getTendername());
			ps.setString(3, t.getTendertype());
			ps.setString(4, t.getBaseprice());
			ps.setString(5, t.getDeadline());
			ps.setString(6, t.getLocation());
			ps.setString(7, t.getDescription());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Tenderdtls getTenderbyId(int id) {
		Tenderdtls t = null;
		try {
			String sql = "select * from tender_dtls where tenderid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				t = new Tenderdtls();
				t.setTenderid(rs.getInt("tenderid"));
				t.setTendername(rs.getString("tendername"));
				t.setTendertype(rs.getString("tendertype"));
				t.setBaseprice(rs.getString("baseprice"));
				t.setDeadline(rs.getString("deadline"));
				t.setLocation(rs.getString("location"));
				t.setDescription(rs.getString("description"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}

	public boolean updateEditTenders(Tenderdtls t) {
		boolean f = false;
		try {
			String sql = "UPDATE tender_dtls SET tendername=?, tendertype=?, baseprice=?, deadline=?, location=?, description=? WHERE tenderid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, t.getTendername());
			ps.setString(2, t.getTendertype());
			ps.setString(3, t.getBaseprice());
			ps.setString(4, t.getDeadline());
			ps.setString(5, t.getLocation());
			ps.setString(6, t.getDescription());
			ps.setInt(7, t.getTenderid());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteTenders(int id) {
		boolean f = false;

		try {
			String sql = "DELETE FROM tender_dtls WHERE tenderid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Tenderdtls> getNewTender() {
		List<Tenderdtls> list = new ArrayList<Tenderdtls>();
		try {
			String sql = "SELECT * FROM tender_dtls order by tenderid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 5) {
				Tenderdtls t = new Tenderdtls();
				t.setTenderid(rs.getInt("tenderid"));
				t.setTendername(rs.getString("tendername"));
				t.setTendertype(rs.getString("tendertype"));
				t.setBaseprice(rs.getString("baseprice"));
				t.setDeadline(rs.getString("deadline"));
				t.setLocation(rs.getString("location"));
				t.setDescription(rs.getString("description"));
				list.add(t);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Tenderdtls> getTenderbydescorder() {
		List<Tenderdtls> list = new ArrayList<Tenderdtls>();
		try {
			String sql = "SELECT * FROM tender_dtls order by tenderid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Tenderdtls t = new Tenderdtls();
				t.setTenderid(rs.getInt("tenderid"));
				t.setTendername(rs.getString("tendername"));
				t.setTendertype(rs.getString("tendertype"));
				t.setBaseprice(rs.getString("baseprice"));
				t.setDeadline(rs.getString("deadline"));
				t.setLocation(rs.getString("location"));
				t.setDescription(rs.getString("description"));
				list.add(t);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	

	}}
