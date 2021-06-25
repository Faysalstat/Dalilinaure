
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}/" />
<!DOCTYPE html>
<html>
    <head>
        <title>Dalilinaure - Welcome</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body id="welcomebody" style="background-color:#63f7ff">
        <div class="container" id="welcomebody">
            <!--<div class="col-md-12">-->
                        <c:url value="/home" var="home"/>
                        <a href="${home}" ><button class="btn btn-lg btn-success" style="float: right;margin-top: 20px">Sing in</button></a>
                <!--</div>-->
            <div class="row">
                
                <div class="col-md-6 welocmenote">
                    <h3><span class="dalilinaure">dalilinaure</span><span class="com">.com</span></h3>
                    <h1 id="headtitle">Find Your Best Match</h1>
                    <p id="subtitle">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat.</p>
                        <c:url value="/registration" var="registration"/>
                    <a href="${registration}"><button class="btn btn-lg btn-primary">Sign Up</button></a>

                </div>
                <div class="col-md-6">
                    <div id="frame" class="row" >
                        <h2 style="font-family:'sofia';text-align: center;">Success Stories</h2>
                        <div class="col-md-12">
                            <div class="mySlides">
                                <div class="col-md-6">
                                    <img class="welcome-image img-rounded" src="img/slide1.jpg" width="100%">
                                </div>
                                <div class="col-md-6" style="padding-left:20px">
                                    <h1 style="font-family: 'Sofia';font-size: 22px;color:#F05694;font-weight: bolder;">Sofia & Jhon</h1>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat.</p>
                                </div>
                            </div>
                            <div class="mySlides">
                                <div class="col-md-6">
                                    <img class=" welcome-image img-rounded" src="img/slide2.jpg" width="100%">
                                </div>
                                <div class="col-md-6" style="padding-left:20px">
                                    <h1 style="font-family: 'Sofia';font-size: 22px;color:#F05694;font-weight: bolder;">Rachel & David</h1>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat.</p>
                                </div>
                            </div>
                            <div class="mySlides">
                                <div class="col-md-6">
                                    <img class="img-rounded welcome-image" src="img/slide3.jpg" width="100%" >
                                </div>
                                <div class="col-md-6" style="padding-left:20px">
                                    <h1 style="font-family: 'Sofia';font-size: 22px;color:#F05694;font-weight: bolder;">Richie & Ron</h1>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--        <footer class="page-footer font-small" style="position: fixed;
                left: 0;
                bottom: 0;
                font-weight:bold;
                width: 100%;">
             Copyright 
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <c:url value="/home" var="home"/>
                <a href="$ {home}">Here your copyright</a><br/>
                This is footer for this webpage
            </div>
             Copyright 
        </footer>-->

        <script>
            var myIndex = 0;
            carousel();
            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";

                }
                myIndex++;
                if (myIndex > x.length) {
                    myIndex = 1
                }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 3000); // Change image every 2 seconds
            }
        </script>
    </body>
</html>
