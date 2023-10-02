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
}
