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
        <title>Admin- Dashboard</title>
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
                        <h1>Welcome to Dashboard</h1>
                        <hr class="sec-devider"/>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="box bg-red">
                                    <p style="font-size:20px;font-weight:bolder;
                                       margin:0 auto;">
                                        Subscriber
                                    </p>
                                    <hr style="margin:5px">
                                    <p>Trial: <span style='font-weight:bolder;'>20</span></p>
                                    <p>Basic: <span style='font-weight:bolder;'>20</span></p>
                                    <p>Standard: <span style='font-weight:bolder;'>20</span></p>
                                    <p>Pro: <span style='font-weight:bolder;'>20</span></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="box bg-green">
                                    <p style="font-size:20px;font-weight:bolder;
                                       margin:0 auto;">
                                        Approval
                                    </p>
                                    <hr style="margin:5px">
                                    <p>Image: <span style='font-weight:bolder;'>${imageApprovalList.size()}</span></p>
                                    <p>Bio: <span style='font-weight:bolder;'>${bioApprovalList.size()}</span></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="box bg-orange">
                                    <p style="font-size:20px;font-weight:bolder;
                                       margin:0 auto;">
                                        Reports
                                    </p>
                                    <hr style="margin:5px">
                                    <p>Total report:<span style='font-weight:bolder;'>${reportedlist.size()}</span></p>
                                    <p>Solved:<span style='font-weight:bolder;'>${solved}</span></p>
                                    <p>Unsolved:<span style='font-weight:bolder;'>${unsolved}</span></p>
                                </div>
                            </div>
                        </div>
                        <hr class="sec-devider"/>
                        <div class="row" style="margin-bottom:20px;">

                            <h1> >>Reports</h1>
                            <c:forEach var="report" items="${reportedlist}"  varStatus="status" >
                                <c:choose>
                                    <c:when test="${report.checked eq 0}">
                                        <h4 style="margin: 20px 30px">
                                            <span class="glyphicon glyphicon-ok"></span> 
                                            <span class="spantitle">${report.personByReportedby.user.username}</span>
                                            Reported 
                                            <span class="spantitle"> 
                                                <a href="<c:url value="/view/${report.personByReported.id}"/>">${report.personByReported.user.username}</a>
                                            </span>
                                        </h4>
                                        <button style="margin: 10px 30px" id="reply_${report.id}" class="btn btn-info" >Message</button>
                                        <button style="margin: 10px" onclick="chck(${report.id});return false;" class="btn btn-info" >Checked</button>
                                        <div id="replybody_${report.id}" class="form-group" style="display:none;width:400px;margin: 10px 30px">
                                            <label for="comment">Reply :</label>
                                            <textarea class="form-control" rows="3" id="content_${report.id}"></textarea>
                                            <br>
                                            <button onclick="sendReply(${report.id},${report.personByReported.id});return false;" class="btn btn-success"><span class="glyphicon glyphicon-send"></span>Send</button>
                                        </div>
                                    </c:when>
                                </c:choose>

                                <script>
                                    $(document).ready(function () {
                                        $("#reply_${report.id}").click(function () {
                                            $("#replybody_${report.id}").toggle();
                                        });
                                    });
                                </script>
                                <hr/>
                            </c:forEach>
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
        function sendReply(id, uid) {
            var content = document.getElementById('content_' + id).value;
            $.post("sendreply",
                    {
                        messageto: uid,
                        content: content
                    }
            ,
                    function (data, status) {
                        alert("Data: " + data + "\nStatus: " + status);
                    });
        }
        function chck(id) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                }
            };
            xhttp.open("GET", "checkedreport/" + id, true);
            xhttp.send();
        }
        
    </script>
</html>
