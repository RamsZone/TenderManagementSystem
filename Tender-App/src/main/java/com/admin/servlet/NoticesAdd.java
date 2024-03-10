package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.NoticeDAOImpl;
import com.DB.DBConnect;
import com.entity.NoticeDtls;

@WebServlet("/add_notices")
public class NoticesAdd extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String ntitle = req.getParameter("title");
            String ndesc = req.getParameter("info");
            
            NoticeDtls t = new NoticeDtls(ntitle, ndesc);
            
            // Initialize the DAO and attempt to add the notice
            NoticeDAOImpl dao = new NoticeDAOImpl(DBConnect.getConn());
            boolean f = dao.addNotices(t);
            
            // Set session attributes based on the outcome of the operation
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Notice added successfully");
                resp.sendRedirect("admin/add_notices.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on server");
                resp.sendRedirect("admin/add_notices.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
