<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <title>index</title>
    <meta charset="utf-8">
    <link href="resources/css/mycss.css" rel="stylesheet" type="text/css">
</head>

<body>

<form action="${cpath}/">    
<h4>LOGIN</h4>
<input type="text" name="id" >
<input type="password" name="pw">
<button type="submit">login</button>
</form>

    
</body>

</html>