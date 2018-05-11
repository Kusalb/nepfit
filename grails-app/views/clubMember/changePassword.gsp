<%--
  Created by IntelliJ IDEA.
  User: Gud Kush
  Date: 4/10/2018
  Time: 4:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body>

<br><br><br>
<g:form method="post" controller="clubMember" action="updatePassword" >
    <g:passwordField name="password" placeholder="Enter new Password"/>
    <g:submitButton name="submit" value="submit"/>
</g:form>
</body>
</html>