<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Thanks</title>
    <link rel="stylesheet" href="main.css" type="text/css"/>
</head>
<body>
<h1>Thanks for joining our email list</h1>

<p>Here is the information that you entered:</p>

<label>Email:</label> <span>${requestScope.user.email}</span><br>
<label>First Name:</label> <span>${requestScope.user.firstName}</span><br>
<label>Last Name:</label> <span>${requestScope.user.lastName}</span><br>

<h2>Extra Info</h2>
<p>Current Date: ${requestScope.currentDate}</p>

<c:if test="${not empty sessionScope.users and not empty sessionScope.users[0]}">
    <p>First User in List: ${sessionScope.users[0].firstName} ${sessionScope.users[0].lastName}</p>
</c:if>

<c:if test="${not empty sessionScope.users and not empty sessionScope.users[1]}">
    <p>Second User in List: ${sessionScope.users[1].firstName} ${sessionScope.users[1].lastName}</p>
</c:if>

<p>Customer Service Email: ${initParam.custServEmail}</p>

<p>To enter another email address, click Return below.</p>

<form action="emailList" method="get">
    <input type="hidden" name="action" value="join">
    <input type="submit" value="Return">
</form>
</body>
</html>
