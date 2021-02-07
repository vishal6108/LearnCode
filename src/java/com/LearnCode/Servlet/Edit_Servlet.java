/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.LearnCode.Servlet;

import com.LearnCode.DAO.UserDao;
import com.LearnCode.Entities.Message;
import com.LearnCode.Entities.User;
import com.LearnCode.Helper.ConnectionProvider;
import com.LearnCode.Helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Amit
 */
@MultipartConfig
public class Edit_Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Edit_Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //Fetching Data
            
            String username = request.getParameter("user_name");
            String useremail = request.getParameter("user_email");
            String userpass = request.getParameter("user_pass");
            String userabout = request.getParameter("user_about");
            Part part = request.getPart("user_profile");
            String imageName = part.getSubmittedFileName();
            
            // Get the session from user and set new data
            HttpSession s = request.getSession();
            User user=(User)s.getAttribute("currentUser");
            
            user.setName(username);
            user.setEmail(useremail);
            user.setPassword(userpass);
            user.setAbout(userabout);
            String oldFile = user.getProfile();
            user.setProfile(imageName);
            
            //Updating Database
             UserDao userDao = new UserDao(ConnectionProvider.getConnection());
             boolean upd = userDao.updateUser(user);
             if(upd)
             {
             
             
             String path = request.getRealPath("/")+"pimg"+File.separator + user.getProfile();
             
             String pathOldFile = request.getRealPath("/")+"pimg"+File.separator + oldFile; 
             if(!oldFile.equals("default.jpg"))
             {
             Helper.deleteFile(pathOldFile);
             }
             else
             {
             
             }
             if(Helper.saveFile(part.getInputStream(), path))
             {
                Message msg = new Message("Updated Successfully","Success","alert-success");
            
                s.setAttribute("msg", msg);
             }
             else
             {
             Message msg = new Message("No Change In Profile Picture / File Not Updated Successfully", "Error", "alert-danger");
             s.setAttribute("msg", msg);
                    
             
             }
             }
             else
             {
             out.println("Something went wrong Data does not Upadated");
             }
             response.sendRedirect("Profile.jsp");
             
             
             
            
            
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
