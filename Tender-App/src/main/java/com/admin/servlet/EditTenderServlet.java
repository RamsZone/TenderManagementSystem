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
import com.entity.Tenderdtls;

@WebServlet("/edittenders")
public class EditTenderServlet extends HttpServlet {

   

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        try {
        	
        	int id=Integer.parseInt(req.getParameter("id"));
            String tenderName = req.getParameter("tname");
            String tenderType = req.getParameter("ttype");
            String baseprice = req.getParameter("tprice");
            String deadline = req.getParameter("tdeadline");
            String location = req.getParameter("tadd");
            String description = req.getParameter("tdesc");

           

            // Create Tender object
            Tenderdtls t = new Tenderdtls();
            t.setTenderid(id);
            t.setTendername(tenderName);
            t.setTendertype(tenderType);
            t.setBaseprice(baseprice); 
            t.setDeadline(deadline);
            t.setLocation(location);
            t.setDescription(description);
            
            // Initialize DAO and update tender
            TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
            boolean f = dao.updateEditTenders(t);
            
            HttpSession session = req.getSession();
            // Set session attributes based on update result
            if(f) {
                session.setAttribute("succMsg", "Tender updated successfully!");
                resp.sendRedirect("admin/all_tenders.jsp");
            } else {
                session.setAttribute("failedMsg", "SOMETHING WRONG ON SERVER!");
                resp.sendRedirect("admin/all_tenders.jsp");
            }
 
        
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
