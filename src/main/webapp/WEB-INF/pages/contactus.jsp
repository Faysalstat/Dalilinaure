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
        <title>Dalilinaure - Contact Us</title>
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
        <div class="container">
            <h1 style="text-align: center">Contact Page</h1>
            <div class="contact">
                <h1>Send us a Message</h1>
                <form action="sendmail" method="POST" id="mail">
                    <div class="form-group">
                        <p style="font-size:15px;font-weight:bolder">From <span style="color:#529DFE">${person.user.email}</span></p>
                    </div>
                    <div class="form-group">
                        <label for="comment">Message:</label>
                        <textarea name="mail" class="form-control" rows="5" id="comment"></textarea>
                    </div>
                    <div class="form-group">
                        <br/>
                        <button style="float: right;width: 100px;" class="btn btn-success" type="submit" form="mail">Send</button>
                    </div>
                </form>
            </div>
        </div>
        
        <hd:customfooter/>
    </body>
</html>
