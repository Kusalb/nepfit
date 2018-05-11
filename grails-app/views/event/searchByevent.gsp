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
<br><br><br>

<div class="container">

    <div class ="row">
        <div class="col-lg-5">
            <g:form method ="post" controller="event" action="searchByevent">
                Search Member:   <g:textField name="search1" class="form-control"></g:textField>
                <input type="submit" class="btn btn-primary" value="Search">
            </g:form>
        </div>
        <div class="col-lg-5">

        </div>
        <div class="col-lg-2">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="event" action="create_event">Add new Event </g:link></button>
        </button>

        </div>
    </div>
</div>


%{--<section class="banner-sec">--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-md-6">--}%

%{--<div class="card"> <img class="img-fluid" height="300px" width=300px" src="${createLink(controller: 'event', action: 'showImage', params: [id:events.id])}" alt="">--}%
%{--<div class="card-body">--}%
%{--<div class="news-title">--}%
%{--<h2 class=" title-small"><a href="#"> ${events.event_name}s</a></h2>--}%
%{--</div>--}%
%{--<p class="card-text"><small class="text-time"><em>Event</em></small></p>--}%
%{--</div>--}%

%{--</div>--}%
%{--</div>--}%

%{--<div class="col-md-6">--}%

%{--<div class="jumbotron" style="background: greenyellow">--}%
%{--Description: ${raw(events.description)}--}%
%{--</div>--}%
%{--<div class="jumbotron" style="background: wheat">--}%
%{--Author: ${events.author}<br>--}%
%{--Organized by: ${events.organized_by}<br>--}%
%{--Created: ${events.created}--}%
%{--</div>--}%
%{--<div class="jumbotron" style="background: #2b2b2b; height: 1000px" >--}%

%{--</div>--}%
%{--</div>--}%
%{--</div></section>--}%
<section class="banner-sec">
    <div class="container">
        <div class="row">
            <g:each in="${eventList}" var="events">
                <div class="col-md-3">

                    <div class="card">
                        <g:link controller="event" action="show" id="${events?.id}">

                            <img class="img-fluid" src="${createLink(controller: 'event', action: 'showImage', params: [id:events.id])}"  ></g:link>
                        <div class="card-body">
                            <div class="news-title">
                                <h2 class=" title-small"><a href="#">Name: ${events.event_name}</a></h2>
                            </div>
                            <p class="card-text"><small class="text-time"><em>Author: ${events.author}</em></small></p>
                            <p class="card-text"><small class="text-time"><em>Organized by: ${events.organized_by}</em></small></p>
                            <p class="card-text"><small class="text-time"><em>Created: ${events.created}</em></small></p>
                        </div>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <g:link action="event_edit" id="${events.id}"><i class="fa fa-edit"></i>Edit</g:link>
                            <g:link action="delete" id="${events.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>Delete</g:link>

                        </sec:ifAnyGranted>
                    </div>

                </div>
            </g:each>
        </div>
    </div></section>




%{--<button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="event" action="create_event">Add new Event </g:link></button>--}%

</body>
</html>
