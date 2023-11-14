/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import learningCourse.LearningCourseDAO;
import submisson.SubmissionDAO;
import submisson.SubmissionDTO;
import users.UserDTO;

/**
 *
 * @author HOANG DUNG
 */
@WebServlet(name = "GradingDetailController", urlPatterns = {"/GradingDetailController"})
public class GradingDetailController extends HttpServlet {

    private static final String ERROR = "instructorMark.jsp";
    private static final String SUCCESS = "markDetail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;

        try {
            SubmissionDAO submissionDAO = new SubmissionDAO();
            int submissionID = Integer.parseInt(request.getParameter("submissionID"));
            byte[] imageData = submissionDAO.getImage(submissionID);
            String courseName = request.getParameter("courseName");
            String studentName = request.getParameter("studentName");
            String topicName = request.getParameter("topicName");

            String gradeString = request.getParameter("grade");
            
            if (gradeString != null) {
                float grade = Float.parseFloat(gradeString);
                String note = request.getParameter("note");

                if (note == null) {
                    note = "";
                }

                if (grade < 0 || grade > 10) {
                    String error = "Grade must between [0;10]";
                    request.setAttribute("ERROR", error);
                }

                if (grade >= 0 && grade <= 10) {
                    if (grade >= 5) {
                        boolean checkUpdateGrade = submissionDAO.checkUpdateGrade(grade, note, true, submissionID);
                        if (checkUpdateGrade) {
                            request.setAttribute("MESSAGE", "Submit successfully");
                        }
                    } else {
                        boolean checkUpdateGrade = submissionDAO.checkUpdateGrade(grade, note, false, submissionID);
                        if (checkUpdateGrade) {
                            request.setAttribute("MESSAGE", "Submit successfully");
                        }
                    }

                }
            }

            request.setAttribute("COURSE_NAME", courseName);
            request.setAttribute("STUDENT_NAME", studentName);
            request.setAttribute("TOPIC_NAME", topicName);
            request.setAttribute("IMAGE_DATA", imageData);
            request.setAttribute("SUBMISSION_ID", String.valueOf(submissionID));

            url = SUCCESS;
        } catch (Exception e) {
            log("Error at GradingDetailController " + e.toString());
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
