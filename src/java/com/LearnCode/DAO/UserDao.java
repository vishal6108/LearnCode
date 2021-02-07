
package com.LearnCode.DAO;

import com.LearnCode.Entities.User;
import java.sql.*;
import java.util.*;



public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    // method to insert data of user in database
    
    public boolean saveUser(User user)
    {
        boolean f=false;
        try {
            
             String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
             PreparedStatement pstmt = this.con.prepareStatement(query);
             pstmt.setString(1, user.getName());
             pstmt.setString(2, user.getEmail());
             pstmt.setString(3, user.getPassword());
             pstmt.setString(4, user.getGender());
             pstmt.setString(5, user.getAbout());
             
             pstmt.executeUpdate();
             f=true;
             
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
        return f;
    }
    
    // Get User by User E-Mail & Password
    
    public User getUserByEmailAndPassword(String email, String password)
    {
      User user=null;
      
      
        try {
            String query ="select * from user Where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next())
            {
                user = new User();
             // Data From DB   
            String name = set.getString("name");
            //  Set in User Obj
            user.setName(name);
            
            user.setId(set.getInt("id"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setAbout(set.getString("about"));
            user.setDateTime(set.getTimestamp("regdate"));
            user.setProfile(set.getString("profile"));
            
            
            
            
            }
            
            
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
      
      
        return user;
      
    }
    
    
    // Get the Updated Data From Profile Page and Update it
    public boolean updateUser(User user)
    {
        boolean f=false;
        try {
            
             String query = "update user set name=? , email=? , password=? , gender=? , about=?, profile=? where id=? ";
             PreparedStatement pstmt = this.con.prepareStatement(query);
             pstmt.setString(1, user.getName());
             pstmt.setString(2, user.getEmail());
             pstmt.setString(3, user.getPassword());
             pstmt.setString(4, user.getGender());
             pstmt.setString(5, user.getAbout());
             pstmt.setString(6, user.getProfile());
             pstmt.setInt(7, user.getId());
             
             pstmt.executeUpdate();
             f=true;
            
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId)
    {
        User user = null;
        
        try{
        String q = "select * from user where id=? ";
        PreparedStatement pstmt = this.con.prepareCall(q);
        pstmt.setInt(1, userId);
        ResultSet set = pstmt.executeQuery();
        if(set.next())
        {
        user = new User();
             // Data From DB   
            String name = set.getString("name");
            //  Set in User Obj
            user.setName(name);
            
            user.setId(set.getInt("id"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setAbout(set.getString("about"));
            user.setDateTime(set.getTimestamp("regdate"));
            user.setProfile(set.getString("profile"));
        }
        
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        
        
        return user;
    }
            
     public User viewUserB(String name)
     {
     User user = null;
         try 
         {
          String q = "select * from user where name=?";
          PreparedStatement pstmt=this.con.prepareStatement(q);
          pstmt.setString(1, name);
          ResultSet set=pstmt.executeQuery();
          
          if(set.next())
          {
            user = new User();
            user.setId(set.getInt("id"));
            user.setName(set.getString("name"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setAbout(set.getString("about"));
            user.setDateTime(set.getTimestamp("regdate"));
            user.setProfile(set.getString("profile"));
            
          }    
   
         } 
         catch (Exception e) 
         {
             e.printStackTrace();
         }
      return user;
     }        
             
}
