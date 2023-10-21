package controllers.checkout;

import course.CourseDAO;
import course.CourseDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.UserDTO;

/**
 *
 * @author TienToan
 */
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "checkout.jsp";
    private static final String CUS = "Customer";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean check = false;
        try {
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
            if (userLogin != null) {
                String roleID = userLogin.getRole();
                if (CUS.equals(roleID)) {
                    check = true;
                }
            } else {
                request.setAttribute("MSG", "You need to login to buy course!");
                request.getRequestDispatcher("signin.jsp").forward(request, response);
                return;
            }
            if (check) {
                //get cart in database
                String accountID = userLogin.getAccountID();
                CourseDAO dao = new CourseDAO();
                List<CourseDTO> getCart = dao.getCart(accountID);
                //get id from parameter
                String courseID = request.getParameter("courseID");
                CourseDTO course = dao.getCourseByCourseID(courseID);
                if (course != null) {
                    getCart.add(course);

                }
                if (getCart == null) {
                    request.setAttribute("ERROR", "You have no course, continue to buy course!");
                } else {
                    session.setAttribute("CART", getCart);
                }
            }
        } catch (Exception e) {
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
