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
        <title>Dalilinaure - Profile</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Mukta&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="${base}css/style.css"/>
        <link rel="stylesheet" type="text/css" href="${base}css/custom.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>
        <hd:customheader/>
        <div class="container home-body">
            <div class="col-md-4 col-sm-12">
                <table class="viewtable">
                    <tr>
                        <td  class="sectitle">
                            <h1>Recently Added </h1>
                        </td>
                    </tr>
                    <tr class="trbody">
                        <td>
                            <div class="container sidenav">
                                <c:forEach var="person" items="${latestpersonlist}"  varStatus="status" >
                                    <div class="profilecard">
                                        <div class="perimg">
                                            <c:if test="${person.imageapproval eq 'false'}">
                                                <img class="img-thumbnail"  alt="profile image" src="<c:url value="/img/profiles/profileimage.png"/>" />
                                            </c:if>
                                            <c:if test="${person.imageapproval eq 'rejected'}">
                                                <img class="img-thumbnail"  alt="profile image" src="<c:url value="/img/profiles/profileimage.png"/>" />
                                            </c:if>
                                            <c:if test="${person.imageapproval eq 'true'}">
                                                <img class="img-thumbnail"  alt="profile image" src="${base}img/profiles/${person.image}" />
                                            </c:if>

                                            <div class="perdetail">
                                                <h3>${person.firstname} ${person.lastname}</h3>
                                                <h4>30 years old ${person.sex}</h4>
                                                <h4>Lives in ${person.city}</h4>
                                                <c:url value="/view/${person.id}" var="view"/>
                                                <a href="<c:url value="/view/${person.id}"/>">See profile</a>
                                            </div>
                                            <hr style="height: 3px solid gray">
                                        </div>
                                    </div>
                                </c:forEach>    
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
                <table class="viewtable">
                    <tr>
                        <td  class="sectitle">
                            <h1>Profile</h1>
                        </td>
                    </tr>
                    <tr class="trbody">
                        <td>
                            <div class="container profilesec">
                                <div class="col-md-5">
                                    <c:if test="${person.imageapproval eq 'false'}">
                                        <img class="img-circle img-thumbnail"  alt="profile image" src="<c:url value="/img/profiles/profileimage.png"/>" 
                                             style="margin-bottom:10px;width:200px;height: 200px" />
                                    </c:if>
                                    <c:if test="${person.imageapproval eq 'rejected'}">
                                        <img class="img-circle img-thumbnail"  alt="profile image" src="<c:url value="/img/profiles/profileimage.png"/>" 
                                             style="margin-bottom:10px;width:200px;height: 200px" />
                                    </c:if>
                                    <c:if test="${person.imageapproval eq 'true'}">
                                        <img class="img-circle img-thumbnail"  alt="profile image" src="${base}img/profiles/${person.image}" 
                                             style="margin-bottom:10px;width:200px;height: 200px" />
                                    </c:if>

                                    <div style="margin-bottom:20px;">
                                        <%--<c:url value="/view/${person.id}" var="view"/>--%>
                                        <c:choose>
                                            <c:when test = "${friendlship.status eq 'Friend'}">
                                                <div class="btn-frond">
                                                    <a href="<c:url value="/chatpage/${person.id}"/>">
                                                        <button class="btn btn-info">Chat</button>
                                                    </a>
                                                </div>
                                                <div class="btn-frond">
                                                    <button id="rejectrequ" onclick="rejectrequest()" class="btn btn-danger">Unfriend</button>
                                                </div>

                                            </c:when>
                                            <c:when test = "${friendlship.status eq 'notfriend'}">
                                                <button onclick="sendRequest(${person.id})" id="frndrequ" class="btn btn-info">Send request</button>
                                            </c:when>
                                            <c:when test = "${friendlship.status eq 'requested'}">
                                                <button id="frndrequ" onclick="acceptrequest()" class="btn btn-info">Accept</button>
                                                <button id="rejectrequ" onclick="rejectrequest()" class="btn btn-info">Reject</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button id="status-btn"  class="btn btn-info">${friendlship.status}</button>
                                            </c:otherwise>
                                        </c:choose>

                                        <!--<button id="frndrequ" onclick="sendrequest()" class="btn btn-info">Send request</button>-->
                                    </div>
                                </div>
                                <div class="col-md-7 zeropad">
                                    <div id="profile" class="titlepro" style="margin-top:0;max-height:200px">
                                        <h1>${person.firstname} ${person.lastname}</h1>
                                    </div>
                                    <div class=" row det">
                                        <div class="col-md-12">
                                            <h4>Sex     :<span>${person.sex}</span></h4>
                                            <h4>Age     : ${person.age}</h4>
                                            <h4>Lives In: <span>${person.city}</span> </h4>
                                            <h4>Marital Status: <span>${person.maritalstatus}</span></h4>
                                        </div>

                                        <div class="col-md-12 ">
                                            <h4>About Me:</h4>
                                            <c:if test="${person.bioapproval eq 'true'}">
                                                <p class="about">${person.bio}</p>
                                            </c:if>
                                        </div>


                                    </div>

                                </div>
                                <div style="float: left;
                                     margin-top:10px;
                                     background-color:#eee;
                                     border-radius:10px;
                                     font-weight: bolder">
                                    <!--<a href="< c:url value="report/$ {person.id}"/>">--> 
                                        <button onclick="reportid()" >
                                            <span class="glyphicon glyphicon-thumbs-down"></span> Report
                                        </button>
                                        
                                    <!--</a>-->
                                </div>
                                <div class="col-md-12 zeropad">
                                    <!-- <hr> -->
                                    <div class="titlepro">
                                        <h1>Appearance</h1>
                                    </div>
                                    <div class="col-md-6 det">
                                        <table>
                                            <tr>
                                                <td><h4>Height:</h4></td>
                                                <td><h5>${person.height}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Hair:</h4></td>
                                                <td><h5>${person.hair}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Physique:</h4></td>
                                                <td><h5>${person.physique}</h5></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-md-6 det">
                                        <table>
                                            <tr>
                                                <td><h4>Race:</h4></td>
                                                <td><h5>${person.race}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Nationality:</h4></td>
                                                <td><h5>${person.nationality}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Language:</h4></td>
                                                <td><h5>${person.language}</h5></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>


                                <div class="col-md-12 zeropad">
                                    <!-- <hr> -->
                                    <div class="titlepro">
                                        <h1>Looking For</h1>
                                    </div>
                                    <div class="col-md-12 det">
                                        <p>${person.lookingfor}</p>
                                        <span style="color:red">*i have ${person.kids} kids</span>
                                    </div>
                                </div>

                                <div class="col-md-12 zeropad">
                                    <!-- <hr> -->
                                    <div class="titlepro">
                                        <h1>Lifestyle</h1>
                                    </div>
                                    <div class="col-md-6 det">
                                        <table>
                                            <tr>
                                                <td><h4>Professionalism:</h4></td>
                                                <td><h5>${person.profession}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Education:</h4></td>
                                                <td><h5>${person.education}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Country:</h4></td>
                                                <td><h5>${person.country}</h5></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-md-6 det">
                                        <table>
                                            <tr>
                                                <td><h4>Religion:</h4></td>
                                                <td><h5>${person.profession}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Favorite Food :</h4></td>
                                                <td><h5>${person.education}</h5></td>
                                            </tr>
                                            <tr>
                                                <td><h4>Favorite Color :</h4></td>
                                                <td><h5>${person.favcolor}</h5></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <a href="#profile"><button class="btn btn-info" style="float: right;margin-top:30px;margin-bottom: 30px;">Go Up</button></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td  class="secfooter">

                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <hd:customfooter/>
</body>

<script>
    function sendRequest() {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                console.log(this.responseText);
                location.reload();
            }
        };
        request.open('POST', '<c:url value="/friendrequest/${person.id}"/>', true);
        request.send();
    }
    function reportid() {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                console.log(this.responseText);
                location.reload();
            }
        };
        request.open('POST', '<c:url value="/report/${person.id}"/>', true);
        request.send();
    }


    function acceptrequest() {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                console.log(this.responseText);
                location.reload();
            }
        };
        request.open('POST', '<c:url value="/acceptrequest/${person.id}"/>', true);
        request.send();
    }

    function rejectrequest() {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                console.log(this.responseText);
                location.reload();
            }
        };
        request.open('POST', '<c:url value="/rejectrequest/${person.id}"/>', true);
        request.send();
    }
</script>
</html>