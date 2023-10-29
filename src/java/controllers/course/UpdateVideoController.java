package controllers.course;

import course.VideoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateVideoController", urlPatterns = {"/UpdateVideoController"})
public class UpdateVideoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        int videoId = Integer.parseInt(request.getParameter("videoId"));
        
        String content = request.getParameter("content");
        LocalTime videoTime = LocalTime.parse(request.getParameter("time"));
        
        VideoDAO vd = new VideoDAO();
        
        try {
            vd.updateVideo(videoId, content, videoTime);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateVideoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("CreateVideoController?lessionId=" + lessonId);
    }
}
