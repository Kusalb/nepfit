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
<br><br>
<section class="banner-sec">
    <div class="container">
        <g:each in="${event}" var="events">
            <div class="row">
                    <div class="col-md-8">
                        <div class="card">

<img height="300" width="400" src="${createLink(controller: 'event', action: 'showImage', params: [id:events.id])}">
    </div>
            </div>
            <div class="col-md-4">
                <div class="jumbotron" style="background: wheat">
                    <h1>Name: ${events.event_name}</h1>
                    Organized by: ${events.organized_by}<br>
                    Event date: ${events.created}
                </div>

                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <g:link action="event_edit" id="${events.id}"><i class="fa fa-edit"></i>Edit</g:link>
                    <g:link action="delete" id="${events.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>delete</g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="jumbotron" style="background: lightblue; width: 100%">
                ${raw(events.description)}
            </div>
        </g:each>
    </div>
    </div>
</section>
</body>
</html>


