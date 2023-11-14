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

    private static final String CREATE_NEW_COURSE = "CreateNewCourse";
    private static final String CREATE_COURSE_PAGE = "createCourse.jsp";
    private static final String CREATE_COURSE = "CreateCourse";
    private static final String CREATE_COURSE_CONTROLLER = "CreateCourseController";
    private static final String TURN_BACK_COURSE = "TurnBackToCourses";
    private static final String COURSE_INSTRUCTOR_PAGE = "instructorCourse.jsp";
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
    private static final String DELETESTAFF = "Inactive";
    private static final String DELETESTAFF_CONTROLLER = "DeleteStaffController";
    private static final String UPDATESTAFF = "Update staff";
    private static final String UPDATESTAFF_CONTROLLER = "UpdateStaffController";
    private static final String LOADSTAFF = "All Staff";
    private static final String LOADSTAFF_CONTROLLER = "LoadStaffController";

    private static final String CREATE_VOUCHER = "CreateVoucher";
    private static final String CREATE_VOUCHER_CONTROLLER = "CreateVoucherController";
    private static final String TURN_BACK_STAFF = "TurnBackStaff";
    private static final String STAFF_PAGE = "staff/staff.jsp";

    private static final String SHOW_LIST_INSTRUCTOR = "All intructors";
    private static final String SHOW_LIST_INSTRUCTOR_CONTROLLER = "ShowListController";
    private static final String ADD_INSTRUCTOR = "Add Instructor";
    private static final String ADD_INSTRUCTOR_CONTROLLER = "AddInstructorController";
    private static final String EDIT_INSTRUCTOR = "editInstructor";
    private static final String EDIT_INSTRUCTOR_CONTROLLER = "EditInstructorController";
    private static final String HIDE_INSTRUCTOR = "hideInstructor";
    private static final String HIDE_INSTRUCTOR_CONTROLLER = "HideInstructorController";

    private static final String VIEW_CART = "ViewCart";
    private static final String VIEW_CART_PAGE = "viewCart.jsp";
    private static final String ALREADY_ADD_TO_CART = "AlreadyAddToCart";
    private static final String ALREADY_BUY_NOW = "AlreadyBuyNow";
    private static final String ADD_TO_CART = "AddToCart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String BUY_NOW = "BuyNow";
    private static final String TURN_BACK = "TurnBack";
    private static final String COURSE_DETAIL_PAGE = "courses.jsp";
    private static final String REMOVE_COURSE_CART = "Remove";
    private static final String REMOVE_COURSE_CART_CONTROLLER = "RemoveCartController";

    private static final String HANDLE_VNPAY = "goToVNPay";
    private static final String VNPAY_CONTROLLER = "ajaxServlet";

    private static final String VIEW_COURSE_PAGE = "ViewCoursePage";
    private static final String VIEW_COURSE_PAGE_CONTROLLER = "ViewCoursePageController";
    private static final String VIEW_COURSE_DETAIL = "ViewCourseDetail";
    private static final String VIEW_COURSE_DETAIL_CONTROLLER = "ViewCourseController";

    private static final String FILTER_BY_TYPE = "FilterByType";
    private static final String FILTER_BY_PRICE = "FilterByPrice";
    private static final String FILTER_BY_LEVEL = "FilterByLevel";
    private static final String FILTER_BY_TYPE_CONTROLLER = "FilterByTypeController";
    private static final String FILTER_BY_PRICE_CONTROLLER = "FilterByPriceController";
    private static final String FILTER_BY_LEVEL_CONTROLLER = "FilterByLevelController";

    private static final String RESET_PASSWORD = "Reset Password";
    private static final String FORGOT_PASSWORD_CONTROLLER = "ForgotPasswordController";
    private static final String GET_OTP = "Verify OTP";
    private static final String HANDLE_OTP_CONTROLLER = "HandlerOTPController";
    private static final String SET_NEW_PASSWORD = "Reset Password";
    private static final String SET_NEW_PASSWORD_CONTROLLER = "CompletePasswordResetController";
    
    private static final String LEARNING = "learning";
    private static final String LEARNING_CONTROLLER = "LearningController";
    private static final String VIEW_VIDEO = "viewVideo";
    private static final String VIEW_VIDEO_CONTROLLER = "ViewVideoController";

    private static final String DELETECUSTOMER = "Inactive Customer";
    private static final String DELETECUSTOMER_CONTROLLER = "DeleteCustomerController";
    private static final String UPDATECUSTOMER = "Update Customer";
    private static final String UPDATECUSTOMER_CONTROLLER = "UpdateCustomerController";
    
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
            } else if (action.equals(SEARCH_COURSE_NAME)) {
                url = SEARCH_COURSE_NAME_CONTROLLER;
            } else if (action.equals(UPDATESTAFF)) {
                url = UPDATESTAFF_CONTROLLER;
            } else if (action.equals(LOADSTAFF)) {
                url = LOADSTAFF_CONTROLLER;
            } else if (action.equals(CREATE_VOUCHER)) {
                url = CREATE_VOUCHER_CONTROLLER;
            } else if (action.equals(TURN_BACK_STAFF)) {
                url = STAFF_PAGE;
            } else if (action.equals(ADD_TO_CART)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (action.equals(ALREADY_ADD_TO_CART)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (action.equals(ALREADY_BUY_NOW)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (action.equals(BUY_NOW)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (action.equals(VIEW_CART)) {
                url = VIEW_CART_PAGE;
            } else if (action.equals(TURN_BACK)) {
                url = COURSE_DETAIL_PAGE;
            } else if (action.equals(REMOVE_COURSE_CART)) {
                url = REMOVE_COURSE_CART_CONTROLLER;
            } else if (action.equals(SHOW_LIST_INSTRUCTOR)) {
                url = SHOW_LIST_INSTRUCTOR_CONTROLLER;
            } else if (action.equals(HANDLE_VNPAY)) {
                url = VNPAY_CONTROLLER;
            } else if (action.equals(ADD_INSTRUCTOR)) {
                url = ADD_INSTRUCTOR_CONTROLLER;
            } else if (action.equals(VIEW_COURSE_DETAIL)) {
                url = VIEW_COURSE_DETAIL_CONTROLLER;
            } else if (action.equals(FILTER_BY_TYPE)) {
                url = FILTER_BY_TYPE_CONTROLLER;
            } else if (action.equals(FILTER_BY_PRICE)) {
                url = FILTER_BY_PRICE_CONTROLLER;
            } else if (action.equals(FILTER_BY_LEVEL)) {
                url = FILTER_BY_LEVEL_CONTROLLER;
            } else if (action.equals(RESET_PASSWORD)) {
                url = FORGOT_PASSWORD_CONTROLLER;
            } else if (action.equals(GET_OTP)) {
                url = HANDLE_OTP_CONTROLLER;
            } else if (action.equals(SET_NEW_PASSWORD)) {
                url = SET_NEW_PASSWORD_CONTROLLER;
            }else if (action.equals(EDIT_INSTRUCTOR)) {
                url = EDIT_INSTRUCTOR_CONTROLLER;
            }else if (action.equals(HIDE_INSTRUCTOR)) {
                url = HIDE_INSTRUCTOR_CONTROLLER;
            }else if (action.equals(LEARNING)) {
                url = LEARNING_CONTROLLER;
            }else if (action.equals(VIEW_VIDEO)) {
                url = VIEW_VIDEO_CONTROLLER;
            }else if (action.equals(VIEW_COURSE_PAGE)) {
                url = VIEW_COURSE_PAGE_CONTROLLER;
            } else if(action.equals(DELETECUSTOMER)){
                url = DELETECUSTOMER_CONTROLLER;
            } else if(action.equals(UPDATECUSTOMER)){
                url = UPDATECUSTOMER_CONTROLLER;
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
