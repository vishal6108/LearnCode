
<%@page import="com.LearnCode.Entities.Message"%>
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
        
        
        
        <title>Login Page</title>
    </head>
    <body>
<!--Nav-Bar      -->
<%@include file = "navbar.jsp" %>
    
        <main class="d-flex align-items-center primary-background banner-background" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class ="col-md-4 offset-4">
                        <div class="card">
                                <div class="card-header primary-background text-white text-center banner-background">
                                    <span class="fa fa-user-circle-o fa- fa-3x"></span>
                                    <br>
                                <h3>Login Here</h3>
                                </div>
                            
                 
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            
                            
                            
                            <div class="alert alert-warning <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div> 


                            <%        
                                    session.removeAttribute("msg");
                                }

                            %>
                            
                                <div class="card-body">
                                    
                                    <form action="Login_Servlet" method="Post">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
<!--                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                        </div>-->
                                        <center><button type="submit" class="btn  primary-background text-white">Submit</button></center>
                                    </form>
                                    
                                </div>
                            </div>
                </div>
            </div>
        </main>
        
        
        
        
    <!--        JavaScript-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="JS/JavaScript.js" type="text/javascript"></script>    
    </body>
</html>
