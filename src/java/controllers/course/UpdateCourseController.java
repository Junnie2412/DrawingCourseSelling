/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.course;

import course.CourseDAO;
import course.CourseDTO;
import course.DescriptionDAO;
import course.DescriptionDTO;
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
 * @author HOANG DUNG
 */
@WebServlet(name = "UpdateCourseController", urlPatterns = {"/UpdateCourseController"})
public class UpdateCourseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String courseId = request.getParameter("courseId");

        CourseDAO cd = new CourseDAO();
        ModuleDAO md = new ModuleDAO();

        CourseDTO course = null;
        DescriptionDTO description = null;
        List<ModuleDTO> modules = new ArrayList<>();
        
        try {
            course = cd.getCourseByCourseID(courseId);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            description = cd.getDescription(courseId);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            modules = md.getModulesByCourseId(courseId);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCourseController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("course", course);
        request.setAttribute("modules", modules);
        request.setAttribute("description", description);
        request.getRequestDispatcher("updateCourse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseId = request.getParameter("courseID");
        float coursePrice = Float.parseFloat(request.getParameter("coursePrice"));
        String courseName = request.getParameter("courseName");
        int courseDuration = Integer.parseInt(request.getParameter("courseDuration"));
        String courseDatePublic = request.getParameter("courseDatePublic");

        int descriptionId = Integer.parseInt(request.getParameter("descriptionId"));
        String descriptionContent = request.getParameter("descriptionContent");
        String descriptionTarget = request.getParameter("descriptionTarget");
        String descriptionImage = request.getParameter("descriptionImage");
        String descriptionType = request.getParameter("descriptionType");
        String descriptionLevel = request.getParameter("descriptionLevel");

        CourseDAO cd = new CourseDAO();
        DescriptionDAO dd = new DescriptionDAO();
        boolean isSuccess = false;

        try {
            isSuccess = cd.updateCourse(courseId, coursePrice, courseName, courseDuration, courseDatePublic);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            isSuccess = dd.updateDescription(descriptionId, descriptionContent, descriptionTarget, descriptionImage, descriptionType, descriptionLevel);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("instructorCourse.jsp");
    }
}
