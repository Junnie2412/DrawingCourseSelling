package org.apache.jsp.layout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- ~~~ Header Section ~~~ -->\n");
      out.write("        <header>\n");
      out.write("            <div class=\"custom-container\">\n");
      out.write("                <div class=\"header-area\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                        <a href=\"index.jsp\">\n");
      out.write("                            <img  height=\"100\" src=\"assets/images/logo/logo-dark.png\" alt=\"logo\">\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    <ul class=\"menu d-none d-lg-flex flex-wrap\">\n");
      out.write("                         <li>\n");
      out.write("                            <a href=\"index.jsp\">Home</a>\n");
      out.write("                        </li>\n");
      out.write("                       \n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"about.jsp\">About Us</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"courses.jsp\">Courses</a>\n");
      out.write("                            \n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"instructor.jsp\">Instructor</a>\n");
      out.write("                           \n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                             <a href=\"gallery.jsp\">Gallery</a>\n");
      out.write("                            \n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                             <a href=\"blog.jsp\">Blogs</a>\n");
      out.write("                            \n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"contact.jsp\">Contact</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                    <div class=\"header-bar ml-4\">\n");
      out.write("                        <span></span>\n");
      out.write("                        <span></span>\n");
      out.write("                        <span></span>\n");
      out.write("                    </div>\n");
      out.write("                    <form class=\"course-search-form ml-auto mr-4\">\n");
      out.write("                        <input type=\"text\" name=\"name\" placeholder=\"Search Courses\" class=\"rounded pl-0\">\n");
      out.write("                        <button type=\"submit\" class=\"rounded\"><i class=\"flaticon-loupe\"></i></button>\n");
      out.write("                    </form>\n");
      out.write("                    <a href=\"login.jsp\" class=\"custom-button\"><i class=\"fas fa-user\"></i><span>Sign Up</span></a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <!-- ~~~ Header Section ~~~ -->\n");
      out.write("\n");
      out.write("        <!-- ~~~ Mobile Menu ~~~ -->\n");
      out.write("        <div class=\"mobile-menu\">\n");
      out.write("            <span class=\"close-mobile-menu\">\n");
      out.write("                <i class=\"fas fa-times\"></i>\n");
      out.write("            </span>\n");
      out.write("            <div class=\"w-100 d-flex flex-wrap justify-content-center align-items-center\">\n");
      out.write("                <form class=\"course-search-form mr-sm-4\">\n");
      out.write("                    <select class=\"select-bar rounded\">\n");
      out.write("                        <option value=\"01\">Category</option>\n");
      out.write("                        <option value=\"02\">Physics</option>\n");
      out.write("                        <option value=\"03\">Chemistry</option>\n");
      out.write("                        <option value=\"04\">History</option>\n");
      out.write("                        <option value=\"05\">Geometry</option>\n");
      out.write("                        <option value=\"06\">LoremIp</option>\n");
      out.write("                        <option value=\"07\">UI/UX</option>\n");
      out.write("                        <option value=\"08\">Laravel</option>\n");
      out.write("                    </select>\n");
      out.write("                    <input type=\"text\" name=\"name\" placeholder=\"Search Courses\" class=\"rounded\">\n");
      out.write("                    <button type=\"submit\" class=\"rounded\"><i class=\"flaticon-loupe\"></i></button>\n");
      out.write("                </form>\n");
      out.write("                <a href=\"#0\" class=\"custom-button\"><i class=\"fas fa-user\"></i><span>Sign Up</span></a>\n");
      out.write("                <div class=\"w-100 d-lg-none\">\n");
      out.write("                    <ul class=\"menu\">\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#0\">Home</a>\n");
      out.write("                            <ul class=\"submenu\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"index.jsp\">Home 1</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"index2.jsp\">Home 2</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"about.jsp\">About Us</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#0\">Courses</a>\n");
      out.write("                            <ul class=\"submenu\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"courses.jsp\">Courses</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"course-details.jsp\">Course Details</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#0\">Pages</a>\n");
      out.write("                            <ul class=\"submenu\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"instructor.jsp\">Instructor</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"gallery.jsp\">Gallery</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"events.jsp\">Event</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"upcoming-events.jsp\">Upcoming Events</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#0\">Blog</a>\n");
      out.write("                            <ul class=\"submenu\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"blog.jsp\">Blogs</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"blog-details.jsp\">Blog Details</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"contact.jsp\">Contact</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- ~~~ Mobile Menu ~~~ -->\n");
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
