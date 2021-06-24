<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="hd" uri="/tlds/myTags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <title>Dalilinaure - Stories </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <!--<link rel="stylesheet" type="text/css" href="">-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/custom.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <hd:customheader/>
        <div class="container">
            <h1>Success Stories</h1>
            <div class="story-holder">
                <c:forEach var="story" items="${storylist}"  varStatus="status" >

                    <div class="row" style="background-color: #FFF">
                        <div class="col-md-5">
                            <img src=" <c:url value="img/profiles/${story.image}"/>" 
                                 style="width:200px;height: 200px; " />
                        </div>
                        <div class="col-md-7">
                            <h2>${story.personByPerson1.firstname} and ${story.personByPerson2.firstname}</h2>
                            <h4>${story.storyhead}</h4>
                            <p>${story.story}</p>
                        </div>
                    </div>
                    
                    <!--                            <div class="row">
                                                    <div class="col-md-7">
                                                        <h2>Jhon and Jenny</h2>
                                                        <h4>Found our match through this platform</h4>
                                                        <p>Freedom to work on ideal projects. On GetLance, you run your own business and choose your own clients and projects. Just complete your profile and we’ll highlight ideal jobs. </p>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <img src=" <c :url value="img/profiles/profileimage.png"/>" 
                                                             style="width:200px;height: 200px;float:right " />
                                                    </div>
                    
                                                </div> -->

                </c:forEach>

                <hr style="background-color: #eee">


            </div>

        </div>

        <hd:customfooter/>
    </body>
</html>
