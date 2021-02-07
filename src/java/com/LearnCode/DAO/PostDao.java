package com.LearnCode.DAO;
import com.LearnCode.Entities.Category;
import com.LearnCode.Entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category>list = new ArrayList<>();
        
        try 
        {
            String query ="select * from categories";
            Statement stmt =this.con.createStatement();
            ResultSet set=stmt.executeQuery(query);
            
            while(set.next())
            {
            int cid = set.getInt("cid");
            String name = set.getString("name");
            String description=set.getString("description");
            Category c=new Category(cid,name,description);
            list.add(c);
            
            }
            
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return list;
    
    }
    
     public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into post(pTitle,pContent,pCode,pImg,cid,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpImg());
            pstmt.setInt(5, p.getCid());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
  
        return f;
    }
     
     public List<Post> getAllPost()
     {
     List<Post> list = new ArrayList<>();
    //FEtching All Post With the help of this method
    try 
        {
          String Query = "select * from post ORDER BY pId desc";  
          PreparedStatement pstmt =con.prepareStatement(Query);
          ResultSet set = pstmt.executeQuery();
            
          while(set.next())
          {
          int pId = set.getInt("pId");
          String pTitle = set.getString("pTitle");
          String pContent = set.getString("pContent");
          String pCode = set.getString("pCode");
          String pImg = set.getString("pImg");
          Timestamp pDate = set.getTimestamp("pDate");
          int cid = set.getInt("cid");
          int userId = set.getInt("userId");
          
          
          Post p = new Post(pId, pTitle, pContent, pCode, pImg, pDate, cid, userId);
          list.add(p);
          
          }
          
   
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    
     return list;
     }
     
     
     public List<Post> getPostByCid(int cid)
     {
     List<Post> list = new ArrayList<>();
     //Fetch Only those post which we want to fetch with category ID
     try 
        {
          String Query = "select * from post where cid = ?";
          PreparedStatement pstmt =con.prepareStatement(Query);
          pstmt.setInt(1,cid);
          ResultSet set = pstmt.executeQuery();
            
          while(set.next())
          {
          int pId = set.getInt("pId");
          String pTitle = set.getString("pTitle");
          String pContent = set.getString("pContent");
          String pCode = set.getString("pCode");
          String pImg = set.getString("pImg");
          Timestamp pDate = set.getTimestamp("pDate");
          int userId = set.getInt("userId");
          
          
          Post p = new Post(pId, pTitle, pContent, pCode, pImg, pDate, cid, userId);
          list.add(p);
          
          }
          
   
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
     
     return list;
     }
    
     public Post getPostByPostId(int postId)
     {
     Post p = null;    
     try
     {    
     String q = "select * from post where pId = ?";
     PreparedStatement pstmt = this.con.prepareCall(q);
     
     pstmt.setInt(1, postId);
     ResultSet set = pstmt.executeQuery();
     
     if(set.next())
     {
         
          int pId = set.getInt("pId");
          String pTitle = set.getString("pTitle");
          String pContent = set.getString("pContent");
          String pCode = set.getString("pCode");
          String pImg = set.getString("pImg");
          Timestamp pDate = set.getTimestamp("pDate");
          int cid = set.getInt("cid");
          int userId = set.getInt("userId");
          
          
          p = new Post(pId, pTitle, pContent, pCode, pImg, pDate, cid, userId);
     
     
     
     }
     
     }
     catch(Exception e)
     {
     e.printStackTrace();
     }
     
     return p;
     }
     
    
}
