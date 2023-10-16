/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class ModuleDAO {
    private static final String LASTEST_MODULE ="SELECT TOP 1 * FROM tblModule ORDER BY moduleID DESC";
    
    private static final String QUANTITY_OF_MODULES ="SELECT COUNT(moduleID) AS countModule FROM tblModule WHERE courseID = ? ";
       
    public ModuleDTO getLastestModule() throws SQLException{
        ModuleDTO module = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
            conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(LASTEST_MODULE);
                rs = ptm.executeQuery();
                if(rs.next()){
                    int moduleID = rs.getInt("moduleID");
                    String title = rs.getString("title");
                    int lessonID = rs.getInt("lessonID");

                    module = new ModuleDTO(moduleID, title, lessonID);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return module;
    }
    
    public int getQuantityOfModules(String courseID) throws SQLException{
        int countModule = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(QUANTITY_OF_MODULES);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    countModule = rs.getInt("countModule");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return countModule;
    }
}
