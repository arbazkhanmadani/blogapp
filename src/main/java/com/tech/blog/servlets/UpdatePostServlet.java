package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@WebServlet("/updatePostServlet")
@MultipartConfig
public class UpdatePostServlet extends HttpServlet {

	//private static final Timestamp LocalDateTime.now() = null;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        	//String q ="update pTitle=?, pContent=?, pPic=?, pCode=? posts where pid=?";
        	int pid = Integer.parseInt(request.getParameter("post_id"));
    		String title = request.getParameter("t");
            String content = request.getParameter("c");
            String code = request.getParameter("cd");
            Part part = request.getPart("img");

            String imageName = part.getSubmittedFileName();

            Post p = new Post();
            p.setPid(pid);
            p.setpTitle(title);
            p.setpContent(content);
            p.setpCode(code);
            p.setpPic(imageName);
            //p.setpDate(Timestamp);
            System.out.println(pid+"=="+title+"=="+content+"=="+code+"=="+part+"=="+imageName);
            //update database....
            PostDao pd = new PostDao(ConnectionProvider.getConnection());
            HttpSession s = request.getSession();
            
            boolean ans = pd.updatePost(p);
            if (ans) {

                String path = request.getRealPath("/") + "pics" + File.separator + imageName;

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile updated...");
                    Message msg = new Message("Profile details updated...", "success", "alert-success");
                    s.setAttribute("pUpdate", msg);

                } else {
                    //////////////
                    Message msg = new Message("Something went wrong..", "error", "alert-danger");
                    s.setAttribute("pUpdate", msg);
                 }
            }
           else {
                out.println("not updated..");
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                s.setAttribute("pUpdate", msg);

           }

            response.sendRedirect("private_profile.jsp");

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
