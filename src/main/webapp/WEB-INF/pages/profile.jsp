<%-- 
    Document   : profile
    Created on : Jul 16, 2020, 3:02:43 PM
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
        <title>Dalilinaure - User Profile</title>
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
            <div class="col-md-4  col-sm-12 ">
                <table class="viewtable">
                    <tr>
                        <td  class="sectitle">
                            <h1>Connections</h1>
                        </td>
                    </tr>
                    <tr class="trbody">
                        <td>
                            <div class="container sidenav">
                                <ul class="list-group" >
                                    <c:choose>
                                        <c:when test="${myfriends==null}">
                                            <li class="list-group-item friends" style="padding:10px;">
                                                <h4>You Have no connection yet</h4>
                                                <a href="<c:url value="/findmatch"/>"><p>Find Match and Make Connection</p></a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="frd" items="${myfriends}"  varStatus="status" >
                                                <li class="list-group-item friends" style="padding:0;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <a href="<c:url value="/view/${frd.personByFriendId2.id}"/>">
                                                                    <c:if test="${frd.personByFriendId2.imageapproval eq 'false'}">
                                                                        <img src="<c:url value="/img/profiles/profileimage.png"/>"  class="friend-img img-rounded"/>
                                                                    </c:if>
                                                                    <c:if test="${frd.personByFriendId2.imageapproval eq 'rejected'}">
                                                                        <img src="<c:url value="/img/profiles/profileimage.png"/>"  class="friend-img img-rounded"/>
                                                                    </c:if>
                                                                    <c:if test="${frd.personByFriendId2.imageapproval eq 'true'}">
                                                                        <img src="<c:url value="/img/profiles/${frd.personByFriendId2.image}"/>"  class="friend-img img-rounded"/>
                                                                    </c:if>

                                                                </a>
                                                            </td>
                                                            <td>
                                                                <div class="friend-name">
                                                                    <h4>${frd.personByFriendId2.firstname} ${frd.personByFriendId2.lastname}</h4>
                                                                    <a href="<c:url value="/chatpage/${frd.personByFriendId2.id}"/>"><span>Message</span></a>
                                                                    <a href="#"><span>Report</span></a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
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

            <div class="col-md-8">
                <table class="viewtable">
                    <tr id="profile">
                        <td  class="sectitle">
                            <h1>Profile</h1>
                        </td>
                    </tr>
                    <tr class="trbody">
                        <td>
                            <div class="container profilesec">
                                <div class="col-md-5">
                                    <img id="imgsrc" class="img-circle img-thumbnail"  alt="profile image" src="<c:url value="/img/profiles/${person.image}"/>" 
                                         style="margin-bottom:10px;width:200px;height: 200px" />


                                    <div style="margin-bottom:20px;margin-left:40px">
                                        <div class="dropdown">
                                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Edit
                                                <span class="caret"></span></button>
                                                <ul class="dropdown-menu" style="background-color:#FFF">
                                                <li><a href="<c:url value="/editprofile/${person.id}"/>">
                                                        Profile
                                                    </a></li>
                                                    <li class="divider"></li>
                                                <li>
                                                    <a href="<c:url value="/changepassword"/>">
                                                        Change Password
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <c:if test="${person.imageapproval eq 'false'}">
                                        <p style="color:green">*Your image is private now. Image will appear after admin approval.</p>
                                    </c:if>
                                    <c:if test="${person.imageapproval eq 'rejected'}">
                                        <p style="color:red">*Your image is private and its does not approved by admin. Please upload another image.</p>
                                    </c:if>
                                </div>
                                <div class="col-md-7" style="padding:0">
                                    <div id="profile" class="titlepro" style="margin-top:0;">
                                        <h1>${person.firstname} ${person.lastname}</h1>
                                    </div>
                                    <div class="details row">
                                        <div class="subtype">
                                            * Membership: ${person.user.subtype}
                                        </div>
                                        <div class="col-md-12">
                                            <h4>Sex	: ${person.sex}</h4>
                                            <h4>Age : ${person.age}</h4>
                                            <h4>Lives In: ${person.city}</h4>
                                            <h4>Marital Status: ${person.maritalstatus}</h4>
                                        </div>

                                        <div class="col-md-12 ">
                                            <h4>About Me:</h4>
                                            <p>${person.bio}</p>
                                            <c:if test="${person.bioapproval eq 'false'}">
                                                <p style="color:green">*Your bio will appear after admin approval</p>
                                            </c:if>
                                            <c:if test="${person.bioapproval eq 'rejected'}">
                                                <p style="color:red">*Your bio does not approved by admin. Please edit Bio.</p>
                                            </c:if>


                                        </div>
                                    </div>
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
        <hd:customfooter/>
    </body>
    <script type="text/javascript">
        function uploadImage() {
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
                    document.getElementById("imgsrc").src = "<c:url value="/img/profiles/"/>" + data.iname;
                }
            };
            request.open('POST', '<c:url value="/imageupload/${person.id}"/>', true);
            request.send(formData);
        }
    </script>
</html>
