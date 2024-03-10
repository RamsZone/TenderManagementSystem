package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.TenderDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Tenderdtls;

@SuppressWarnings("serial")
@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int tid = Integer.parseInt(req.getParameter("tid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			TenderDAOImpl dao=new TenderDAOImpl(DBConnect.getConn());
			Tenderdtls t=dao.getTenderbyId(tid);
			
			Cart c=new Cart();
			c.setTid(tid);
			c.setUid(uid);
			c.setCname(t.getTendername());
			c.setCtype(t.getTendertype());
			c.setCprice(t.getBaseprice());
			c.setClocation(t.getLocation());
			c.setCdesc(t.getDescription());
			c.setCdeadline(t.getDeadline());
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("addCart"," Bid added in review section, You can post your offer there ");
				resp.sendRedirect("Viewall.jsp");
				
			} else {
				
				session.setAttribute("failed","Something wrong on server!!!");
				resp.sendRedirect("Viewall.jsp");
			}
			
			
			
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		
	}
	
	
	
	
	

}
