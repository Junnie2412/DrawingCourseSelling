package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HOANG DUNG
 */
public class MainController extends HttpServlet {
    private static final String LOGIN_PAGE = "signin.jsp";
    private static final String HOMEPAGE = "index.jsp";
    
    private static final String SIGNUP = "SignUp";
    private static final String SIGNUP_CONTROLLER = "SignupController";
    
    private static final String SIGNIN = "SignIn";
    private static final String SIGNIN_CONTROLLER = "LoginController";
    
    private static final String SIGNOUT = "SignOut";
    private static final String SIGNOUT_CONTROLLER = "LogoutController";
    
    private static final String CREATE_NEW_COURSE="CreateNewCourse";
    private static final String CREATE_COURSE_PAGE="createCourse.jsp";
    private static final String CREATE_COURSE="CreateCourse";
    private static final String CREATE_COURSE_CONTROLLER="CreateCourseController";
    private static final String TURN_BACK_COURSE="TurnBackToCourses";
    private static final String COURSE_INSTRUCTOR_PAGE="instructorCourse.jsp";
    private static final String SEARCH_COURSE_NAME = "Search";
    private static final String SEARCH_COURSE_NAME_CONTROLLER = "SearchController";
    
    private static final String CREATEBLOG = "crateBlog";
    private static final String CREATEBLOG_CONTROLLER = "CreateBlogController";
    private static final String DELETEBLOG = "deleteBlog";
    private static final String DELETEBLOG_CONTROLLER = "DeleteBlogController";
    private static final String UPDATEBLOG = "updateBlog";
    private static final String UPDATEBLOG_CONTROLLER = "UpdateBlogController";
    
    private static final String ADDSTAFF = "Add Staff";
    private static final String ADDSTAFF_CONTROLLER = "AddStaffController";
    private static final String DELETESTAFF = "deleteStaff";
    private static final String DELETESTAFF_CONTROLLER = "DeleteStaffController";
    private static final String UPDATESTAFF = "updateStaff";
    private static final String UPDATESTAFF_CONTROLLER = "UpdateStaffController";
    private static final String LOADSTAFF = "All Staff";
    private static final String LOADSTAFF_CONTROLLER = "LoadStaffController";
    
    private static final String CREATE_VOUCHER = "CreateVoucher";
    private static final String CREATE_VOUCHER_CONTROLLER = "CreateVoucherController";
    
    private static final String SHOW_LIST_INSTRUCTOR = "Show";
    private static final String SHOW_LIST_INSTRUCTOR_CONTROLLER = "ShowListController";
    
    private static final String ADD_TO_CART = "AddToCart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String REMOVE_COURSE_CART="Remove";
    private static final String REMOVE_COURSE_CART_CONTROLLER="RemoveCartController";
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOMEPAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else if (action.equals(SIGNUP)) {
                url = SIGNUP_CONTROLLER;
            } else if (action.equals(SIGNIN)) {
                url = SIGNIN_CONTROLLER;
            } else if (action.equals(SIGNOUT)) {
                url = SIGNOUT_CONTROLLER;
            } else if (action.equals(CREATE_NEW_COURSE)) {
                url = CREATE_COURSE_PAGE;
            } else if (action.equals(CREATE_COURSE)) {
                url = CREATE_COURSE_CONTROLLER;
            } else if (action.equals(TURN_BACK_COURSE)) {
                url = COURSE_INSTRUCTOR_PAGE;
            } else if (action.equals(CREATEBLOG)) {
                url = CREATEBLOG_CONTROLLER;
            } else if (action.equals(DELETEBLOG)) {
                url = DELETEBLOG_CONTROLLER;
            } else if (action.equals(UPDATEBLOG)) {
                url = UPDATEBLOG_CONTROLLER;
            } else if (action.equals(ADDSTAFF)) {
                url = ADDSTAFF_CONTROLLER;
            } else if (action.equals(DELETESTAFF)) {
                url = DELETESTAFF_CONTROLLER;
            }else if (action.equals(SEARCH_COURSE_NAME)) {
                url = SEARCH_COURSE_NAME_CONTROLLER;
            }else if (action.equals(UPDATESTAFF)) {
                url = UPDATESTAFF_CONTROLLER;
            }else if (action.equals(LOADSTAFF)) {
                url = LOADSTAFF_CONTROLLER;
            }else if (action.equals(CREATE_VOUCHER)) {
                url = CREATE_VOUCHER_CONTROLLER;
            }else if (action.equals(ADD_TO_CART)) {
                url = ADD_TO_CART_CONTROLLER;
            }else if (action.equals(REMOVE_COURSE_CART)) {
                url = REMOVE_COURSE_CART_CONTROLLER;
            }else if (action.equals(SHOW_LIST_INSTRUCTOR)) {
                url = SHOW_LIST_INSTRUCTOR_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
