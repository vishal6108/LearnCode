<%-- 
    Document   : ShowPost_Page
    Created on : 05-Feb-2021, 2:48:58 pm
    Author     : Amit
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.LearnCode.DAO.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.LearnCode.Entities.Category"%>
<%@page import="com.LearnCode.Entities.Message"%>
<%@page import="com.LearnCode.Entities.Post"%>
<%@page import="com.LearnCode.Helper.ConnectionProvider"%>
<%@page import="com.LearnCode.DAO.PostDao"%>
<%@page import="com.LearnCode.Entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user==null)
    {
    response.sendRedirect("Login_Page.jps");
    }
%>

<%
String uname =request.getParameter("u_name");
UserDao ud = new UserDao(ConnectionProvider.getConnection());
User u =  ud.viewUserB(uname);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 77% 95%, 50% 100%, 23% 95%, 0 100%, 0% 35%, 0 0);
            } 
            
/*            .card-img-top {
                width: 100%;
                height: 10vw;
                object-fit: cover;
            }*/


            .border-bg{

                border-color:#ff5722!important;
            }
           a.ex2:hover, a.ex2:active {
               font-size: 150%;
           }
           
               font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;

            }


            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }

            body{
                background:url(IMG/bgsp1.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            
            .card {
                margin: 0 auto; /* Added */
                float: none; /* Added */
                margin-bottom: 10px; /* Added */
                min-height: 200px;
            }

           
        </style>
        <title>LearnCode</title>
    </head>
    <body>
        
                <!--Nav-Bar      -->
                <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-tv"></span>&nbsp;LearnCode</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="Profile.jsp"><span class="fa fa-bell"></span>&nbsp;Code-X-Ninja  <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class ="fa fa-server"></span>&nbsp;  Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
       <li class="nav-item">
          <a class="nav-link" href="Contact_Page.jsp"><span class="fa fa-address-card"></span>&nbsp;&nbsp;Contact</a>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="#" data-toggle="modal" data-target="#Addpost-Modal"><span class="fa fa-pencil-square-o"></span>&nbsp;&nbsp;Do Post</a>
      </li>
      
      
      
    </ul>
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
              <a class="nav-link" href="#!" data-toggle="modal" data-target="#Profile-Modal"><span class="fa fa-user"></span>&nbsp;&nbsp;<%= user.getName()%></a>
      </li>
          <li class="nav-item">
          <a class="nav-link" href="Logout_Servlet"><span class="fa fa-user-times"></span>Sign Out</a>
      </li>
          
      </ul>
      
  </div>
</nav>
      
<!--   Welcome Message   -->

<div class="container-fluid p-0 m-0">
    <div class="jumbotron primary-background text-white" >
        <div class="container">
            <h3 class="display-4 text-center">Welcome <%= user.getName() %></h3>    
        </div>
        </div>
    </div>


<!--                            Main Content Of View Page-->
<main>
    <div class="container">

            <div class="row m-6">

                <div class="col-md-8 offset-md-2">


                    <div class="card border-bg" style="width: 30rem;">

                        <div class="card-header primary-background text-white">

                            <h4 class="post-title text-center">User Detail</h4>


                        </div>

                        <div class="card-body" style="width: 30rem;">

                            <img class="card-img-top" src="pimg/<%= u.getProfile() %>" alt="Card image cap">


                            <!--          Other   Details-->
<div>
             <table class="table">
                 <tbody class="thead-light">
                     <tr class="primary-background text-white">
                         <th scope="col">ID :</th>
                         <td scope="row"><b><%= u.getId()%></b></td>
                         </tr>
                         
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Name :</th>
                         <td scope="row"><b><%= u.getName()%></b></td>
                         </tr>
                         
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Email :</th>
                         <td><b><%= u.getEmail().toUpperCase() %></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Gender :</th>
                         <td><b><%= u.getGender().toUpperCase() %></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">About :</th>
                         <td><b><%= u.getAbout().toUpperCase() %></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Registered On :</th>
                         <td><b><%= DateFormat.getDateTimeInstance().format(u.getDateTime()) %></b></td>
                         </tr>

                 </tbody>
             </table>
                         </div>

                        </div>
           
                            <div class="card-footer text-center">   
                               <a class="btn btn-outline-priamry primary-background text-white ex2" href="Profile.jsp">DASHBOARD</a>   
      
                            </div>    

                         
                         
                            </div>    

                        </div>



                    </div>


                </div>

            </div>

        </div>
</main>
                            
                            
        <!--Profile Modal      -->
<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="">
    Launch demo modal
</button>-->

<!-- Modal -->
<div class="modal fade" id="Profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel">LearnCode</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="conatiner text-center">

             <img src="pimg/<%= user.getProfile()%>" class="card-img-top img-fluid" style="border-radius: 50%;max-width: 100px;">
             <br>
             <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
<!--             Details-->
<div id="Profile-Detail">
             <table class="table">
                 <tbody class="thead-light">
                     <tr class="primary-background text-white">
                         <th scope="col">ID :</th>
                         <td scope="row"><b><%= user.getId()%></b></td>
                         </tr>
                         
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Email :</th>
                         <td><b><%= user.getEmail().toUpperCase() %></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Gender :</th>
                         <td><b><%= user.getGender().toUpperCase() %></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">About :</th>
                         <td><b><%= user.getAbout().toUpperCase() %></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Registered On :</th>
                         <td><b><%= user.getDateTime().toString() %></b></td>
                         </tr>

                 </tbody>
             </table>
                         </div>
                         
                         
                         

                         
<!--                        Edit Detail-->
                         
<div id="Profile-Edit" style="display: none">
    <h3 class="mt-2">Edit Detail</h3>
    <form action="Edit_Servlet" method="Post" enctype="multipart/form-data">
    <table class="table">
    <tbody class="thead-light">
                     <tr class="primary-background text-white">
                         <th scope="col">ID :</th>
                         <td scope="row"><b><%= user.getId()%></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Name :</th>
                         <td><b><input type="text" class="form-control" value="<%= user.getName()%>" name="user_name"></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Email :</th>
                         <td><b><input type="email" class="form-control" value="<%= user.getEmail()%>" name="user_email"></b></td>
                         </tr>
                         
                         <div class="container">
                         <tr class="primary-background text-white">
                         <th scope="col">Password :</th>
                         <td><b><input type="password" class="form-control" value="<%= user.getPassword()%>" id="password" name="user_pass">
                         <i class="fa fa-eye " id="togglePassword"></i>    
                         </b></td>
                         </tr>
                         </div>
                         
                         
                         <tr class="primary-background text-white">
                         <th scope="col">Gender :</th>
                         <td><b><%= user.getGender().toUpperCase() %></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">About :</th>
                         <td><b><textarea rows="2" class="form-control" name="user_about" ><%= user.getAbout()%></textarea></b></td>
                         </tr>
                         
                         <tr class="primary-background text-white">
                         <th scope="col">New Profile Photo :</th>
                         <td><b><input type="file" class="form-control" name="user_profile" ></b></td>
                         </tr> 
                  
                         

                 </tbody>    
    </table>
                          <center><button type="submit" class="btn  primary-background text-white">Submit</button></center>
    </form>
    </div>

            
             </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn primary-background text-white " id="edit-profile-btn">Edit</button>
            </div>
        </div>
    </div>
</div>
        
<!--        DO POST MODAL-->
<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>-->

<!-- Modal -->
<div class="modal fade" id="Addpost-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-white primary-background">
        <h5 class="modal-title" id="exampleModalLabel">Post Forum</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="AddpServlet" method="post" id="apf" enctype="multipart/form-data">
          <div class="form-group">
              <select class="form-control" name="cid" id="" placeholder="Categories">                
                  <option selected disabled> -- Please choose --</option>
                  <%
                  PostDao postd = new PostDao(ConnectionProvider.getConnection());
                  ArrayList<Category> list = postd.getAllCategories();
                  for(Category c:list)
                  {
                  %>
                  <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                  
                  <%
                   }
                  %>
              </select>    
          </div>
              
          <div class="form-group">
              <label><b>Title</b></label>
              <small>( Be specific and imagine you’re asking a question to another person )</small>
              <input type="text" class="form-control" name="ptitle" id="">    
          </div>
          
          <div class="form-group">
              <label><b>Body</b></label>
              <small>( Include all the information someone would need to know about it )</small>
              <textarea class="form-control" name="pcontent" id="" style="height: 100px; "></textarea>
          </div>
              
          <div class="form-group">
              <label><b>Code</b></label>
              <small>( Add up all the code and make it in a proper formatting (if any) )</small>
              <textarea class="form-control" name="pcode" id="" style="height: 100px; "></textarea>
          </div>
              
              
          <div class="form-group">
              <label><b>Upload File</b></label>
              <small>( upload files for better understanding of code/content )</small>
              <input type="file" name="pfile" id="">
          </div>
              <div class="container text-center">
              <button type="submit" value="submit" class="btn primary-background text-white ">Post</button> 
              </div>
          </form>
          
          
      </div>
    </div>
  </div>
</div>

       <!--        JavaScript-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="JS/JavaScript.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>
const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password'); 


togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});
    
</script>
<script>
    $(document).ready(function(){
        let editStatus = false;
        
        $('#edit-profile-btn').click(function(){
           
           if(editStatus==false)
           {
            $('#Profile-Detail').hide();
            $('#Profile-Edit').show();
            editStatus = true;
            $(this).text("Back")
           }
           else
           {
            $('#Profile-Detail').show();
            $('#Profile-Edit').hide();
            editStatus = false;
            $(this).text("Edit")
           }
        });
        
    });
</script>
<script>
//Add Post Js
$(document).ready(function(e){
   $("#apf").on("submit" , function(event){
   event.preventDefault();
   console.log("you have clicked on submit..")
   let form = new FormData(this);
   
   $.ajax({
       url  : "AddpServlet",
       type : 'POST',
       data : form ,
       success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() === 'done')
                    {
                                swal("Post has been Posted Successfully!", "saved successfully", "success")
                                .then((value) => {
                                 window.location="Profile.jsp"
                                 });
                    } else
                    {
                                swal("Error!!", "Something went wrong try again...", "error");
                    }
                    },
                    
       error: function (jqXHR, textStatus, errorThrown) {
                                swal("Error!!", "Something went wrong try again...", "error");   
                    },
                    processData: false,
                    contentType: false
       
       
   })
   }) 
})
</script>
    </body>
</html>
