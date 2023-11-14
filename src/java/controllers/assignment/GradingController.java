/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.assignment;

import course.LessonDTO;
import course.ModuleDAO;
import course.ModuleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import learningCourse.LearningCourseDAO;
import learningCourse.LearningCourseDTO;
import progress.ProgressDAO;
import submisson.SubmissionDAO;
import submisson.SubmissionDTO;
import users.UserDTO;

/**
 *
 * @author HOANG DUNG
 */
@WebServlet(name = "GradingController", urlPatterns = {"/GradingController"})
public class GradingController extends HttpServlet {

    private static final String ERROR ="instructor.jsp";
    private static final String SUCCESS ="instructorMark.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            
            SubmissionDAO submissionDAO = new SubmissionDAO();
            LearningCourseDAO learningCourseDAO = new LearningCourseDAO();
            List<SubmissionDTO> listSubmission = submissionDAO.getListSubmission(loginUser.getAccountID());
            
            int count = 1;
            for(SubmissionDTO submission : listSubmission){
                String studentName = submissionDAO.getStudentName(submission.getAccountID());
                String courseName = learningCourseDAO.getCourseName(submission.getLearningCourseID());
                String topicName = submissionDAO.getTopicName(submission.getLearningCourseID());
                
                request.setAttribute("NAME_STUDENT_"+count, studentName);
                request.setAttribute("NAME_COURSE_"+count, courseName);
                request.setAttribute("NAME_TOPIC_"+count, topicName);
                
                count++;
            }
            
            request.setAttribute("LIST_SUBMISSION", listSubmission);
            url = SUCCESS;
            
        } catch (Exception e) {
            log("Error at GradingController " + e.toString());
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
