/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.LearnCode.DAO;

import java.sql.*;
public class LikeDao {
    
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid,int uid)
    {
        boolean f=false;
        try 
        {
            
        String q = "insert into liketab (pid,uid)values(?,?)";
        PreparedStatement pstmt=this.con.prepareCall(q);
        pstmt.setInt(1, pid);
        pstmt.setInt(2, uid);
        
        pstmt.executeUpdate();
        f=true;
        
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return f;
    }

    public int countLikeOnPost(int pid)
    {   
    int count=0;
    
        try 
        {
        String q = "select count(*) from liketab where pid=?";
        PreparedStatement pstmt =this.con.prepareCall(q);
        pstmt.setInt(1, pid);
        ResultSet set =pstmt.executeQuery();
        
        if(set.next())
        {
        count=set.getInt("count(*)");
        
        }
        
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    
    
    return count;
    }

    public boolean isLikeByUser(int pid, int uid)
    {
    boolean f=false;
        try 
        {
            String q = "select * from liketab where pid=? and uid=?";
            PreparedStatement pstmt=this.con.prepareCall(q);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            ResultSet set=pstmt.executeQuery();
            
            if(set.next())
            {
                f=true;
            }
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean disLikeByUser(int pid,int uid)
    {
    boolean f=false;
        try 
        {
            String q = "delete from liketab where pid=? and uid=?";
            PreparedStatement pstmt=this.con.prepareCall(q);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            pstmt.executeUpdate();
               
            f=true;
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return f;
    }
}
