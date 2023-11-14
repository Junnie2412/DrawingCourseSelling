/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.userController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.UserDAO;
import users.UserDTO;
import users.UserError;

/**
 *
 * @author Win 10
 */
public class AddCustomerController extends HttpServlet {

    private static final String ERROR = "LoadCustomerController";
    private static final String SUCCESS = "LoadCustomerController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            userError.setUserIDError("");
            boolean checkValidation = true;

            String accountID = request.getParameter("accountID");
            String fullName = request.getParameter("fullName");
            String dateString = request.getParameter("dateOfbirth");
            Date dateOfBirth = Date.valueOf(dateString);
            String role = "Customer";
            boolean isActive = true;           
            String email = request.getParameter("email");
            String img = request.getParameter("image");
            String password = "user123";

            UserDAO dao = new UserDAO();
            //////
            if (accountID.length() < 2 || accountID.length() > 20) {
                userError.setUserIDError("Account ID must be in [2,20]");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 30) {
                userError.setFullNameError("Full Name must be in [5,20]");
                checkValidation = false;
            }
            String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
            //Compile regular expression to get the pattern  
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(email);
            if (!matcher.matches()) {
                userError.setEmailError("Your email is not valid!");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(accountID, password, fullName, dateOfBirth, role, isActive, img, email);
                boolean checkInsert = dao.insertStaff(user);
                if (checkInsert) {
                    
                    request.setAttribute("MESSAGE_ADD", "This account is added successfully!");
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Unknown error!");
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at AddStaffController");
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("UserID has already exist!");
                request.setAttribute("USER_ERROR", userError);
            }
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
