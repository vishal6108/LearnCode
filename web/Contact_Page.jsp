

<%@page import="com.LearnCode.Helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 77% 95%, 50% 100%, 23% 95%, 0 100%, 0% 35%, 0 0);
            } 
            
            .card {
                margin: 0 auto; /* Added */
                float: none; /* Added */
                margin-bottom: 10px; /* Added */
            }
        </style>

        
        
        <title>Learn Code</title>
    </head>
    <body>
<!--Nav-Bar      -->
<%@include file = "navbar.jsp" %>

<!--Banner-->
<div class="container-fluid p-0 m-0 banner-background">
    <div class="jumbotron primary-background text-white" >
        <div class="container">
            <h3 class="display-3 text-center">Get in touch</h3>
            <br><br>
            <p class="display-5 text-center">Want to get in touch ? We'd love to hear you , Here how you can reach us .  </p>
 
        </div>
        </div>
    </div>
<div class="container ">
    <div class="row">
        <div class="col-6">
<div class="card" style="width: 30rem;">
  <div class="card-body text-center">
      <center><span class=" material-icons" style="font-size:36px">call</span></center> 
    <h5 class="card-title text-center">Admission Query </h5>
    <p class="card-text">Interested in LearnCode’s ? Just pick up the phone to chat with a member of our team..</p>
    <a href="#" class="" style="color: #ff5722!important;">+91 9798X XXX10</a>
  </div>
</div>
            </div>
        <div class="col-6">
       
<div class="card" style="width: 30rem;">
  <div class="card-body text-center">
      <center><span class=" material-icons" style="font-size:36px">chat</span></center> 
    <h5 class="card-title text-center">Contact Customer Support</h5>
    <p class="card-text">Sometimes you need a little help from your friends. Or a LearnCode support rep. Don’t worry… we’re here for you.</p>
    <a href="#" class="btn btn-outline-priamry primary-background text-white" id="cb">Contact Support</a>
  </div>
</div>
      </div>      
    </div>
</div>

    







<!--        JavaScript-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="JS/JavaScript.js" type="text/javascript"></script>
<script>
$(document).ready(function(e){
    $("#cb").click(function(event){
        event.preventDefault();
        swal("ThankYou For Contacting Us");
        
        
    })
})    
    
</script>
    </body>
</html>
 