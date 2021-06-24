<%-- 
    Document   : viewprofile
    Created on : Jul 14, 2020, 4:00:14 PM
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
        <title>Dalilinaure - Chat</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Mukta&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"
              type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="${base}css/style.css"/>
        <link rel="stylesheet" type="text/css" href="${base}css/custom.css"/>
        <link rel="stylesheet" type="text/css" href="${base}css/chat.css"/>

    </head>
    <body>
        <hd:customheader/>
        <div class="container home-body">
            <div class="col-md-4 col-sm-12">
                <table class="viewtable">
                    <tr>
                        <td  class="sectitle">
                            <h3 style="font-weight: bold;
                                color: #FFF;">Connections</h3>
                        </td>
                    </tr>
                    <tr class="trbody" >
                        <td>
                            <div class="container sidenav">
                                <ul  class="list-group" >

                                    <c:forEach var="myfriend" items="${friendlist}"  varStatus="status" >
                                        <li class="list-group-item friends" style="padding:0;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <a href="<c:url value="/view/${myfriend.personByFriendId2.id}"/>">
                                                            <c:if test="${myfriend.personByFriendId2.imageapproval eq 'false'}">
                                                                <img src="<c:url value="/img/profiles/profileimage.png"/>"  class="friend-img img-rounded" />
                                                            </c:if>
                                                            <c:if test="${myfriend.personByFriendId2.imageapproval eq 'rejected'}">
                                                                <img src="<c:url value="/img/profiles/profileimage.png"/>"  class="friend-img img-rounded" />
                                                            </c:if>
                                                            <c:if test="${myfriend.personByFriendId2.imageapproval eq 'true'}">
                                                                <img src="<c:url value="/img/profiles/${myfriend.personByFriendId2.image}"/>"  class="friend-img img-rounded"/>
                                                            </c:if>

                                                        </a>
                                                    </td>
                                                    <td>
                                                        <div class="friend-name">
                                                            <h4>${myfriend.personByFriendId2.firstname} ${myfriend.personByFriendId2.lastname}</h4>
                                                            <a href="<c:url value="/chatpage/${myfriend.personByFriendId2.id}"/>"><span>Message</span></a>
                                                            <a href="#"><span>Report</span></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td  class="secfooter">
                        </td>
                    </tr>

                </table>
            </div>


            <div class="col-md-8  ">
                <table class="viewtable-chat" >
                    <tr>
                        <td  class="sectitle">
                            <div class="chat-profile">
                                <c:if test="${friendship.personByFriendId2.imageapproval eq 'false'}">
                                    <img src="<c:url value="/img/profiles/profileimage.png"/>" alt="profile" />
                                </c:if>
                                <c:if test="${friendship.personByFriendId2.imageapproval eq 'reject'}">
                                    <img src="<c:url value="/img/profiles/profileimage.png"/>" alt="profile" />
                                </c:if>
                                <c:if test="${friendship.personByFriendId2.imageapproval eq 'true'}">
                                    <img src="<c:url value="/img/profiles/${friendship.personByFriendId2.image}"/>" alt="profile" />
                                </c:if>

                            </div>
                            <h3 style="font-weight: bold;
                                color: #FFF;">${friendship.personByFriendId2.firstname} ${friendship.personByFriendId2.lastname}</h3>
                        </td>
                    </tr>
                    <tr class="trbody">
                        <td>
                            <div class="container chatbody chat-history">
                                <div style="width:300px;text-align: center;margin: auto">
                                    
                                        <c:if test="${friendship.personByFriendId2.imageapproval eq 'false'}">
                                            <img class="cpimg img-circle" src="<c:url value="/img/profiles/profileimage.png"/>" alt="profile" />
                                        </c:if>
                                        <c:if test="${friendship.personByFriendId2.imageapproval eq 'reject'}">
                                            <img class="cpimg img-circle" src="<c:url value="/img/profiles/profileimage.png"/>" alt="profile" />
                                        </c:if>
                                        <c:if test="${friendship.personByFriendId2.imageapproval eq 'true'}">
                                            <img class="cpimg img-circle" src="<c:url value="/img/profiles/${friendship.personByFriendId2.image}"/>" alt="profile" />
                                        </c:if>
                                    
                                    <h3 >You and  ${friendship.personByFriendId2.firstname} ${friendship.personByFriendId2.lastname} are
                                    connected
                                    </h3>
                                    <h5>Start messeging</h5>
                                </div>
                                
                                <ul id="chatmessagebody">

                                </ul>
                            </div>
                            <div class="input-group" style="margin-top: 10px">
                                <input type="hidden" id="user" value="${friendship.personByFriendId1.firstname}"/>
                                <input type="hidden" id="recepient" value="${friendship.personByFriendId2.firstname}"/>
                                <input type="hidden" id="roomid" value="${friendship.chatroom}"/>
                                <input type="hidden" id="messagefrom" value="${friendship.personByFriendId1.id}"/>
                                <input type="hidden" id="messageto" value="${friendship.personByFriendId2.id}"/>
                                <input type="text" id="content" class="form-control" placeholder="Message"/>
                                <div class="input-group-btn">
                                    <button id="send" class="btn btn-default" type="submit"><i class="glyphicon glyphicon-send"></i></button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td  class="secfooter">
                        </td>
                    </tr>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
                    <script>
                        $(document).ready(function () {

                            $("#send").click(function () {
                                var content = $("#content").val();
                                var user = $("#user").val();
                                window.scrollTo(0, document.body.scrollHeight || document.documentElement.scrollHeight);
                                $.post("${base}sendmessage",
                                        {
                                            roomid: $("#roomid").val(),
                                            messagefrom: parseInt($("#messagefrom").val()),
                                            messageto: parseInt($("#messageto").val()),
                                            content: $("#content").val()
                                        },
                                        function (data, status) {
                                            console.log(data);
                                            $("#chatmessagebody").append("<li class='clearfix'><div class='message-data align-right'><span class='message-data-time'>"
                                                    + "10:14 AM, Today"
                                                    + "</span> &nbsp; &nbsp;<span class='message-data-name'>"
                                                    + user
                                                    + "</span> <i class='fa fa-circle me'></i></div><div class='message other-message float-right'>"
                                                    + content
                                                    + "</div> </li>");
                                            document.getElementById('content').value = "";
                                        });

                            });
                        });



                        function loadDoc() {
                            var user = $("#user").val();
                            var recipient = $("#recepient").val();
                            var xhttp = new XMLHttpRequest();
                            xhttp.onreadystatechange = function () {
                                if (this.readyState === 4 && this.status === 200) {
                                    console.log(this.responseText);
                                    var datalist = JSON.parse(this.responseText);
                                    console.log(datalist);
                                    console.log(datalist[0]);
                                    $("#chatmessagebody").empty();
                                    for (var i = 0; i < datalist.length; i++) {
                                        console.log(datalist[i].messagefrom == ${friendship.personByFriendId1.id});
                                        if (datalist[i].messagefrom == ${friendship.personByFriendId1.id}) {
                                            console.log("Me:" + datalist[i].content);
                                            $("#chatmessagebody").append("<li class='clearfix'><div class='message-data align-right'><span class='message-data-time'>"
                                                    + "10:14 AM, Today"
                                                    + "</span> &nbsp; &nbsp;<span class='message-data-name'>"
                                                    + user
                                                    + "</span> <i class='fa fa-circle me'></i></div><div class='message other-message float-right'>"
                                                    + datalist[i].content
                                                    + "</div> </li>");
                                        } else {
                                            console.log("tithi:" + datalist[i].content);
                                            $("#chatmessagebody").append(""
                                                    + "<li><div class='message-data'><span class='message-data-name'><i class='fa fa-circle online'></i>"
                                                    + recipient
                                                    + "</span> <span class='message-data-time'>"
                                                    + "10:20 AM, Today"
                                                    + "</span></div > <div class='message my-message'>"
                                                    + datalist[i].content
                                                    + "</div></li>");
                                        }
                                    }


                                }

                            };
                            xhttp.open("GET", "${base}fetchAllUsers/${friendship.chatroom}/${friendship.personByFriendId1.id}", true);
                                    xhttp.send();

                                }
                                loadDoc();
                                setInterval(loadDoc,1000);
                    </script>


                </table>
            </div>
        </div>
    </div>
    <hd:customfooter/>
</body>
</html>