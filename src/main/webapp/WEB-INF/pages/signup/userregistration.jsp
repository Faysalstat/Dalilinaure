<%-- 
    Document   : userregistration
    Created on : Jul 14, 2020, 11:40:10 PM
    Author     : Faysal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User Registration</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h1 class="regtitle">Join Websitename</h1>
            <div class="registrationsection" style="width: 40%">
                <h1 style="font-weight: bolder;">One Step Away</h1>
                <h4 style="color: red;">${warning}</h4>
                <hr style="height:5px;" />

                <form action="adduser" method="POST" id="userform" modelAttribute="user">
                    <div class="form-group">
                        <label>User Name:</label>
                        <input id="username" type="text"  class="form-control" name="username" placeholder="username for login">
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" value="${user.email}" class="form-control" name="email" placeholder="eg. name@email.com"/>
                    </div>
                    <div class="form-group">
                        <label >Contact No</label>
                        <input type="text" value="${user.contact}" class="form-control" name="contact" placeholder="eg +22222222222">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="text" value="${user.password}" class="form-control" name="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <input type="checkbox" id="myCheck" onclick="chkterms()">
                        <label>I accept <a href="<c:url value="/termsandcondition"/>">Terms and conditions.</a></label>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="userrole"/>
                        <button id="registration" style="float: right;width: 100px;" class="btn btn-success" type="submit" form="userform" disabled>Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </body>

    <script>
        function chkterms() {
            var checkBox = document.getElementById("myCheck");
            
            if (checkBox.checked == true) {
                document.getElementById("registration").disabled = false;
            } 
        }
    </script>

</html>
