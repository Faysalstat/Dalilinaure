<%-- 
    Document   : resetPassword
    Created on : Jul 20, 2020, 5:38:40 PM
    Author     : Faysal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="hd" uri="/tlds/myTags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}/" />
<!DOCTYPE html>
<html>
    <head>
        <title>Dalilinaure - Change Password</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .btn{
                width: 100px;
            }
        </style>

    </head>
    <body>

        <div class="container">
            <div class="loginsection">
                <h1 style="font-weight: bolder;text-align: center">Reset Password</h1>
                <hr style="height:5px;" />
                <form action='<c:url value="/reset-password" />' method="post">
                    <div class="form-group">
                        <label>User Name:</label>
                        <input type="text" name="username"  class="form-control" value="${user.username}" />
                    </div>
                    <div class="form-group">
                        <label for="pwd">New Password:</label>
                        <input id="password" type="password" name="password" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="pwd">Confirm Password:</label>
                        <input oninput="chkpass();return false;" id="confirmpassword" type="password"  class="form-control" />
                    </div>
                    <div class="form-group">
                        <input id="btn" name="submit" type="submit" value="Login" class="btn btn-success" disabled="true"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script>
        function chkpass() {
            var pass = document.getElementById('password').value;
            var conpass = document.getElementById('confirmpassword').value;
            var btn = document.getElementById('btn');
            if (pass === conpass) {
                btn.disabled=false;
            }
        }
    </script>
</html>

