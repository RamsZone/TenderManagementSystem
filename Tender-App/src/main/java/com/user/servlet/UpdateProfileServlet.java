package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String crnno=req.getParameter("crnno");
			String password = req.getParameter("password");
			
			User me = new User();
			me.setId(id);
			me.setName(name);
			me.setEmail(email);
			me.setPhno(phno);
			me.setCrnno(crnno);
			
			HttpSession session = req.getSession();

			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.checkPassword(id, password);
			if(f) {
				boolean f2=dao.updateProfile(me);
				if(f2) {
					session.setAttribute("succMsg", "Profile Update Successful ! ");
					resp.sendRedirect("updateprofile.jsp");

					
				}else {
					session.setAttribute("failedMsg", "Something Wrong on Server ! ");
					resp.sendRedirect("updateprofile.jsp");
					
					
				}
				
			}else {
				session.setAttribute("failedMsg", "Your Password is Incorrect ! ");
				resp.sendRedirect("updateprofile.jsp");
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
