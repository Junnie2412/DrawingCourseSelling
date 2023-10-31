package controllers.forgotpassword;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.UserDAO;

/**
 *
 * @author TienToan
 */
public class ForgotPasswordController extends HttpServlet {

    private static final String SUCCESS = "forgot_password/enter-otp.jsp";
    private static final String ERROR = "forgot_password/forgot-password.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String accountID = request.getParameter("accountID");
            UserDAO dao = new UserDAO();
            boolean accountIsExist = dao.accountIsExist(accountID);
            if (accountIsExist) {
                String getEmailByAccountID = dao.getEmailByAccountID(accountID);
                if (getEmailByAccountID != null) {
                    String otp = generateOTP(6);                    
                    boolean check = SendMail.send(getEmailByAccountID, "Your OTP to reset your password", "<h3>Your OPT is: "+otp+" </h3>");
                    if (check) {
                        request.setAttribute("resetOTP", otp);
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("ERROR", "Your accountID is not exist! Please try again!");
            }
        } catch (Exception e) {
            log("Error at ForgotPasswordController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static String generateOTP(int length) {
        String numbers = "0123456789";
        Random rndm_method = new Random();
        char[] otp = new char[length];
        for (int i = 0; i < length; i++) {
            otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
        }
        return new String(otp);
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
