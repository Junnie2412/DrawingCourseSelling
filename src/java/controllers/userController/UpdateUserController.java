
package controllers.userController;

import course.CourseDAO;
import course.CourseDTO;
import course.DescriptionDAO;
import course.DescriptionDTO;
import users.UserDAO;
import users.UserDTO;
import course.ModuleDAO;
import course.ModuleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HOANG DUNG
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
public class UpdateUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accountId = request.getParameter("accountID");

        UserDAO cd = new UserDAO();
        

        UserDTO user = null;
        
       
        
        try {
            user = cd.getUserByUserID(accountId);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
       

        request.setAttribute("user", user );
       
        request.getRequestDispatcher("editaccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountID = request.getParameter("accountID");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dateString = request.getParameter("dateOfbirth");
            Date dateOfBirth = Date.valueOf(dateString);

       

        UserDAO cd = new UserDAO();
        
        boolean isSuccess = false;

        try {
            isSuccess = cd.updateUser(  fullName,  dateOfBirth,  email,  password);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateUserController.class.getName()).log(Level.SEVERE, null, ex);
        }

      

        response.sendRedirect("editaccount.jsp");
    }
}