package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.ForumDAOImpl;
import com.DB.DBConnect;

@WebServlet("/answer_forum")
public class Answerforum extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String idString = req.getParameter("id");
            if (idString != null && !idString.isEmpty()) {
                int id = Integer.parseInt(idString); // Parse the ID string into an integer
                String status = req.getParameter("comm");
                String email = req.getParameter("email");

                ForumDAOImpl dao = new ForumDAOImpl(DBConnect.getConn());
                HttpSession session = req.getSession();
                if (dao.answerforum(id, status, email)) {
                    session.setAttribute("succMsg", "Answer Forwaded!");
                    resp.sendRedirect("admin/forum_answer.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong!");
                    resp.sendRedirect("admin/forum_answer.jsp");
                }
            } else {
                // Handle case where ID parameter is missing or empty
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "ID parameter is missing or empty!");
                resp.sendRedirect("admin/forum_answer.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Handle case where ID string cannot be parsed into an integer
            // For example, log the error or display an error message to the user
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}