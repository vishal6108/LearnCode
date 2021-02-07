<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage = "true" %>
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
        <title>Error Page</title>
        </head>
    <body>
        <div  class ="container p-3 text-center" style="margin-top: 40px " >
            <img src="IMG/warning-sign.png" class="img-fluid" style="width:400px;height:350px;"/>
 <br>       
            <h1 class="display-3">Aaaah!! Something went wrong..!</h1>
        <p class="display-5"><%=exception%></p>
        <a class="btn btn-outline-priamry primary-background text-white" href="index.jsp">HOME PAGE</a>
        </div>
    </body>
</html>
