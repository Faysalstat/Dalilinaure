<%-- 
    Document   : error
    Created on : Aug 2, 2020, 5:39:13 AM
    Author     : Faysal
--%>
<%@taglib prefix="hd" uri="/tlds/myTags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}/" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
        <link rel="stylesheet" type="text/css" href="${base}css/style.css"/>
    </head>
    <body>
        <div class="error">
            <h1>Something is wrong </h1>
            <a href="/home">Go Back</a>
        </div>
    </body>
</html>
