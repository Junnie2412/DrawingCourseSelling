package controllers.blog;

import blog.BlogDAO;
import blog.BlogDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TienToan
 */
public class UpdateBlogController extends HttpServlet {
    // url success lead to updated list post (admin sight)
    private static final String ERROR = "//";
    private static final String SUCCESS = "//";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int postID = Integer.parseInt(request.getParameter("postID"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String urlImage = request.getParameter("urlImage");
            //
            BlogDTO blogPost = new BlogDTO();
            blogPost.setTitle(title);
            blogPost.setContent(content);
            blogPost.setImage(urlImage);
            //
            blogPost.setPostID(postID);
            BlogDAO blogPostDAO = new BlogDAO();
            boolean check = blogPostDAO.updateBlog(blogPost);
            if(check){
                HttpSession session = request.getSession();
                session.setAttribute("MESSAGE", "Your post is updated!");
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at UpdateBlogController");
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
