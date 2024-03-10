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

import com.DAO.ForumDAOImpl;
import com.DAO.TenderDAOImpl;
import com.DB.DBConnect;
import com.entity.Forum_Order;
import com.entity.Tenderdtls;

@WebServlet("/forum")
public class ForumServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            HttpSession session = req.getSession();

            int id = Integer.parseInt(req.getParameter("id"));
            String vfemail = req.getParameter("vfemail");
            String vfphno = req.getParameter("vfphno");
            String vfname = req.getParameter("vfname");
            String fquestion = req.getParameter("fquestion");
            String status = req.getParameter("status");
            String vfcrnno = req.getParameter("vfcrnno");

            TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
            List<Tenderdtls> blist = dao.getTenderbydescorder();
            if (blist.isEmpty()) {
                session.setAttribute("failedMsg", "FIRST SELECT THE Tender!");
                resp.sendRedirect("forum.jsp");
                return; // Stop further execution
            } else {
                ForumDAOImpl dao2 = new ForumDAOImpl(DBConnect.getConn());

                Forum_Order f = new Forum_Order();

                ArrayList<Forum_Order> orderList = new ArrayList<>();
                Random r = new Random();

                f.setForumid("FORUM-00" + r.nextInt(1000));
                f.setFquestion(fquestion);
                f.setStatus("Pending");
                f.setVfcrnno(vfcrnno);
                f.setVfemail(vfemail);
                f.setVfname(vfname);
                f.setVfphno(vfphno);
                orderList.add(f);

                boolean f2 = dao2.saveForum(orderList);
                if (f2) {
                    session.setAttribute("succMsg", "Your question has been submitted");
                    resp.sendRedirect("forum.jsp");
                } else {
                    session.setAttribute("failedMsg", "YOUR ORDER FAILED!");
                    resp.sendRedirect("forum.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
