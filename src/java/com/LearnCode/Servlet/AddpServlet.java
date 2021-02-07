/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.LearnCode.Servlet;

import com.LearnCode.DAO.PostDao;
import com.LearnCode.Entities.Post;
import com.LearnCode.Entities.User;
import com.LearnCode.Helper.ConnectionProvider;
import com.LearnCode.Helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
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
public class AddpServlet extends HttpServlet {

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

            
            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("ptitle");
            String pContent = request.getParameter("pcontent");
            String pCode = request.getParameter("pcode");
            Part part = request.getPart("pfile");
            
            //Get Session
            HttpSession s = request.getSession();
            User user = (User)s.getAttribute("currentUser");
            
//            out.println("Post Title"+pTitle);
//            out.println(part.getSubmittedFileName());          
            Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName() , null , cid, user.getId());
           
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if (dao.savePost(p)) 
            {

                ServletContext context = request.getServletContext();
                String path = context.getRealPath("/")+"bimg"+File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
               out.println("done");
            } else {
               out.println("error");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
