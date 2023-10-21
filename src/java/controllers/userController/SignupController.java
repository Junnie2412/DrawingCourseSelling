
package controllers.userController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.UserDAO;
import users.UserDTO;

public class SignupController extends HttpServlet {
    
    private static final String SIGNUP_PAGE = "signup.jsp";
    
    private static final String SIGNIN_PAGE = "signin.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = SIGNUP_PAGE;
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String emailSignup = request.getParameter("useremail");
            String idSignup = request.getParameter("username");
            String passwordSignup = request.getParameter("password");
            String passwordConfirm = request.getParameter("passwordConfirm");
            String fullName = request.getParameter("fullname");
            String dateOfBirth = request.getParameter("dateofbirth");
            
            UserDAO dao = new UserDAO();   
            UserDTO signupUser = dao.checkAccount(emailSignup,idSignup,passwordSignup);
            
            if (signupUser != null) {
                request.setAttribute("ErrorExisted", "Username or Email has already existed");
            } else {
                if ((passwordSignup == passwordConfirm) || (passwordSignup.equals(passwordConfirm))) {
                    signupUser = dao.signUp(emailSignup,fullName,dateOfBirth,idSignup,passwordSignup);
                    url = SIGNIN_PAGE;
                    request.setAttribute("SUCCESS", "Registered successfully! Please Sign In!");
                } else {
                    request.setAttribute("ErrorPassword", "Password doesn't match!");
                } 
            }  
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            log("Error at SignupController: " + e.toString());
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
