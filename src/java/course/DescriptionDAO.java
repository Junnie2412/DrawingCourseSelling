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
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class DescriptionDAO {
    private static final String LASTEST_DESCRIPTION ="SELECT TOP 1 * FROM tblDescription ORDER BY descriptionID DESC";
    
    public DescriptionDTO getLastestDescription() throws SQLException{
        DescriptionDTO description = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(LASTEST_DESCRIPTION);
                if(rs.next()){
                    int descriptionID = rs.getInt("descriptionID");
                    String content = rs.getString("content");
                    String target = rs.getString("target");
                    String image = rs.getString("image");
                    String type = rs.getString("type");
                    String level = rs.getString("level");

                    description = new DescriptionDTO(descriptionID, content, target, image, type, level);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return description;
    }
}
