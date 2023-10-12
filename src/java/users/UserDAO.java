/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import utils.DBUtil;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HOANG DUNG
 */
public class UserDAO {
    private static final String LOGIN = "SELECT * FROM tblAccount WHERE accountID=? AND password=? ";
    private static final String LOGINBYGOOGLE = "SELECT fullName, roleID FROM tblUsers WHERE userID=?";
    private static final String INSERTSTAFF = "INSERT INTO tblAccount VALUES (?,?,?,?,?,?,?,?)";
    private static final String DELETESTAFF = "DELETE tblAccount WHERE accountID=?";
    private static final String UPDATESTAFF ="UPDATE tblAccount set password=?, fullName=?, dateOfBirth=?, isActive=?, image=?, email=? WHERE accountID=?";
    private static final String LOADSTAFF = "SELECT * FROM tblAccount WHERE role = 'Staff'";
    public UserDTO checkLogin(String userName, String password) throws SQLException{
        UserDTO user=null;
        
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        
        try{
            conn=DBUtil.getConnection();
            if(conn!=null){
                ptm=conn.prepareStatement(LOGIN);
                ptm.setString(1, userName);
                ptm.setString(2, password);
                rs=ptm.executeQuery();
                
                if(rs.next()){
                    String fullName=rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role=rs.getString("role");
                    Boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email=rs.getString("email");
                    user=new UserDTO(userName, password, fullName, dateOfBirth, role,isActive,image, email);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        
        return user;
    } 
    
    
    public UserDTO checkLoginByGoogle(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGINBYGOOGLE);
                ptm.setString(1, userID);                
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role = rs.getString("role");
                    Boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email = rs.getString("email");
                    user = new UserDTO(fullName, "", fullName, dateOfBirth, role, isActive, image, email);
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
        return user;
    }

    public UserDTO checkSignup(String emailSignup, String idSignup, String passwordSignup) {
        UserDTO u = null;
        try {
            Connection cn = DBUtil.getConnection();
            if (cn != null) {
                String sql = "SELECT accountID, password, fullName, dateOfBirth, role, phone, isActive, image, email\n"
                        + "FROM tblAccount\n"
                        + "WHERE accountID = ? OR email = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, idSignup);
                pst.setString(2, emailSignup);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String accountID = rs.getString("accountID");
                        String password = rs.getString("password");
                        String email = rs.getString("email");

                        u = new UserDTO(accountID, password, email);
                    }
                    return u;
                }
            }
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public UserDTO signUp(String emailSignup, String idSignup, String passwordSignup) {
        UserDTO u = null;
        try {
            Connection cn = DBUtil.getConnection();
            if (cn != null) {
                String sql = "INSERT tblAccount VALUES(?, ?, '', '', 'Customer', '', 1, '', ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, idSignup);
                pst.setString(2, passwordSignup);
                pst.setString(3, emailSignup);
                ResultSet rs = pst.executeQuery();
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    

    public boolean insertStaff(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERTSTAFF);
                ptm.setString(1, user.getAccountID());
                ptm.setString(2, user.getPassword());
                ptm.setString(3, user.getFullName());
                ptm.setDate(4, user.getDateOfBirth());
                ptm.setString(5, user.getRole());
                ptm.setBoolean(6, user.isIsActive());
                ptm.setString(7, user.getImage());
                ptm.setString(8, user.getEmail());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
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

    public boolean deleteStaff(String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETESTAFF);
                ptm.setString(1, accountID);
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

    public boolean updateStaff(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATESTAFF);
                ptm.setString(1, user.getPassword());
                ptm.setString(2, user.getFullName());
                ptm.setDate(3, user.getDateOfBirth());
                ptm.setBoolean(4, user.isIsActive());
                ptm.setString(5, user.getImage());
                ptm.setString(6, user.getEmail());
                ptm.setString(7, user.getAccountID());
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
    public List<UserDTO> loadStaffList() throws SQLException {
        List<UserDTO> staffList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOADSTAFF);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String password = rs.getString("password");
                    String fullName=rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role=rs.getString("role");
                    Boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email=rs.getString("email");
                    
                    staffList.add(new UserDTO(accountID, password, fullName, dateOfBirth, role,isActive,image, email));
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
        return staffList;
    }
}
