<%--
  Created by IntelliJ IDEA.
  User: Sanju
  Date: 4/22/2018
  Time: 2:25 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
    <div class="jumbotron">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1 class="display-3" style="color:red; font-family: Impact, Charcoal, sans-serif; font-size: 150px;padding-top: 80px; "> NepFit</h1>
                    <p style= "font-family: Courier New, Courier, monospace; font-size:20px;">Promoting fitness in Nepal.</p>
                    <p><a class="btn btn-primary btn-lg" href="#" role="butt on">Learn more &raquo;</a></p>
                </div>
                <div class="col-md-6">
                    <asset:image src="gym.png" width="500" height="377"/>
                    %{--<img src="images/gym.png"  alt="logo">--}%
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <h1 style="font-family: Impact, Charcoal, sans-serif ">Upcoming events</h1>
    </div>
<section class="banner-sec">
    <div class="container">
        <div class="row">
            <g:each in="${event}" var="events">
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
                            <g:link action="event_edit" id="${events.id}">Edit</g:link>
                            <g:link action="delete" id="${events.id}" onclick="return confirm('Are u sure?')">Delete</g:link>

                        </sec:ifAnyGranted>
                    </div>

                </div>
            </g:each>
        </div>
    </div></section>


%{--<g:each in="${event}" var="events">--}%
    %{--<tr scope="row">--}%
        %{--<g:link controller="products" action="show" id="${events?.id}">--}%
        %{--<td><img height="200px" width=300px" src="${createLink(controller: 'event', action: 'showImage', params: [id:events.id])}"/></td>--}%
        %{--</g:link>--}%
        %{--<td>${events.event_name}</td>--}%
         %{--${events.author}--}%
         %{--${events.organized_by}--}%
         %{--${raw(events.description)}--}%
         %{--${events.created}--}%
    %{--</tr>--}%
%{--</g:each>--}%

</body>
</html>