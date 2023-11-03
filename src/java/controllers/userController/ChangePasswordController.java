package controllers.userController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/ChangePasswordController"})
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPassword = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");

        if (!newPassword.equals(confirmNewPassword)) {
            request.setAttribute("msgError", "Confirm password not match");
            request.getRequestDispatcher("editAccount.jsp").forward(request, response);
        }

        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        
        

        if (!user.getPassword().equals(oldPassword)) {
            request.setAttribute("msgError", "Old password invalid");
            request.getRequestDispatcher("editAccount.jsp").forward(request, response);
        }

        UserDAO ud = new UserDAO();
        try {
            boolean res = ud.changePassword(user.getAccountID(), newPassword);

            if (res) {
                request.setAttribute("msgSuccess", "Change password successfully");
            } else {
                request.setAttribute("msgError", "Server error");
            }
            request.getRequestDispatcher("editAccount.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
