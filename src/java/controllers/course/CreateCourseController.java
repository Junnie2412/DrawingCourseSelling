/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.course;

import course.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HOANG DUNG
 */
@WebServlet(name = "CreateCourseController", urlPatterns = {"/CreateCourseController"})
public class CreateCourseController extends HttpServlet {

    private static final String ERROR="createCourse.jsp";
    private static final String SUCCESS="createCourse.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        
        try {
            String courseID = request.getParameter("courseID");
            float coursePrice = Float.parseFloat(request.getParameter("coursePrice"));
            String courseName = request.getParameter("courseName");
            int courseDuration = Integer.parseInt(request.getParameter("courseDuration"));
            boolean courseIsActive = Boolean.parseBoolean("courseIsActive");
            Date courseDatePublic = Date.valueOf("courseDatePublic");
            
            String descriptionContent = request.getParameter("descriptionContent");
            String descriptionTarget = request.getParameter("descriptionTarget");
            String descriptionImage = request.getParameter("descriptionImage");
            String descriptionType = request.getParameter("descriptionType");
            String descriptionLevel = request.getParameter("descriptionLevel");
            
            String instructorID = request.getParameter("instructorID");
            
            String moduleTitle = request.getParameter("moduleTitle");
            
            String lessonTitle = request.getParameter("lessonTitle");
            String lessonDescription = request.getParameter("lessonDescrition");
            String videoContent = request.getParameter("videoContent");
            LocalTime videoTime = LocalTime.parse(request.getParameter("videoTime"));
            Boolean videoIsActive = Boolean.parseBoolean(request.getParameter("videoIsActive"));
            
            CourseDAO courseDAO = new CourseDAO();
            boolean check = courseDAO.createCourse(courseID, coursePrice, courseName, courseDuration, courseIsActive, courseDatePublic, descriptionContent, descriptionTarget, descriptionImage, descriptionType, descriptionLevel, instructorID, moduleTitle, lessonTitle, lessonDescription, videoContent, videoTime, videoIsActive);
            if(check)
            {
                request.setAttribute("MESSAGE", "Create Course Successfully");
                url=SUCCESS;
            }else{
                request.setAttribute("MESSAGE", "Create Course Unsucessfully");
            }
        } catch (Exception e) {
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
