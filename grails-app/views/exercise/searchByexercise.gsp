<%--
  Created by IntelliJ IDEA.
  User: Gud Kush
  Date: 4/9/2018
  Time: 11:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<body>
<br><br><br><br>

<div class="container">

    <div class ="row">
        <div class="col-lg-5">
            <g:form method ="post" controller="exercise" action="searchByexercise">
                Search Exercise:   <g:textField name="search1" class="form-control"></g:textField>
                <input type="submit" class="btn btn-primary" value="Search">
            </g:form>
        </div>
        <div class="col-lg-5">

        </div>
        <div class="col-lg-2">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="exercise" action="create_exercise">Add new Exercise </g:link></button>

        </div>
    </div>
</div>





%{--<table  class="table table-striped table-dark">--}%

%{--<thead> <tr>--}%
%{--<th scope="col">S.N.</th>--}%
%{--<th scope="col">Exercise Name</th>--}%
%{--<th scope="col">Author</th>--}%
%{--<th scope="col">Description</th>--}%
%{--<th scope="col">Created</th>--}%
%{--<g:if test="${role=='ROLE_ADMIN'}">--}%
%{--<th scope="col">Edit</th>--}%
%{--<th scope="col">delete</th>--}%
%{--</g:if>--}%
%{--</tr>--}%

%{--    <g:each in="${elist}" var="e" status="ecount">--}%
%{--<tr scope="row">--}%
%{--<td>${ecount+1}</td>--}%
%{--<td>${e.exercise_name}</td>--}%
%{--<td>${e.author}</td>--}%
%{--<td>${e.description}</td>--}%
%{--<td>${e.created}</td>--}%
%{--<td><g:link action="edit_exercise" id="${e.id}">Edit</g:link></td>--}%
%{--<td><g:link action="delete" id="${e.id}" onclick="return confirm('Are u sure?')">delete</g:link></td>--}%
%{--</tr>--}%


%{--</g:each>--}%

%{--<g:each in="${exercise}" var="exercises">--}%
%{--<tr scope="row">--}%
%{--<td>        <g:link controller="exercise" action="show" id="${exercises?.id}">--}%
%{--<img height="200px" width=300px" src="${createLink(controller: 'exercise', action: 'showImage', params: [id:exercises.id])}"/> </g:link></td>--}%

%{--<td> Name: ${exercises.exercise_name}<br></td>--}%
%{--<td> Author: ${exercises.author}<br></td>--}%
%{--<td> Description: ${raw(exercises.description)}<br></td>--}%
%{--<td> Date: ${exercises.created}<br></td>--}%

%{--<sec:ifAnyGranted roles="ROLE_ADMIN">--}%
%{--<td><g:link action="edit_exercise" id="${exercises.id}">Edit</g:link></td>--}%
%{--<td><g:link action="delete" id="${exercises.id}" onclick="return confirm('Are u sure?')">delete</g:link></td>--}%
%{--</sec:ifAnyGranted>--}%
%{--</tr>--}%
%{--</g:each>--}%

%{--</table>--}%




<section class="banner-sec">

    <div class="container">

        <div class="row">
            <g:each in="${exerciseList}" var="exercises">
                <div class="col-md-4">

                    <div class="card">
                        <g:link controller="exercise" action="show" id="${exercises?.id}">
                            <img height="200px" width=300px" src="${createLink(controller: 'exercise', action: 'showImage', params: [id:exercises.id])}"/> </g:link></td>

                        <div class="card-body">
                            <div class="news-title">
                                <h5> ${exercises.exercise_name}</h5>
                                Author: ${exercises.author}<br>
                                <h2 class=" title-small">Date: ${exercises.created}</h2>

                            </div>
                        </div>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <div class="row">
                                <div class="col-lg-3">
                                    <td><g:link action="edit_exercise" id="${exercises.id}"><i class="fa fa-edit"></i>Edit</g:link></td>

                                </div>
                                <div class="col-lg-4">
                                    <td><g:link action="delete" id="${exercises.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>Delete</g:link></td>

                                </div>
                            </div>
                        </sec:ifAnyGranted>
                    </div>

                </div>
            </g:each>
        </div>
    </div></section>

</body>
</html>
