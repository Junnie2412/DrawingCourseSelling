/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.UserDAO;
import users.UserDTO;
import users.UserError;

/**
 *
 * @author PC
 */
@WebServlet(name = "AddInstructorController", urlPatterns = {"/AddInstructorController"})
public class AddInstructorController extends HttpServlet {

    private static final String SUCCESS = "staff/managerInstructor.jsp";
    private static final String ERROR = "staff/managerInstructor.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        
        try{
            boolean checkValidation = true;
            
            String accountID = request.getParameter("accountID");
            String fullName = request.getParameter("fullName");
            String dateString = request.getParameter("dateOfbirth");
            Date dateOfBirth = Date.valueOf(dateString);
            String role = "Instructor";
            boolean isActive = true;
            String activeStr = request.getParameter("isActive");
            if (activeStr.equalsIgnoreCase("active")) {
                isActive = true;
            } else if (activeStr.equalsIgnoreCase("inactive")) {
                isActive = false;
            }
            
            String email = request.getParameter("email");
            String img = request.getParameter("image");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            UserDAO dao = new UserDAO();
            //////
            if (accountID.length() < 2 || accountID.length() > 10) {
                userError.setUserIDError("Account ID must be in [2,10]");
                checkValidation = false;
            }
//            boolean checkDuplicate = dao.checkDuplicate(accountID);
//            if(checkDuplicate) {
//                userError.setUserIDError("Duplicate User ID !");
//                checkValidation=false;
//            }
            if (fullName.length() < 5 || fullName.length() > 20) {
                userError.setFullNameError("Full Name must be in [5,20]");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmError("two password are not match");
                checkValidation = false;
            }
            //check email
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
                boolean checkInsert = dao.insertInstructor(user);
                if (checkInsert) {
                    request.setAttribute("MESSAGE", "This account is added successfully!");
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Unknown error!");
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
            
            
        }catch(Exception e){
            log("Error at AddInstructorController: "+ e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("UserID has already exist!");
                request.setAttribute("USER_ERROR", userError);
            }
        }finally{
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
