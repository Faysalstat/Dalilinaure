<%-- 
    Document   : home
    Created on : Jul 12, 2020, 10:36:40 PM
    Author     : Faysal
--%>
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
        <title>Dalilinaure - Home</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/others/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <!--<link rel="stylesheet" type="text/css" href="">-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/custom.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    </head>
    <body>
        <div class="container home-body zeropad">
            <div class="header">
                <img src="img/headbanner.jpg" alt="image" height="auto" width="100%">
            </div>
            <hd:customheader/>
            <c:if test="${person.user.subtype=='trial'}">
                <div class="price-sec">
                    <div class="row">
                        <h2 class="title-box">FIND YOUR BEST PRICING</h2>
                        <p></p>
                        <div class="col-md-4">
                            <div class="pricing">
                                <div class="price-title">
                                    Basic
                                </div>
                                <div class="price-body">
                                    <h1>$5</h1>
                                    <h2>per month</h2>
                                    <button class="btn btn-pay" onclick="payWithPaystack(5, 'Basic');return false">Pay</button>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="pricing">
                                <div class="price-title">
                                    Standard
                                </div>
                                <div class="price-body">
                                    <h1>$25</h1>
                                    <h2>6 month</h2>
                                    <button class="btn btn-pay" onclick="payWithPaystack(25, 'Standard');return false">Pay</button>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="pricing">
                                <div class="price-title">
                                    Premium
                                </div>
                                <div class="price-body">
                                    <h1>$45</h1>
                                    <h2>A year</h2>
                                    <button class="btn btn-pay" onclick="payWithPaystack(45, 'Premium');return false">Pay</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://js.paystack.co/v1/inline.js"></script>
                <script>
                                        function payWithPaystack(amount, type) {
                                            var subtype = type;
                                            var handler = PaystackPop.setup({
                                                key: 'pk_test_c7a3e3051884eceae0a3abc5b8a613bc8504402f',
                                                email: '${userperson.user.email}',
                                                amount: amount * 100,
                                                currency: 'NGN',
                                                firstname: '${userperson.firstname}',
                                                lastname: '${userperson.lastname}',
                                                ref: '' + Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
                                                metadata: {
                                                    custom_fields: [
                                                        {
                                                            display_name: "Mobile Number",
                                                            variable_name: "mobile_number",
                                                            value: "+2348012345678"
                                                        }
                                                    ]
                                                },
                                                callback: function (response) {
                                                    var xhttp = new XMLHttpRequest();
                                                    xhttp.onreadystatechange = function () {
                                                        if (this.readyState == 4 && this.status == 200) {
                                                            location.reload();
                                                        }
                                                    };
                                                    xhttp.open("POST", "paymentsuccess/" + response.reference + "/" + subtype, true);
                                                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                    xhttp.send();
                                                },
                                                onClose: function () {
                                                    alert('window closed');
                                                }
                                            });
                                            handler.openIframe();
                                        }
                </script>
            </c:if>



            <div class="row">
                <div class="col-md-8" style="margin-bottom: 20px">
                    <div class="welcome">
                        <h1 style="text-align: center" >Welcome to Our Marriage App</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="latest-added" style="height:387px;">
                        <h1>Inbox</h1>
                        <table id="tabs">
                            <tr class="ribbon">
                                <td id="in-tab" onclick="switchtab('notification', 'inbox', 'not-tab', 'in-tab');
                                        return false;">
                                    <a href="javascript:0"><span class="glyphicon glyphicon-envelope"></span> Message</a>    
                                </td>
                                <td id="not-tab" onclick="switchtab('inbox', 'notification', 'in-tab', 'not-tab');
                                        return false;">
                                    <a href="javascript:0"><span class="glyphicon glyphicon-bell"></span> Notifications</a> 
                                </td>
                            <script>
                                function switchtab(id1, id2, id3, id4) {
                                    document.getElementById(id1).style.display = "none";
                                    document.getElementById(id3).style.borderStyle = "inset";
                                    document.getElementById(id4).style.borderStyle = "outset";
                                    document.getElementById(id2).style.display = "table";
                                }
                            </script> 
                            </tr>
                        </table>
                        <div  class="row sidenav" style="margin:0;height:290px;">

                            <table id="inbox">

                                <c:if test = "${inboxlist.size()==0}">
                                    <tr>
                                        <td colspan="2">
                                            <h5 style="text-align: center"> No New Messages !</h5>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="inbox" items="${inboxlist}"  varStatus="status" >

                                    <tr>
                                        <td>
                                            <c:if test="${inbox.person.imageapproval eq 'false'}">
                                                <img src=" <c:url value="img/profiles/profileimage.png"/>" 
                                                     style="width:50px;height: 50px; "
                                                     alt="propic" class="img-circle"/>
                                            </c:if>
                                            <c:if test="${inbox.person.imageapproval eq 'true'}">
                                                <img src=" <c:url value="img/profiles/${inbox.person.image}"/>" 
                                                     style="width:50px;height: 50px; "
                                                     alt="propic" class="img-circle"/>
                                            </c:if>

                                        </td>
                                        <td>
                                            <a href="<c:url value="/chatpage/${inbox.person.id}"/>">

                                                <h4><span class="glyphicon glyphicon-envelope"></span> ${inbox.person.firstname}  ${inbox.person.lastname} </h4>
                                                <h5>Texted you</h5>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>

                            <!--notifcation block-->

                            <table id="notification">

                                <c:if test = "${notifications.size()==0}">
                                    <tr>
                                        <td colspan="2">
                                            <h5 style="text-align: center"> No New Messages !</h5>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="notification" items="${notifications}"  varStatus="status" >
                                    <c:choose>
                                        <c:when test="${notification.status==1}">
                                            <tr>
                                                <td colspan="2" style="padding:10px 25px;">
                                                    <p style="font-weight:bolder;color:#0781D7"><span class="glyphicon glyphicon-star"></span>Admin</p>
                                                    <p style="font-size:10px;padding-top:0;margin-top:0;color:#1A90FF">${notification.sendtime}</p>
                                                    <div class="not-body">
                                                        ${notification.content}
                                                    </div>

                                                    <hr style="width: 48%;margin:10px auto;background-color: #A6A6A6">
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="2" >
                                                    <div style="padding:10px 15px;background-color:#eee;border-radius:10px;">
                                                        <p style="font-weight:bolder;color:#0781D7"><span class="glyphicon glyphicon-star"></span>Admin</p>
                                                        <hr style="height:1px;">
                                                        <p style="font-size:10px;padding-top:0;margin-top:0;color:#1A90FF">${notification.sendtime}</p>
                                                        <div class="not-body">
                                                            ${notification.content}
                                                        </div>
                                                        <button id="unread_${notification.id}" style="font-size:10px;" class="btn btn-info" onclick="markread(${notification.id})">
                                                            <span class="glyphicon glyphicon-ok"></span>  Mark as read
                                                        </button>
                                                    </div>

                                                    <hr style="width: 48%;margin:20px auto;background-color: #A6A6A6">
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>


                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-8">
                    <div class="latest-added " >
                        <h1>Recently added members</h1>
                        <div class="row" style="margin:30px 0;height:265px;">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <c:forEach var="person" items="${latestpersonlist}"  varStatus="status" >
                                            <c:choose>
                                                <c:when test="${status.index<=2}">
                                                    <div class="col-md-4">
                                                        <div class="thumbnail card-container ">
                                                            <c:url value="/view/${person.id}" var="view"/>
                                                            <a href="${view}">
                                                                <c:if test="${person.imageapproval eq 'false'}">
                                                                    <img src="img/profiles/profileimage.png" alt="Nature" style="height:120px;">
                                                                </c:if>
                                                                <c:if test="${person.imageapproval eq 'rejected'}">
                                                                    <img src="img/profiles/profileimage.png" alt="Nature" style="height:120px;">
                                                                </c:if>
                                                                <c:if test="${person.imageapproval eq 'true'}">
                                                                    <img src="img/profiles/${person.image}" alt="Nature" style="height:120px;">
                                                                </c:if>

                                                                <div class="caption centerText ">
                                                                    <h4 class="zeromargin">${person.firstname} ${person.lastname}</h4>
                                                                    <h5 class="zeromargin">28 years old ${person.sex}</h5>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                    <!--have to set limit-->

                                    <c:if test = "${latestpersonlist.size()>0}">
                                        <div class="item">
                                            <c:forEach var="person" items="${latestpersonlist}"  varStatus="status" >
                                                <c:choose>
                                                    <c:when test="${status.index>=3 && status.index<6}">
                                                        <div class="col-md-4">
                                                            <div class="thumbnail card-container ">
                                                                <c:url value="/view/${person.id}" var="view"/>
                                                                <a href="${view}">
                                                                    <c:if test="${person.imageapproval eq 'rejected'}">
                                                                        <img src="img/profiles/profileimage.png" alt="Nature" style="height:120px;">
                                                                    </c:if>
                                                                    <c:if test="${person.imageapproval eq 'false'}">
                                                                        <img src="img/profiles/profileimage.png" alt="Nature" style="height:120px;">
                                                                    </c:if>
                                                                    <c:if test="${person.imageapproval eq 'true'}">
                                                                        <img src="img/profiles/${person.image}" alt="Nature" style="height:120px;">
                                                                    </c:if>
                                                                    <div class="caption  centerText ">
                                                                        <h4 class="zeromargin">${person.firstname} ${person.lastname}</h4>
                                                                        <h5 class="zeromargin">28 years old ${person.sex}</h5>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </c:if>



                                    <!--have to set limit-->
                                    <c:choose>
                                        <c:when test="${latestpersonlist.size() gt 6} ">
                                            <div class="item">
                                                <c:forEach var="person" items="${latestpersonlist}"  varStatus="status" >
                                                    <c:choose>
                                                        <c:when test="${status.index>6 && status.index<9} ">
                                                            <div class="col-md-4">
                                                                <div class="thumbnail card-container ">
                                                                    <c:url value="/view/${person.id}" var="view"/>
                                                                    <a href="${view}">
                                                                        <c:if test="${person.imageapproval eq 'false'}">
                                                                            <img src="img/profiles/profileimage.png" alt="Nature" style="height:120px;">
                                                                        </c:if>
                                                                        <c:if test="${person.imageapproval eq 'true'}">
                                                                            <img src="img/profiles/${person.image}" alt="Nature" style="height:120px;">
                                                                        </c:if>
                                                                        <div class="caption centerText ">
                                                                            <h5 class="zeromargin">${person.firstname} ${person.lastname}</h5>
                                                                            <h5 class="zeromargin">28 years old ${person.sex}</h5>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </c:when>
                                    </c:choose>

                                    <!--dummy start-->

                                    <!--dummy end-->
                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" style="width:0%;" href="#myCarousel" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" style="width:0%;" href="#myCarousel" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>  
                <div class="col-md-4">



                    <div class="latest-added reqest-sec ">
                        <h1><span class="glyphicon glyphicon-heart"></span> Requests</h1>
                        <div class="row sidenav" style="margin:10px;height:258px;">
                            <table id="requesttable">
                                <tr>
                                    <td colspan="2" style="text-align: center">
                                        <h4>Keep track of your Connections</h4>
                                    </td>
                                </tr>
                                <c:if test = "${friendrequestlist.size()==0}">
                                    <tr>
                                        <td colspan="2">
                                            <h4 style="text-align: center"> No New Connections !</h4>
                                        </td>
                                    </tr>
                                </c:if>

                                <c:forEach var="request" items="${friendrequestlist}"  varStatus="status" >
                                    <c:choose>
                                        <c:when test="${request.status eq 'Friend'}">

                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td>
                                                    <c:if test="${request.personByFriendId2.imageapproval eq 'false'}">
                                                        <img src=" <c:url value="img/profiles/profileimage.png"/>" 
                                                             style="width:50px;height: 50px; "
                                                             alt="propic" class="img-circle"/>
                                                    </c:if>
                                                    <c:if test="${request.personByFriendId2.imageapproval eq 'rejected'}">
                                                        <img src=" <c:url value="img/profiles/profileimage.png"/>" 
                                                             style="width:50px;height: 50px; "
                                                             alt="propic" class="img-circle"/>
                                                    </c:if>
                                                    <c:if test="${request.personByFriendId2.imageapproval eq 'true'}">
                                                        <img src=" <c:url value="img/profiles/${request.personByFriendId2.image}"/>" 
                                                             style="width:50px;height: 50px; "
                                                             alt="propic" class="img-circle"/>
                                                    </c:if>

                                                </td>
                                                <td class="profilelink">
                                                    <c:url value="/view/${request.personByFriendId2.id}" var="view"/>
                                                    <a  href="${view}">
                                                        <h3>${request.personByFriendId2.firstname}  ${request.personByFriendId2.lastname}</h3>
                                                        <c:choose>
                                                            <c:when test="${request.status eq 'requested'}">
                                                                <h5>Send you a Friend Request</h5>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h5>${request.status}</h5>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </a>

                                                </td>

                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hd:customfooter/>
        <script language="javascript" type="text/javascript">

            function sendrequest(id) {
                var request = new XMLHttpRequest();
                request.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        console.log(this.responseText);
                        var data = JSON.parse(this.responseText);
                    }
                };
                request.open('POST', 'friendrequest/' + id, true);
                request.send();
            }
            function markread(id) {
                var request = new XMLHttpRequest();
                request.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        console.log(this.responseText);
                        document.getElementById('unread_' + id).style.display = "none";
                    }
                };
                request.open('GET', 'markread/' + id, true);
                request.send();
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>
</html>