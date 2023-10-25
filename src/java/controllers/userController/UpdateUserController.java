
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
import javax.servlet.http.HttpSession;
import users.UserDAO;
import users.UserDTO;
import users.UserError;

/**
 *
 * @author TienToan
 */
public class UpdateUserController extends HttpServlet {

    private static final String ERROR = "LoadUserController";
    private static final String SUCCESS = "LoadUserController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
       
        UserError userError = new UserError();
        try {
            boolean checkValidation = true;

            
            String fullName = request.getParameter("fullName");
            String dateString = request.getParameter("dateOfbirth");
            String email = request.getParameter("email");
            UserDAO dao = new UserDAO();
            
            System.out.println(fullName);
            System.out.println(dateString);
            System.out.println(email);
            
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO)session.getAttribute("LOGIN_USER");

            if (fullName.length() < 5 || fullName.length() > 20) {
                userError.setFullNameError("Full Name must be in [5,20]");
                checkValidation = false;
            }

            // Check email
            String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(email);
            if (!matcher.matches()) {
                userError.setEmailError("Your email is not valid!");
                checkValidation = false;
            }

            if (checkValidation) {
                boolean checkUpdate = dao.updateUser(fullName, dateString, email, user.getAccountID());
                if (checkUpdate) {
                    UserDTO newUser = dao.checkLogin(user.getAccountID(), user.getPassword());
                    session.setAttribute("LOGIN_USER", newUser);
                    request.setAttribute("MESSAGE", "Updated successfully");
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Something went wrong! Please try again!");
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at UpdateUserController", e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
 
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
