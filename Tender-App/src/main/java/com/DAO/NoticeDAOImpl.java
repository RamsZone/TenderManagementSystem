package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.NoticeDtls;
import com.entity.Tenderdtls;

public class NoticeDAOImpl implements NoticeDAO {
    
    private Connection conn;

    public NoticeDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addNotices(NoticeDtls t) {
        boolean f = false;
        try {
            String sql = "INSERT INTO notice_dtls (ntitle, ndesc) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, t.getNtitle());
            ps.setString(2, t.getnDesc());
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
	public List<NoticeDtls> getAllNotices() {
	    List<NoticeDtls> noticelist = new ArrayList<NoticeDtls>();
	    try {
	        String sql = "select * from notice_dtls";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            NoticeDtls t = new NoticeDtls(); // Create a new instance for each notice
	            t.setNid(rs.getInt(1));
	            t.setNtitle(rs.getString(2));
	            t.setDesc(rs.getString(3));
	            noticelist.add(t);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return noticelist; // Return the list of notices
	}

    
    
}
