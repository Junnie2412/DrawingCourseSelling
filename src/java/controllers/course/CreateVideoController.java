package controllers.course;

import course.VideoDAO;
import course.VideoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateVideoController", urlPatterns = {"/CreateVideoController"})
public class CreateVideoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lessonId = Integer.parseInt(request.getParameter("lessionId"));
        
        VideoDAO vd = new VideoDAO();
        
        List<VideoDTO> list = new ArrayList<>();
        
        try {
            list = vd.getvideosByLessonId(lessonId);
        } catch (SQLException ex) {
            Logger.getLogger(CreateVideoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("lessonId", lessonId);
        request.setAttribute("videos", list);
        request.getRequestDispatcher("instructorVideo.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String content = request.getParameter("content");
        LocalTime videoTime = LocalTime.parse(request.getParameter("time"));
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        
        VideoDAO vd = new VideoDAO();
        
        try {
            vd.createVideo(lessonId, content, videoTime, true);
        } catch (SQLException ex) {
            Logger.getLogger(CreateVideoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("CreateVideoController?lessionId=" + lessonId);
    }
    
}
