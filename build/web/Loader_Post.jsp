
<%@page import="com.LearnCode.Entities.User"%>
<%@page import="com.LearnCode.DAO.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.LearnCode.Entities.Post"%>
<%@page import="com.LearnCode.Helper.ConnectionProvider"%>
<%@page import="com.LearnCode.DAO.PostDao"%>
<style>
.card-img-top {
    width: 100%;
    height: 10vw;
    object-fit: cover;
}

.border-bg{
    
     border-color:#ff5722!important;
}
a.ex2:hover, a.ex2:active {font-size: 90%;}

body{
                background:url(IMG/bgsp1.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
</style>
<script src="JS/JavaScript.js" type="text/javascript"></script>
<div class="row">

<%
User uuu=(User)session.getAttribute("currentUser");    
    
Thread.sleep(1000);
PostDao d = new PostDao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("cid"));

List<Post> post = null;
  if(cid==0)
  {      
  post = d.getAllPost();
  }
  else
  {
  post = d.getPostByCid(cid);
  }
  if(post.size()==0)
  {
      out.println("<h3 class='display-3 text-center text-white'>No Post In This Category</h3>");
      return;
  }
for(Post p : post)
    {
%>
<!--col-lg-4 d-flex align-items-stretch-->
<div class="col-md-6 mt-2  col-sm-12 col-lg-6">
    <div class="card border border-bg h-100 ">
        <img class="card-img-top" src="bimg/<%= p.getpImg() %>" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title"><%= p.getpTitle() %></h5>
            <p class="card-text"><%= p.getpContent() %></p>
<!--            <pre class="card-text"><%= p.getpCode() %></pre>-->
            </div>
            <div class="card-footer text-center">   
            <%
            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
            %>
            <a href="#" onclick="doLike(<%= p.getpId() %>,<%= uuu.getId()%>)" class="btn primary-background text-white ex2"><i class="fa fa-thumbs-o-up"></i>&nbsp;<span class="like-counter"><%= ld.countLikeOnPost(p.getpId()) %></span></a>    
                                
                
            <a href="ShowPost_Page.jsp?post_id=<%= p.getpId()%>" class="btn primary-background text-white ex2">Read More</a> 
            <a href="#" class="btn primary-background text-white ex2"><i class="fa fa-commenting-o"></i>&nbsp;<span></span></a>    
            </div>
        </div>
</div>    

<%
    }    
%>
</div>