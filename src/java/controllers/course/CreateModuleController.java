package controllers.course;

import course.ModuleDAO;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateModuleController", urlPatterns = {"/CreateModuleController"})
public class CreateModuleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        String title = request.getParameter("title");
        
        ModuleDAO md = new ModuleDAO();
        
        try {
            md.createModule(title, courseId);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateModuleController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CreateModuleController.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("UpdateCourseController?courseId="+courseId);
    }
}
