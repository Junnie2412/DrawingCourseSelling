/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.order;

import course.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import order.VoucherDAO;
import order.VoucherError;

/**
 *
 * @author HOANG DUNG
 */
@WebServlet(name = "CreateVoucherController", urlPatterns = {"/CreateVoucherController"})
public class CreateVoucherController extends HttpServlet {

    private static final String ERROR = "createVoucher.jsp";
    private static final String SUCCESS = "createVoucher.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        
        try {
            float discountPercent = Float.parseFloat(request.getParameter("discountPercent"));
            String voucherCode = request.getParameter("voucherCode");
            Date createdDay = Date.valueOf(request.getParameter("createdDay"));
            Date expiredDay = Date.valueOf(request.getParameter("expiredDay"));
            String courseID = request.getParameter("courseID");
            
            VoucherDAO voucherDAO = new VoucherDAO();
            CourseDAO courseDAO = new CourseDAO();
            VoucherError voucherError = new VoucherError();
            boolean check = true;
            
            if(discountPercent > 100 || discountPercent < 0){
                check = false;
                voucherError.setDiscountPercentError("Discount Percent must be in [0;100]%");
            }
            if(voucherDAO.checkDuplicatedVoucherCode(voucherCode)){
                check = false;
                voucherError.setVoucherCodeError("This Voucher Code has already existed!");
            }
            if(createdDay.compareTo(expiredDay) > 0){
                check = false;
                voucherError.setExpiredDayError("The expired Day must be after the created Day!");
            }
            if(!courseDAO.checkExistedCourse(courseID)){
                check = false;
                voucherError.setCourseIDError("This CourseID is not existed");
            }
            
            if(check){
                if(voucherDAO.createVoucher(discountPercent, voucherCode, createdDay, expiredDay, courseID)){
                    url = SUCCESS;
                    request.setAttribute("MESSAGE", "Create Voucher Successfully");
                }
            }else{
                request.setAttribute("VOUCHER_ERROR", voucherError);
                request.setAttribute("MESSAGE", "Create Voucher Unsuccessfully");
            }
     
        } catch (Exception e) {
            log("Error at CreateVoucherController");
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
