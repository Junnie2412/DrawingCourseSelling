package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\" data-layout=\"vertical\" data-topbar=\"light\" data-sidebar=\"dark\" data-sidebar-size=\"lg\" data-sidebar-image=\"none\" data-preloader=\"disable\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("    <meta charset=\"utf-8\" />\n");
      out.write("    <title>Login</title>\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <meta content=\"Premium Multipurpose Admin & Dashboard Template\" name=\"description\" />\n");
      out.write("    <meta content=\"Themesbrand\" name=\"author\" />\n");
      out.write("    <!-- App favicon -->\n");
      out.write("    <link rel=\"shortcut icon\" href=\"admin/assets/images/favicon.ico\">\n");
      out.write("\n");
      out.write("    <!-- Layout config Js -->\n");
      out.write("    <script src=\"admin/assets/js/layout.js\"></script>\n");
      out.write("    <!-- Bootstrap Css -->\n");
      out.write("    <link href=\"admin/assets/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    <!-- Icons Css -->\n");
      out.write("    <link href=\"admin/assets/css/icons.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    <!-- App Css-->\n");
      out.write("    <link href=\"admin/assets/css/app.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    <!-- custom Css-->\n");
      out.write("    <link href=\"admin/assets/css/custom.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div class=\"auth-page-wrapper pt-5\">\n");
      out.write("        <!-- auth page bg -->\n");
      out.write("        <div class=\"auth-one-bg-position auth-one-bg\" id=\"auth-particles\">\n");
      out.write("            <div class=\"bg-overlay\"></div>\n");
      out.write("\n");
      out.write("            <div class=\"shape\">\n");
      out.write("                <svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 1440 120\">\n");
      out.write("                    <path d=\"M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z\"></path>\n");
      out.write("                </svg>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- auth page content -->\n");
      out.write("        <div class=\"auth-page-content\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-12\">\n");
      out.write("                        <div class=\"text-center mt-sm-5 mb-4 text-white-50\">\n");
      out.write("                            <div>\n");
      out.write("                                <a href=\"index.jsp\" class=\"d-inline-block auth-logo\">\n");
      out.write("                                    <img src=\"admin/assets/images/logomain.png\" alt=\"logo\" height=\"90\">\n");
      out.write("                                </a>\n");
      out.write("                            \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- end row -->\n");
      out.write("\n");
      out.write("                <div class=\"row justify-content-center\">\n");
      out.write("                    <div class=\"col-md-8 col-lg-6 col-xl-5\">\n");
      out.write("                        <div class=\"card mt-4\">\n");
      out.write("\n");
      out.write("                            <div class=\"card-body p-4\">\n");
      out.write("                                <div class=\"text-center mt-2\">\n");
      out.write("                                    <h5 class=\"text-primary\">Welcome Back !</h5>\n");
      out.write("                                    <p class=\"text-muted\">Sign in to continue to ArtCenter.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"p-2 mt-4\">\n");
      out.write("                                    <form action=\"https://themesbrand.com/velzon/html/material/index.jsp\">\n");
      out.write("\n");
      out.write("                                        <div class=\"mb-3\">\n");
      out.write("                                            <label for=\"username\" class=\"form-label\">Username</label>\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" id=\"username\" placeholder=\"Enter username\">\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"mb-3\">\n");
      out.write("                                            <div class=\"float-end\">\n");
      out.write("                                               \n");
      out.write("                                            </div>\n");
      out.write("                                            <label class=\"form-label\" for=\"password-input\">Password</label>\n");
      out.write("                                            <div class=\"position-relative auth-pass-inputgroup mb-3\">\n");
      out.write("                                                <input type=\"password\" class=\"form-control pe-5 password-input\" placeholder=\"Enter password\" id=\"password-input\">\n");
      out.write("                                                <button class=\"btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted shadow-none password-addon\" type=\"button\" id=\"password-addon\"><i class=\"ri-eye-fill align-middle\"></i></button>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"form-check\">\n");
      out.write("                                            <input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"auth-remember-check\">\n");
      out.write("                                            <label class=\"form-check-label\" for=\"auth-remember-check\">Remember me</label>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"mt-4\">\n");
      out.write("                                            <button class=\"btn btn-success w-100\" type=\"submit\">Sign In</button>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"mt-4 text-center\">\n");
      out.write("                                            <div class=\"signin-other-title\">\n");
      out.write("                                                <h5 class=\"fs-13 mb-4 title\">Sign In with</h5>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div>\n");
      out.write("                                             <button type=\"button\" class=\"btn btn-danger btn-icon waves-effect waves-light\" style=\"width: 200px;\"><i class=\"ri-google-fill fs-16\"></i>  &nbsp; \n");
      out.write("  <span class=\"button-text \">Login with Google account</span>\n");
      out.write("    \n");
      out.write(" \n");
      out.write("</button>   \n");
      out.write("                                    \n");
      out.write("                                                  \n");
      out.write("                                         \n");
      out.write("                                                \n");
      out.write("                                            \n");
      out.write("                                                \n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <!-- end card body -->\n");
      out.write("                        </div>\n");
      out.write("                        <!-- end card -->\n");
      out.write("\n");
      out.write("                        <div class=\"mt-4 text-center\">\n");
      out.write("                            <p class=\"mb-0\">Don't have an account ? <a href=\"signup.jsp\" class=\"fw-semibold text-primary text-decoration-underline\"> Signup </a> </p>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- end row -->\n");
      out.write("            </div>\n");
      out.write("            <!-- end container -->\n");
      out.write("        </div>\n");
      out.write("        <!-- end auth page content -->\n");
      out.write("\n");
      out.write("        <!-- footer -->\n");
      out.write("        <footer class=\"footer\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-12\">\n");
      out.write("                        <div class=\"text-center\">\n");
      out.write("                            <p class=\"mb-0 text-muted\">&copy;\n");
      out.write("                                <script>document.write(new Date().getFullYear())</script> ArtCenter.  <i class=\"mdi mdi-heart text-danger\"></i> \n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("        <!-- end Footer -->\n");
      out.write("    </div>\n");
      out.write("    <!-- end auth-page-wrapper -->\n");
      out.write("\n");
      out.write("    <!-- JAVASCRIPT -->\n");
      out.write("    <script src=\"assets/libs/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    <script src=\"assets/libs/simplebar/simplebar.min.js\"></script>\n");
      out.write("    <script src=\"assets/libs/node-waves/waves.min.js\"></script>\n");
      out.write("    <script src=\"assets/libs/feather-icons/feather.min.js\"></script>\n");
      out.write("    <script src=\"assets/js/pages/plugins/lord-icon-2.1.0.js\"></script>\n");
      out.write("    <script src=\"assets/js/plugins.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- particles js -->\n");
      out.write("    <script src=\"assets/libs/particles.js/particles.js\"></script>\n");
      out.write("    <!-- particles app js -->\n");
      out.write("    <script src=\"assets/js/pages/particles.app.js\"></script>\n");
      out.write("    <!-- password-addon init -->\n");
      out.write("    <script src=\"assets/js/pages/password-addon.init.js\"></script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
