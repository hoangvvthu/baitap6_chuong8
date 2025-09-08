<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="main.css" type="text/css"/>
</head>
<body>
<h1>Join our email list</h1>
<p>To join our email list, enter your name and email address below.</p>

<form action="emailList" method="post">
    <input type="hidden" name="action" value="add">

    <label>Email:</label>
    <input type="email" name="email" value="${requestScope.user.email}" required><br>

    <label>First Name:</label>
    <input type="text" name="firstName" value="${requestScope.user.firstName}" required><br>

    <label>Last Name:</label>
    <input type="text" name="lastName" value="${requestScope.user.lastName}" required><br>

    <label>&nbsp;</label>
    <input type="submit" value="Join Now" id="submit">
</form>
</body>
</html>
