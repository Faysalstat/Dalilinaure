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
        <title>Dalilinaure - Find Your Match</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/custom.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <hd:customheader/>
        <div class="container home-body findbody">
            <form action="findmatch" method="POST" id="searchform" modelAttribute="searchModel">
                <div class="row" style="margin:20px auto;">
                    <div class="col-md-3">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Min Age:</label>
                                <input class="form-control" value="20" type="number" name="minage" min="16" max="80"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Max Age:</label>
                                <input class="form-control" value="30" type="number" min="16" max="80" name="maxage"/>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Education Level:</label>
                            <select class="form-control" name="education" >
                                <option value="0" >Islamiya</option>
                                <option value="1">Primary</option>
                                <option value="2">Secondary</option>
                                <option value="3">Collage</option>
                                <option value="4">University</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="sel1">Religion</label>
                            <select class="form-control" name="religion">
                                <option>Muslim</option>
                                <option>Christian</option>
                                <option>Jew</option>
                                <option>Hindu</option>
                                <option>Others</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Height</label>
                                <select class="form-control" name="height">
                                    <option>Short</option>
                                    <option>Medium</option>
                                    <option>Tall</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Physique</label>
                                <select class="form-control" name="physics">
                                    <option>Muscular</option>
                                    <option>Thin</option>
                                    <option>Fat</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width:50%;margin: auto;text-align: center">
                    <button class="btn btn-info" type="submit" form="searchform" style="font-size: 20px;;padding:10px 35px;">Search</button>
                </div>
            </form>




            <div class="row">
                <h1 class="h1">Your Match</h1>
                <div id="foundcontainer">
                    <c:if test="${matchinglist.size()==0}">
                        <h2 style="text-align: center;">No match Found</h2>
                    </c:if>
                    <c:forEach var="person" items="${matchinglist}"  varStatus="status" >
                        <div class="col-md-4">
                            <!--<div class="column">-->
                            <div class="find-card">
                                <div style="margin:auto;width:60%;padding:10px;">
                                    <c:if test="${person.imageapproval eq 'false'}">
                                        <img class="img-circle" src="<c:url value="/img/profiles/profileimage.png"/>" alt="Jane" style="width:100%;height:200px;">
                                    </c:if>
                                    <c:if test="${person.imageapproval eq 'rejected'}">
                                        <img class="img-circle" src="<c:url value="/img/profiles/profileimage.png"/>" alt="Jane" style="width:100%;height:200px;">
                                    </c:if>
                                    <c:if test="${person.imageapproval eq 'true'}">
                                        <img class="img-circle" src="<c:url value="/img/profiles/${person.image}"/>" alt="Jane" style="width:100%;height:200px;">
                                    </c:if>
                                    
                                </div>

                                <div class="find-card-container">
                                    <h4 style="font-size:1.5em">${person.firstname} ${person.lastname}</h4>
                                    <p class="title">${person.age} Years Old ${person.sex}</p>
                                    <p class="title">${person.religion} Lives in ${person.city}</p>
                                    <p>
                                        <c:url value="/view/${person.id}" var="view"/>
                                        <a href="${view}"><button class="btn btn-info">View Profile</button></a>
                                    </p>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>
                    </c:forEach>
                </div>




                <!--                <div class="column">
                                    <div class="card">
                                        <img src="/w3images/team2.jpg" alt="Mike" style="width:100%">
                                        <div class="card-container">
                                            <h2>Mike Ross</h2>
                                            <p class="title">Art Director</p>
                                            <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                                            <p>example@example.com</p>
                                            <p><button class="button">Contact</button></p>
                                        </div>
                                    </div>
                                </div>
                
                                <div class="column">
                                    <div class="card">
                                        <img src="/w3images/team3.jpg" alt="John" style="width:100%">
                                        <div class="card-container">
                                            <h2>John Doe</h2>
                                            <p class="title">Designer</p>
                                            <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                                            <p>example@example.com</p>
                                            <p><button class="button">Contact</button></p>
                                        </div>
                                    </div>
                                </div>-->
            </div>
        </div>


        <hd:customfooter/>
    </body>
</html>
