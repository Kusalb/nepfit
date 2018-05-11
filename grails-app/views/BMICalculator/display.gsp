<%--
  Created by IntelliJ IDEA.
  User: Sanju
  Date: 4/27/2018
  Time: 9:19 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<g:form method ="post" controller="BMICalculator" action="display">
    Height In feet:<g:textField name="height_inches" > </g:textField>
    Height In inch:<g:textField name = "height_feet"></g:textField>
    Weight:<g:textField name="weight"></g:textField>

    <g:submitButton name="submit" value="Calculate"></g:submitButton>
</g:form>
</body>
</html>