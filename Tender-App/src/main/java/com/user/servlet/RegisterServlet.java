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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String crnno = req.getParameter("crnno");
			String check = req.getParameter("check");

			// System.out.println(name+""+email+""+phno+""+password+""+check);
			User me = new User();
			me.setName(name);
			me.setEmail(email);
			me.setPhno(phno);
			me.setPassword(password);
			me.setCrnno(crnno);
			
			HttpSession session = req.getSession();

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f = dao.userRegister(me);
					if (f) {
						// System.out.println("User register success");
						session.setAttribute("succMsg", "Registration successful ! ");
						resp.sendRedirect("register.jsp");

					} else {
						// System.out.println("Something wrong happened!");
						session.setAttribute("failedMsg", "Something wrong on server ! ");
						resp.sendRedirect("register.jsp");
					}

				} else {
					session.setAttribute("failedMsg", "User Already Registered With that Email, Try Again! ");
					resp.sendRedirect("register.jsp");

				}

			} else {
				// System.out.println("Please check agree");
				session.setAttribute("failedMsg", "Please check agree to continue ! ");
				resp.sendRedirect("register.jsp");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

	}
}
