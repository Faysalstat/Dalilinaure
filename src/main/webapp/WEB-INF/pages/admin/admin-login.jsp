<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@taglib prefix="hd" uri="/tlds/myTags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}/" />
<!DOCTYPE html>
<html>
    <head>
        <title>Admin - Login</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'/>
        <link rel="stylesheet" type="text/css" href="${base}css/dashboard.css"/>
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
            <div class="adminlogin">
                <h1 style="font-weight: bolder;text-align: center">Admin Log In</h1>
                <hr style="height:5px;" />
                <form action="login" method="post">
                    <!--<h1>$ {SPRING_SECURITY_LAST_EXCEPTION.message}</h1>-->
                    ${fn:replace(SPRING_SECURITY_LAST_EXCEPTION.message, 'Bad credentials', 'Username/Password are incorrect')}
                    <div class="form-group">
                        <label>User Name:</label>
                        <input type="text" name="username"  class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" name="password" class="form-control" />
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" name="remember-me"> Remember me</label>
                    </div>
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}"
                           />
                    <div class="form-group">
                        <input name="submit" type="submit" value="Login" class="btn btn-success"/>
                    </div>

                    <div class="form-group">
                        <a style="margin-top: 20px;" href="<c:url value="/forgot-password"/>">Forget Password?</a>
                    </div>
                </form>
            </div>

        </div>
    </body>
</html>
