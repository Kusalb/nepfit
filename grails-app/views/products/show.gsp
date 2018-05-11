<%--
  Created by IntelliJ IDEA.
  User: Gud Kush
  Date: 4/9/2018
  Time: 11:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<body>
<br><br><br><br><br>
<div class ="col-lg-6">
    <img height="200px" width=300px" src="${createLink(controller: 'event', action: 'showImage', params: [id:event.id])}"/>

    ${event.event_name}
    ${event.author}
    ${event.organized_by}
    ${raw(event.description)}
    ${event.created}
</tr>
</div>
</body>
</html>
