
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>
        
        
        <title>Register Page</title>
    </head>
    <body>
        <!--Nav-Bar      -->
<%@include file = "navbar.jsp" %>
     


<main class="d-flex align-items-center primary-background  banner-background" style="padding-bottom: 70px;height:130vh ">
            <div class="container">
                <div class="row">
                    <div class ="col-md-6 offset-3">
                        <div class="card">
                                <div class="card-header primary-background text-white text-center banner-background">
                                    <span class="fa fa-user-plus fa-3x"></span>
                                    <br>
                                <h3>Register Here</h3>
                                </div>
                                <div class="card-body">
                                    <form id="reg-form" action="Reg_Servlet" method="Post">
                                         <div class="form-group">
                                            <label for="user_name">User Name</label>
                                            <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="userHelp" placeholder="Enter User Name">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input name="user_pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        
                                        
                                        <div class="form-group">
                                            <label for="gender">Select Gender</label>
                                            <input type="radio" value="male"  name="gender" id="gender">Male &nbsp;&nbsp;&nbsp;
                                            <input type="radio" value="female" name="gender" id="gender">Female;
                                        </div>
                                        
                                        <div class="form-group">
                                            <textarea name="about" class="form-control" id="" placeholder="Enter Something About Yourself" rows="3"></textarea>
                                        </div>
                                        
                                        
                                        <div class="form-check">
                                            <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Agree terms & Condition </label>
                                        </div>
                                        <br>
                                        
                                       <center>
                                           <div class="conatiner text-center" id="loader" style="display: none">
                                           <span class="fa fa-refresh fa-spin fa-3x"></span>
                                           <h3>Please wait....</h3>
                                           </div>
                                           <button id="submit-btn" type="submit" class="btn  primary-background text-white">Submit</button></center>
                                    </form>
                                    
                                </div>
                            
                            
                            <div class="card-footer  primary-background">
                                <center><a href="#" class="text-white ">Privacy Policy </a></center>
                            </div>
                            
                            </div>
                </div>
            </div>
        </main>
        
        
        
         <!--        JavaScript-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="JS/JavaScript.js" type="text/javascript"></script>    

<script>
            $(document).ready(function(){

  console.log("loaded...")
  
  $('#reg-form').on('submit',function(event){
     
        event.preventDefault();
     
//     var f = $(this).serialize();
       let form = new FormData(this); 
       $('#submit-btn').hide();
       $('#loader').show();
     
     $.ajax({
         url: "Reg_Servlet",
         data : form,
         type : 'Post',
         
         success: function(data,textStatus,jqHXR) {
         console.log(data);
//         console.log("success......")
         $('#submit-btn').show();
         $('#loader').hide();
         
         
         if(data.trim()==='Succefully Done')
         {        
         swal("Registered Successfully.. We are Redirecting to Login Page")
         .then((value) => {
         window.location="Login_Page.jsp"
         });
         }else
         {
         swal(data);   
         }
         },
         
         error : function(jqHXR,textStatus,errorThrown) {
         console.log(jqHRX);
//         console.log("error......")
         $('#submit-btn').show();
         $('#loader').hide();
         swal("Something went wrong plz try again..");
         },
         processData: false,
         contentType: false
         
         
         });
         });
         });
        </script>

    </body>
</html>
