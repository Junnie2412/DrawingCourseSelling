package controllers.blog;

import blog.BlogDAO;
import blog.BlogDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TienToan
 */
public class CreateBlogController extends HttpServlet {
    
    private static final String ERROR = "//";
    private static final String SUCCESS = "//";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {           
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String urlImage = request.getParameter("urlImage");
            
            BlogDTO blogPost = new BlogDTO();
            
            blogPost.setTitle(title);
            blogPost.setContent(content);
            blogPost.setImage(urlImage);
            LocalDate localDate = LocalDate.now();
            blogPost.setDateCreate(Date.valueOf(localDate));
            blogPost.setIsApproved(false);
            blogPost.setAccountID(request.getParameter("accountID"));
            //
            BlogDAO blogPostDAO = new BlogDAO();
            blogPostDAO.createBlogPost(blogPost); 
            
        } catch (Exception e) {
            log("Error at CreateBlogController");
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
