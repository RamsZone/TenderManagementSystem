package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TenderDAOImpl;
import com.DB.DBConnect;

@SuppressWarnings("serial")
@WebServlet("/delete")
public class TendersDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			
			TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
            boolean f = dao.deleteTenders(id);
            
            HttpSession session = req.getSession();
            if(f) {
                session.setAttribute("succMsg", "Tender Delete Successfully!");
                resp.sendRedirect("admin/all_tenders.jsp");
            } else {
                session.setAttribute("failedMsg", "SOMETHING WRONG ON SERVER!");
                resp.sendRedirect("admin/all_tenders.jsp");
            }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
