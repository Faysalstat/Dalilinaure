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
        <title>Dalilinaure - Edit Profile</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="${base}css/style.css"/>
        <link rel="stylesheet" type="text/css" href="${base}css/custom.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .form-group{
                margin-bottom: 20px;
            }
        </style>

    </head>
    <body>
        <hd:customheader/>
        <div class="container">
            <div class="registrationsection">
                <h1 style="font-weight: bolder;">Manage Profile</h1>
                <hr style="height:5px;" />
                <form action="<c:url value="/updateprofile"/>" method="post" id="personform" modelAttribute="person"> 
                    <input type="hidden" name="id" value="${person.id}"/>
                    <input type="hidden" name="image" value="${person.image}" id="imagevalue"/>
                    <input type="hidden" id="imageChaned" name="imageapproval" value="${person.imageapproval}"/>
                    <input type="hidden" id="bioChaned" name="bioapproval" value="${person.bioapproval}"/>

                    <div class="row" style="margin:20px auto">
                        <div class="col-md-4">
                            <div class="img-holder">
                                <img src="<c:url value="/img/profiles/${person.image}"/>" id="imgsrc"  class="img-rounded upimg"/>
                            </div>
                            <div class="btn-holder" data-provides="fileupload">
                                <input class="inputfile" type="file" id="fileSelect">
                                <label class=" btn btn-info " for="fileSelect">Browse</label>
                                <button class="btn btn-success" onclick="uploadImage();return false" >Uplaod</button>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label>About Me</label>
                            <textarea id="bio-input" class="form-control" rows="5"  name="bio" >${person.bio}</textarea>
                            <button style="margin-top:20px;" onclick="updatebio();return false" class="btn btn-success">Update Bio</button>
                        </div>

                    </div>
                    <hr>
                    <h3 style="padding-left: 15px;">Personal Information</h3> 
                    <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>First Name</label>
                                <input type="text" name="firstname" value="${person.firstname}" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Last Name</label>
                                <input type="text" name="lastname" value="${person.lastname}" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Sex</label>
                                <select class="form-control" name="sex" >
                                    <option value="${person.sex}">${person.sex}</option>
                                    <c:choose>
                                        <c:when test="${person.sex eq 'Male'}">
                                            <option value="Female">Female</option>
                                        </c:when>
                                        <c:when test="${person.sex eq null}">
                                            <option value="Female">Male</option>
                                            <option value="Female">Female</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="Male">Male</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group" id='datetimepicker1'>
                                <label>Birthday</label>
                                <input  type="date" name="dob"  class="form-control" value="${person.dob}"  id="dateofbirth" required/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Profession</label>
                                <select class="form-control" name="profession" value="${person.profession}">
                                    <option>Student</option>
                                    <option>Public Servant</option>
                                    <option>Trader</option>
                                    <option>Businessman</option>
                                    <option>Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Education</label>
                                <select class="form-control" name="education" value="${person.education}">
                                    <option value="0" >Islamiya</option>
                                    <option value="1">Primary</option>
                                    <option value="2">Secondary</option>
                                    <option value="3">Collage</option>
                                    <option value="4">University</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <label>I am looking for</label>
                            <textarea  class="form-control" rows="5"   name="lookingfor" >${person.lookingfor}</textarea>
                        </div>
                        <div class="col-md-4 zeropad" >
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Hair</label>
                                    <input type="text" name="hair" value="${person.hair}" class=" form-control" >
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Height</label>
                                    <select class="form-control" name="height" value="${person.height}">
                                        <option>Tall</option>
                                        <option>Medium</option>
                                        <option>Short</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Physique</label>
                                <select class="form-control" name="physique" value="${person.height}">
                                    <option>Muscular</option>
                                    <option>Sin Medium</option>
                                    <option>Slim</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Favorite Food</label>
                                <input type="text" name="favfood" value="${person.favfood}" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Favorite Color</label>
                                <input type="text" name="favcolor" value="${person.favcolor}" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Marital Status</label>
                                <select class="form-control" value="${person.maritalstatus}" name="maritalstatus">
                                    <option>Single</option>
                                    <option>Widowed</option>
                                    <option>Separated</option>
                                    <option>Divorced</option>
                                    <option>Married</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Kids</label>
                                <select class="form-control" value="${person.kids}" name="kids">
                                    <option>None</option>
                                    <option>one</option>
                                    <option>two</option>
                                    <option>three</option>
                                    <option>more than three</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Country</label>
                                <input type="text" value="${person.country}" name="country" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>City</label>
                                <input type="text" name="city" value="${person.city}" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Natinality</label>
                                <input type="text" name="nationality" value="${person.nationality}" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Religion</label>
                                <input type="text" name="religion" value="${person.religion}" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Language</label>
                                <input type="text" name="language" value="${person.language}" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Race</label>
                                <input type="text" name="race" value="${person.race}" class=" form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <br/>
                                <button style="float: right;width: 100px;" class="btn btn-success" type="submit" form="personform">Update</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

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
                document.getElementById("imagevalue").value = data.image;
                document.getElementById("imageChaned").value = false;
                setTimeout(function () {
                    alert("hi");
                    document.getElementById("imgsrc").src = "${base}img/profiles/" + data.image;
                }, 3000);
                document.getElementById("imgsrc").src = "${base}img/profiles/" + data.image;
            }
        };
        request.open('POST', '<c:url value="/imageupload/${person.id}"/>', true);
        request.send(formData);
    }

    function updatebio() {
        var bio = document.getElementById('bio-input').value;
        var request = new XMLHttpRequest();
        request.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                console.log(this.responseText);
                document.getElementById('bio-input').value = this.responseText;
                document.getElementById("bioChaned").value = false;
            }
        };
        request.open('GET', '<c:url value="/updatebio/${person.id}/"/>' + bio, true);
        request.send();
    }
</script>
