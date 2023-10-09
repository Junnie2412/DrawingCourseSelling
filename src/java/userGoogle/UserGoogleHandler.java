package userGoogle;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author TienToan
 */
public class UserGoogleHandler extends HttpServlet {

    private static final String SIGNIN_PAGE = "signin.jsp";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String CUSTOMER_PAGE = "customer.jsp";
    private static final String STAFF_PAGE = "staff.jsp";
    private static final String INSTRUCTOR_PAGE = "instructor.jsp";
    //
    private static final String ADMIN = "Admin";
    private static final String CUSTOMER = "Customer";
    private static final String STAFF = "Staff";
    private static final String INSTRUCTOR = "Instructor";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SIGNIN_PAGE;
        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            UserGoogleDTO user = getUserInfo(accessToken);
            String userID = user.getId();
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLoginByGoogle(userID);
            if (loginUser == null) {
                //create account
                
                request.setAttribute("MSG_NEWACC", "Your account is already sign up!");
            } else {
                String role = loginUser.getRole();
                HttpSession session = request.getSession();
                if (role.equalsIgnoreCase(ADMIN)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = ADMIN_PAGE;
                } else if (role.equalsIgnoreCase(STAFF)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = STAFF_PAGE;
                } else if (role.equalsIgnoreCase(INSTRUCTOR)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = INSTRUCTOR_PAGE;
                } else if (role.equalsIgnoreCase(CUSTOMER)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = CUSTOMER_PAGE;
                } else {
                    request.setAttribute("ERROR", "Your account is not supported yet!");
                }
            }
        } catch (Exception e) {
            log("Error at LoginGoogleHandler: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);

        return googlePojo;
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
