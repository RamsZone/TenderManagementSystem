package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.TenderOrderImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Tender_Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String tname = req.getParameter("tname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String vname = req.getParameter("vname");
			String price = req.getParameter("price");
			String deadline = req.getParameter("deadline");
			String message = req.getParameter("message");
			String status = req.getParameter("status");
			String crnno = req.getParameter("crnno");

			String fullorder = price + "," + deadline + "," + message + "," + status;

		    CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist = dao.getTenderbyUser(id);
			if(blist.isEmpty())
			{
				session.setAttribute("failedMsg", "FIRST SELECT THE BID!");
				resp.sendRedirect("checkout.jsp");
			
			}else {
				TenderOrderImpl dao2 = new TenderOrderImpl(DBConnect.getConn());

				Tender_Order o = new Tender_Order();
				
				ArrayList<Tender_Order> orderList = new ArrayList<>();
				Random r = new Random();
				o.setOrderid("TENDER-ORDER-00" + r.nextInt(1000));
				o.setEmail(email);
				o.setPhno(phno);
				o.setTendername(tname);
				o.setFullorder(fullorder);
				o.setVendorname(vname);
				o.setPrice(price);
				o.setDeadline(deadline);
				o.setMessage(message);
				o.setCrnno(crnno);
				o.setStatus("Pending");

				
				orderList.add(o);
				
				if ("noselect".equals(tname)) {
					session.setAttribute("failedMsg", "Please choose tender name");
					resp.sendRedirect("checkout.jsp");
				} else { 
					boolean f = dao2.saveOrder(orderList);
					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "YOUR ORDER FAILED!");
						resp.sendRedirect("checkout.jsp");
					}
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
