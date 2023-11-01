/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.course;

import course.CourseDAO;
import course.CourseDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.UserDTO;

/**
 *
 * @author TienToan
 */
public class SortCourseController extends HttpServlet {

    private static final String SUCCESS = "courses.jsp";
    private static final String ERROR = "index.jsp";
    private static final String SORTBYNAME = "sortByName";
    private static final String SORTBYPRICE = "sortByPrice";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean flag = false;
                
        try {
            CourseDAO dao = new CourseDAO();
            List<CourseDTO> listCourse = dao.getlistCourse("");
            if (listCourse != null) {
                if (request.getParameter("sort").equalsIgnoreCase(SORTBYNAME)) {
                    Collections.sort(listCourse, (a, b) -> a.getName().compareTo(b.getName()));
                    flag = true;
                } else if (request.getParameter("sort").equalsIgnoreCase(SORTBYPRICE)) {
                    for (int i = 0; i < listCourse.size() - 1; i++) {
                        for (int j = 1; j < i + 1; j++) {
                            if (listCourse.get(i).getPrice() > listCourse.get(j).getPrice()) {
                                Collections.swap(listCourse, i, j);
                            }
                        }
                    }
                    flag = true;
                }
            } else {
                request.setAttribute("ERROR", "Fail to load course!");
            }
            if (flag) {
                request.setAttribute("LIST_COURSE", listCourse);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at SortController: " + e.toString());
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
