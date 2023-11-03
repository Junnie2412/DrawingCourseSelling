/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.order;

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
@WebServlet(name = "UpdateVocherController", urlPatterns = {"/UpdateVocherController"})
public class UpdateVocherController extends HttpServlet {

    private static final String ERROR = "updateVoucher.jsp";
    private static final String SUCCESS = "updateVoucher.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        
        try {
            int voucherID = Integer.parseInt("voucherID");
            float discountPercent = Float.parseFloat(request.getParameter("discountPercent"));
            String voucherCode = request.getParameter("voucherCode");
            Date createdDay = Date.valueOf(request.getParameter("createdDay"));
            Date expiredDay = Date.valueOf(request.getParameter("expiredDay"));
            
            VoucherDAO voucherDAO = new VoucherDAO();
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
            
            if(check){
                if(voucherDAO.updateVoucher(voucherID,discountPercent, voucherCode, createdDay, expiredDay)){
                    url = SUCCESS;
                    request.setAttribute("MESSAGE", "Update Voucher Successfully");
                }
            }else{
                request.setAttribute("VOUCHER_ERROR", voucherError);
                request.setAttribute("MESSAGE", "Update Voucher Unsuccessfully");
            }
        } catch (Exception e) {
            log("Error at UpdateVoucherController");
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

}
