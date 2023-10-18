/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.course;

import cart.Cart;
import cart.CartDAO;
import cart.CartDTO;
import cart.CartItemDAO;
import cart.CartItemDTO;
import course.CourseDAO;
import course.CourseDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.UserDTO;

/**
 *
 * @author HOANG DUNG
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String BUY_NOW = "viewCart.jsp";
    private static final String ADD_TO_CART = "course-details.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = BUY_NOW;
        try {
            String courseID = request.getParameter("courseID");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");

            if (cart == null) {
                cart = new Cart();
            }

            CourseDAO courseDAO = new CourseDAO();
            CourseDTO course = courseDAO.getCourseByCourseID(courseID);

            boolean check = cart.add(course);

            String action = request.getParameter("action");

            if (!action.equals("AlreadyBuyNow") && !action.equals("AlreadyAddToCart")) {
                if (check) {
                    CartItemDAO cartItemDAO = new CartItemDAO();
                    CartDAO cartDAO = new CartDAO();

                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    Date createdDay = Date.valueOf(request.getParameter("createdDay"));

                    if (!cartDAO.checkCreatedDayAndUser(createdDay, loginUser.getAccountID())) {
                        boolean checkCreateCart = cartDAO.createCart(createdDay, loginUser.getAccountID());
                    }

                    CartDTO cartDTO = cartDAO.getCart(createdDay, loginUser.getAccountID());

                    boolean checkCreateCartItem = cartItemDAO.createCartItem(courseID, 1, cartDTO.getCartID());

                    if (checkCreateCartItem) {
                        session.setAttribute("CART", cart);
                        request.setAttribute("MESSAGE", "Add to Cart Successfully");

                        if (action.equals("AddToCart")) {
                            url = ADD_TO_CART;

                        }
                    }
                }
            }
            
            if(action.equals("AlreadyAddToCart")){
                url = ADD_TO_CART;
            }

        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
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
