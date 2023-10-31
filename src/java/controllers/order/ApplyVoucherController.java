package controllers.order;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.VoucherDAO;

/**
 *
 * @author TienToan
 */
public class ApplyVoucherController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "checkout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            HttpSession session = request.getSession();
            float total = Float.parseFloat(request.getParameter("total"));
            String voucherCode = request.getParameter("voucherCode");
            VoucherDAO vouDao = new VoucherDAO();
            boolean checkExist = vouDao.checkDuplicatedVoucherCode(voucherCode);
            if (checkExist) {
                int discount = vouDao.checkVoucherCodeExist(voucherCode, total);
                if (discount != 0) {
                    session.setAttribute("DISCOUNT", discount);
                    session.setAttribute("VOUCHERCODE", voucherCode);
                } else {
                    request.setAttribute("ERROR", "The code is expired!");
                    session.setAttribute("DISCOUNT", 0);
                }
            } else {
                request.setAttribute("ERROR", "The code is not exist!");
                session.setAttribute("DISCOUNT", 0);
            }
        } catch (Exception e) {
            log("Error at ApplyVoucherController");
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
