package blog;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import utils.DBUtil;

/**
 *
 * @author TienToan
 */
public class BlogDAO {

    private static final String CREATE_BLOG = "INSERT INTO  VALUES (?,?,?,?,?,?,?)";
    private static final String UPDATE_BLOG = "UPDATE tblPost set title=?, content=?, image=? WHERE postID=?";
    private static final String DELETE_BLOG = "DELETE tblPost WHERE postID=?";
    private static final String GET_BLOG = "SELECT * FROM tblPost WHERE postID = ?";

    public boolean createBlogPost(BlogDTO blogPost) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        LocalDate curDate = LocalDate.now();
        Date date = java.sql.Date.valueOf(curDate);
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_BLOG);
                ptm.setString(1, blogPost.getImage());
                ptm.setString(2, blogPost.getTitle());
                ptm.setString(3, blogPost.getContent());
                ptm.setDate(4, date);
                ptm.setBoolean(5, blogPost.isIsApproved());
                ptm.setString(6, blogPost.getAccountID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateBlog(BlogDTO blogPost) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_BLOG);
                ptm.setString(1, blogPost.getTitle());
                ptm.setString(2, blogPost.getContent());
                ptm.setString(3, blogPost.getImage());
                ptm.setInt(4, blogPost.getPostID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteBlog(int postID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_BLOG);
                ptm.setInt(1, postID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public BlogDTO getBlog(int postID) throws SQLException {
        BlogDTO blog = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_BLOG);
                ptm.setInt(1, postID);
                
                rs = ptm.executeQuery();
                if(rs.next()){
                    String image = rs.getString("image");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Date dateCreate = rs.getDate("dateCreate");
                    boolean isApprove = rs.getBoolean("isApprove");
                    String accountID = rs.getString("accountID");
                    
                    blog = new BlogDTO(postID, image, title, content, dateCreate, isApprove, accountID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return blog;
    }
}
