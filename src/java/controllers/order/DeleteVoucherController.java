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
@WebServlet(name = "DeleteVoucherController", urlPatterns = {"/DeleteVoucherController"})
public class DeleteVoucherController extends HttpServlet {

    private static final String ERROR = "";
    private static final String SUCCESS = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;

        try {
            int voucherID = Integer.parseInt("voucherID");

            VoucherDAO voucherDAO = new VoucherDAO();
            VoucherError voucherError = new VoucherError();

            if (voucherDAO.deleteVoucher(voucherID)) {
                url = SUCCESS;
                request.setAttribute("MESSAGE", "Delete Voucher Successfully");

            } else {
                request.setAttribute("VOUCHER_ERROR", voucherError);
                request.setAttribute("MESSAGE", "Delete Voucher Unsuccessfully");
            }
        } catch (Exception e) {
            log("Error at UpdateVoucherController");
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
