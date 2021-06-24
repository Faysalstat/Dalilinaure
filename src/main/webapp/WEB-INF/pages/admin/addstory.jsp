<%-- 
    Document   : dashboard
    Created on : Jul 28, 2020, 1:15:54 AM
    Author     : Faysal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@taglib prefix="hd" uri="/tlds/myTags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Admin- Add Story</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${base}/css/dashboard.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>

        <%
            User admin = (User) session.getAttribute("admin");

            if (admin == null || !admin.getUserrole().equals("ADMIN")) {
                response.sendRedirect("login");
            }
        %>


        <!--<div class="container-fluid">-->
        <nav class="navbar  navbar-fixed-top" style="background-color:#337AB7;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Admin Panel</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                </ul>
            </div>
        </nav>
        <!--</div>-->
        <div class="container-fluid" style="padding-left:0;margin-top:51px">
            <div class="row">
                <div class="col-md-3">
                    <div class="sidenav">
                        <div class="list-group">
                            <a href="${base}/admin/dashboard" class="list-group-item active"><span class="glyphicon glyphicon-home"> </span> Dashboard</a>
                            <a href="${base}/admin/approval" class="list-group-item "><span class="glyphicon glyphicon-th-large"></span> Approval</a>
                            <a href="${base}/admin/profile" class="list-group-item"><span class="glyphicon glyphicon-user"></span> Profile</a>
                            <a href="${base}/admin/mail" class="list-group-item"><span class="glyphicon glyphicon-envelope"></span> Mail</a>
                            <a href="${base}/admin/addstory" class="list-group-item"><span class="glyphicon glyphicon-plus"></span> Add Story</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 pl-md-0">
                    <div class="dash-body">
                        <div class="storyform">
                            <h1> >>Add Stories</h1>
                            <hr>
                            <form action="savestory" method="POST" id="stories">
                                <div class="row">
                                    <div class="img-holder">
                                        <img src="<c:url value="/img/profiles/profileimage.png"/>" id="imgsrc"  class="img-rounded upimg"/>
                                    </div>
                                    <div class="btn-holder" data-provides="fileupload">
                                        <input type="hidden" name="image" id="inputimage" >
                                        <input class="inputfile" type="file" id="fileSelect">
                                        <label class=" btn btn-info " for="fileSelect">Browse</label>
                                        <button class="btn btn-success" onclick="uploadStoryImage();return false" >Uplaod</button>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>User</label>
                                            <input type="text"  name='person1' class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <br>
                                        <h4><span class="spantitle">Married to</span></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>User</label>
                                            <input type="text" name='person2' class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label >Subtitle</label>
                                    <textarea name="storyhead"  class="form-control" rows="2"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Their Story:</label>
                                    <textarea name="story"  class="form-control" rows="5" ></textarea>
                                </div>

                                <div class="form-group">
                                    <br/>
                                    <button style="float: right;width: 100px;" class="btn btn-success" type="submit" form="stories">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="container-fluid bg-4 text-center">
            <p>This is footer section</p> 
        </footer>
    </body>
    <script>
        function uploadStoryImage() {
            var formData = new FormData();
            var fileSelect = document.getElementById("fileSelect");
            if (fileSelect.files && fileSelect.files.length === 1) {
                var file = fileSelect.files[0];
                formData.set("image", file, file.name);
            }
            console.log("Hello");
            var request = new XMLHttpRequest();
            request.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    console.log(this.responseText);
                    var data = JSON.parse(this.responseText);
                    document.getElementById("imgsrc").src = "${base}/img/profiles/" + data.image;
                    document.getElementById("inputimage").value = data.image;
                }
            };
            request.open('POST', "imageupload", true);
            request.send(formData);
        }
        
    </script>
</html>
