package com.admin.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.TenderDAOImpl;
import com.DB.DBConnect;
import com.entity.Tenderdtls;

@SuppressWarnings("serial")
@WebServlet("/add_tenders")
@MultipartConfig
public class TendersAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            String tendername = req.getParameter("tname");
            String tendertype = req.getParameter("ttype");
            String baseprice = req.getParameter("tprice");
            String deadline = req.getParameter("tdeadline");
            String location = req.getParameter("tadd");
            String description = req.getParameter("tdesc");
            String status = req.getParameter("status");
            String message = req.getParameter("message");
            

           
            Tenderdtls t = new Tenderdtls(tendername, tendertype, baseprice, deadline, location, description, status, message);

            // Initialize the DAO and attempt to add the tender
            TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
            boolean f = dao.addtenders(t);

            // Set session attributes based on the outcome of the operation
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Tender added successfully");
                resp.sendRedirect("admin/add_tender.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on server");
                resp.sendRedirect("admin/add_tender.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
}
