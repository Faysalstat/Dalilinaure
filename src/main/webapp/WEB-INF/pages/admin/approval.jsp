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
        <title>Admin - Approval</title>
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
        <div class="container-fluid">
            <nav class="navbar  navbar-fixed-top" style="background-color:#337AB7;">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Admin Panel</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div>
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
                        <h2>>>Images for approval</h2>
                        <hr class="sec-devider"/>
                        <div class="row">
                            <c:forEach var="imgperson" items="${imageApprovalList}"  varStatus="status" >
                                <div class="col-md-3">
                                    <div class="imgbox">
                                        <img class="img-rounded" src="<c:url value="/img/profiles/${imgperson.image}"/>" width="100%" height="100%" />
                                        <div class="centered ">
                                            <h4>${imgperson.firstname} ${imgperson.lastname}</h4>
                                        </div>
                                    </div>
                                    <div class="apv-btn">
                                        <a href="<c:url value="/admin/approveimage/${imgperson.id}"/>" >
                                            <button style="width: 49%;margin:0;"  class="btn btn-info">Approve</button>
                                        </a>
                                        <a href="<c:url value="/admin/declineimage/${imgperson.id}"/>" >
                                            <button style="width: 49%;margin:0;"  class="btn btn-danger">Decline</button>
                                        </a>


                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <h2>>>Bio for approval</h2>
                        <hr class="sec-devider"/>
                        <table class="table table-striped ">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>Username</th>
                                    <th class="bio">Bio</th>
                                    <th colspan="2" style="text-align: center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="bioperson" items="${bioApprovalList}"  varStatus="status" >
                                    <tr>
                                        <td>${status.index+1}</td>
                                        <td>${bioperson.user.username}</td>
                                        <td class="bio">${bioperson.bio}</td>
                                        <td>
                                            <a style="color:#32a852;margin-right:10px" href="<c:url value="/admin/approvebio/${bioperson.id}"/>" >
                                                <span class="glyphicon glyphicon-ok"></span> Approve
                                            </a>
                                        </td>
                                        <td>
                                            <a style="color:#DD4F43" href="<c:url value="/admin/declinebio/${bioperson.id}"/>" >
                                                <span class="glyphicon glyphicon-remove"></span> Decline
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <footer class="container-fluid bg-4 text-center">
            <p>This is footer section</p> 
        </footer>
    </body>

    <script>
        function approveimage(id) {
            var message = prompt("Message for User", "write");
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {

                }
            };
            xhttp.open("POST", "${base}/approveimage/" + id, true);
            xhttp.send(message);

        }
    </script>
</html>
