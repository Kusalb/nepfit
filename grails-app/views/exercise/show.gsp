<%--
  Created by IntelliJ IDEA.
  User: Sanju
  Date: 5/4/2018
  Time: 5:55 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
</head>

<body>
<br><br><br>

<br><br>
<section class="banner-sec">
    <div class="container">
        <g:each in="${exercise}" var="exercises">
            <div class="row">
                    <div class="col-md-8">
                        <div class="card">

<img height="300" width="400"   src="${createLink(controller: 'exercise', action: 'showImage', params: [id:exercise.id])}"/>            </div>
    </div>
            <div class="col-md-4">
                <div class="jumbotron" style="background: wheat">
                    <h1>${exercises.exercise_name}</h1>
                    Author: ${exercises.author}<br>
                    Date: ${exercises.created}
                </div>

                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <g:link action="edit_exercise" id="${exercises.id}"><i class="fa fa-edit"></i>Edit</g:link>
                    <g:link action="delete" id="${exercises.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>delete</g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="jumbotron" style="background: lightblue; width: 100%">
                ${raw(exercises.description)}
            </div>
        </g:each>
    </div>
    </div></section>
</body>
</html>

