package com.LearnCode.Entities;
import java.sql.*;


public class Post {
    private int pId;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pImg;
    private Timestamp pDate;
    private int cid;
    private int userId;

    public Post() {
    }

    public Post(int pId, String pTitle, String pContent, String pCode, String pImg, Timestamp pDate, int cid , int userId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pDate = pDate;
        this.cid = cid;
        this.userId = userId;
    }

    public Post(String pTitle, String pContent, String pCode, String pImg, Timestamp pDate, int cid , int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pDate = pDate;
        this.cid = cid;
        this.userId = userId;
    }
    

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setInt(int i, int postId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
