/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package submisson;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class SubmissionDAO {
    private static final String CREATE_SUBMISSION = "INSERT INTO tblSubmission(accountID, assignmentID, learningCourseID, isGraded, isPassed, instructorNote, grade, project) VALUES(?,?,?,?,?,?,?,?)";
    private static final String CHECK_PASS_SUBMISSION = "SELECT * FROM tblSubmission WHERE accountID =? AND assignmentID = ? AND learningCourseID = ? AND isPassed = 1";
    private static final String CHECK_SUBMITTED_SUBMISSION = "SELECT * FROM tblSubmission WHERE accountID =? AND assignmentID = ? AND learningCourseID = ? AND isGraded = 0";
    private static final String GET_LIST_SUBMISSION_BY_INSTRUCTOR_ID="SELECT s.*FROM tblLearningCourse l JOIN tblCourse c ON l.courseID = c.courseID JOIN tblSubmission s ON s.learningCourseID = l.learningCourseID WHERE c.accountID = ? AND s.isGraded = 0";
    private static final String GET_STUDENT_IN_SUBMISSION = "SELECT DISTINCT a.fullName FROM tblAccount a JOIN tblSubmission s ON a.accountID = s.accountID WHERE s.accountID = ?";
    private static final String GET_ASSIGNMENT_TOPIC ="SELECT DISTINCT a.topic FROM tblAssignment a JOIN tblSubmission s ON a.assignmentID = s.assignmentID WHERE s.learningCourseID = ?";
    private static final String GET_IMAGE = "SELECT project FROM tblSubmission WHERE submissionID = ?";
    private static final String UPDATE_GRADE = "UPDATE tblSubmission SET isGraded = 1, isPassed = ?, instructorNote = ?, grade= ? WHERE submissionID =?";
    private static final String GET_LEARNING_COURSE_ID = "SELECT learningCourseID FROM tblSubmission WHERE submissionID =?";
    
    public boolean createSubmission(String accountID, String assignmentID, int learningCourseID, byte[] project ) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_SUBMISSION);
                ptm.setString(1, accountID);
                ptm.setString(2, assignmentID);
                ptm.setInt(3, learningCourseID);
                ptm.setBoolean(4, false);
                ptm.setBoolean(5, false);
                ptm.setString(6, "");
                ptm.setFloat(7, 0);
                ptm.setBytes(8, project);
                
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean checkPassSubmission(String accountID, String assignmentID, int learningCourseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_PASS_SUBMISSION);
                ptm.setString(1, accountID);
                ptm.setString(2, assignmentID);
                ptm.setInt(3, learningCourseID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean checkSubmittedSubmission(String accountID, String assignmentID, int learningCourseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_SUBMITTED_SUBMISSION);
                ptm.setString(1, accountID);
                ptm.setString(2, assignmentID);
                ptm.setInt(3, learningCourseID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public List<SubmissionDTO> getListSubmission(String instructorID) throws SQLException {
        List<SubmissionDTO> list= new ArrayList();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_SUBMISSION_BY_INSTRUCTOR_ID);
                ptm.setString(1, instructorID);
                rs = ptm.executeQuery();
                
                while(rs.next()){
                    int submissionID = rs.getInt("submissionID");
                    String accountID = rs.getString("accountID");
                    String assignmentID = rs.getString("assignmentID");
                    int learningCourseID = rs.getInt("learningCourseID");
                    boolean isGraded = rs.getBoolean("isGraded");
                    boolean isPassed = rs.getBoolean("isPassed");
                    String instructorNote = rs.getString("instructorNote");
                    float grade = rs.getFloat("grade");
                    byte[] imageProject = rs.getBytes("project");
                    
                    list.add(new SubmissionDTO(submissionID, accountID, assignmentID, learningCourseID, isGraded, isPassed, instructorNote, grade, imageProject));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public String getStudentName(String accountID) throws SQLException {
        String name = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_STUDENT_IN_SUBMISSION);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    name = rs.getString("fullName");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return name;
    }
    
    public String getTopicName(int learningID) throws SQLException {
        String name = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ASSIGNMENT_TOPIC);
                ptm.setInt(1, learningID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    name = rs.getString("topic");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return name;
    }
    
    public byte[] getImage(int submissionID) throws SQLException {
        byte[] image = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_IMAGE);
                ptm.setInt(1, submissionID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    image = rs.getBytes("project");;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return image;
    }
    
    public int getLearningCourseID(int submissionID) throws SQLException {
        int learningCourseID = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LEARNING_COURSE_ID);
                ptm.setInt(1, submissionID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    learningCourseID = rs.getInt("learningCourseID");;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return learningCourseID;
    }
    
    public boolean checkUpdateGrade(float grade, String instructorNote, boolean isPassed, int submissionID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_GRADE);
                ptm.setBoolean(1, isPassed);
                ptm.setString(2, instructorNote);
                ptm.setFloat(3, grade);
                ptm.setInt(4, submissionID);
                
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
