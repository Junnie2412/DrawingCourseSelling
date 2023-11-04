/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.learning;

import course.CourseDAO;
import course.LessonDTO;
import course.ModuleDAO;
import course.ModuleDTO;
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
import learningCourse.LearningCourseDTO;
import progress.ProgressDAO;
import users.UserDTO;

/**
 *
 * @author HOANG DUNG
 */
@WebServlet(name = "LearningController", urlPatterns = {"/LearningController"})
public class LearningController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "learning.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            LearningCourseDAO learningCourseDAO = new LearningCourseDAO();

            List<LearningCourseDTO> listActive = learningCourseDAO.getlistLearningCourseActive(loginUser.getAccountID());
            List<LearningCourseDTO> listNotActive = learningCourseDAO.getlistLearningCourseNotActive(loginUser.getAccountID());
            
            request.setAttribute("LIST_ACTIVE", listActive);
            request.setAttribute("LIST_NOT_ACTIVE", listNotActive);
            
            int count1 = 0;
            
            ProgressDAO progressDAO = new ProgressDAO();
            ModuleDAO moduleDAO = new ModuleDAO();
             
            
            for(LearningCourseDTO learningCourse : listActive){
                int count = progressDAO.getNumberFinished(learningCourse.getLearningCourseID());
                int total = 0;
                
                request.setAttribute("NUMBER_ACTIVE_"+count1, count);
                
                List<ModuleDTO> moduleList = moduleDAO.getModulesByCourseId(learningCourse.getCourseID());
                
                for(ModuleDTO module : moduleList){
                    List<LessonDTO> lessonList = moduleDAO.getLessonList(module.getModuleID());
                    total += lessonList.size();
                }
                
                request.setAttribute("TOTAL_ACTIVE_"+count1, total);
                count1++;
            }
            
            url=SUCCESS;
            
        } catch (Exception e) {
            log("Error at LearningController " + e.toString());
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
