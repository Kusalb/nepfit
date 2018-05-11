<%--
  Created by IntelliJ IDEA.
  User: Sanju
  Date: 5/8/2018
  Time: 9:37 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<g:form method="post" action="saveMember">
<g:textField name="username"/>
<g:textField name="password"/>

    <g:submitButton value="save" name="save"></g:submitButton>

</g:form>


</body>
</html>