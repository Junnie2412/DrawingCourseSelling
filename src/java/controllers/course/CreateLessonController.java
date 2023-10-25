package controllers.course;

import course.LessonDAO;
import course.LessonDTO;
import course.ModuleDAO;
import course.ModuleDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Admin
 */
@WebServlet(name = "CreateLessonController", urlPatterns = {"/CreateLessonController"})
public class CreateLessonController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int moduleId = Integer.parseInt(request.getParameter("moduleId"));
        
        LessonDAO ld = new LessonDAO();
        
        List<LessonDTO> list = new ArrayList<>();
        
        try {
            list = ld.getLessonByModuleId(moduleId);
        } catch (SQLException ex) {
            Logger.getLogger(CreateLessonController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("moduleId", moduleId);
        request.setAttribute("lessons", list);
        request.getRequestDispatcher("instructorLesson.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int moduleId = Integer.parseInt(request.getParameter("moduleId"));
        
        LessonDAO ld = new LessonDAO();
        
        try {
            ld.createLesson(title, description, moduleId);
        } catch (SQLException ex) {
            Logger.getLogger(CreateLessonController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("CreateLessonController?moduleId=" + moduleId);
    }
    
}
