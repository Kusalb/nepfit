<%--
  Created by IntelliJ IDEA.
  User: Gud Kush
  Date: 4/10/2018
  Time: 12:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<body><br><br><br><br>

<div class="container">

    <div class ="row">
        <div class="col-lg-5">
            <g:form method ="post" controller="blog" action="searchByblog">
                Search Blog:   <g:textField name="search1" class="form-control"></g:textField>
                <input type="submit" class="btn btn-primary" value="Search">
            </g:form>
        </div>
        <div class="col-lg-5">

        </div>
<sec:ifAnyGranted roles="ROLE_ADMIN">
        <div class="col-lg-2">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="blog" action="create_blog">Add new Blog </g:link></button>

        </div>
</sec:ifAnyGranted>
    </div>
</div>

%{--<table  class="table table-striped table-dark">--}%

    %{--<thead> <tr>--}%
        %{--<th scope="col">S.N.</th>--}%
        %{--<th scope="col">Image</th>--}%
        %{--<th scope="col">Name</th>--}%
        %{--<th scope="col">Author</th>--}%
        %{--<th scope="col">Description</th>--}%
        %{--<th scope="col">Created on</th>--}%
%{--<g:if test="${role=='ROLE_ADMIN'}">--}%
    %{--<th scope="col">Edit</th>--}%
            %{--<th scope="col">delete</th>--}%
    %{--</g:if>--}%

    %{--</tr>--}%

    %{--<g:each in="${blog}" var="blogs">--}%
        %{--<tr scope="row">--}%

            %{--<td><g:link controller="blog" action="show" id="${blogs?.id}"><img height="200px" width=300px" src="${createLink(controller: 'blog', action: 'showImage', params: [id:blogs.id])}"/></g:link></td>--}%

            %{--<td> Name: ${blogs.blog_name}<br></td>--}%
            %{--<td> Author: ${blogs.author}<br></td>--}%
            %{--<td> Created: ${blogs.created}<br></td>--}%
            %{--<td> Description: ${raw(blogs.description)}<br></td>--}%
        %{--<sec:ifAnyGranted roles="ROLE_ADMIN">--}%

            %{--<td><g:link action="edit_blog" id="${blogs.id}">Edit</g:link></td>--}%
            %{--<td><g:link action="delete" id="${blogs.id}" onclick="return confirm('Are u sure?')">delete</g:link></td>--}%
        %{--</sec:ifAnyGranted>--}%
        %{--</tr>    </g:each>--}%

%{--</table>--}%
%{--</div>--}%
%{--<button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="blog" action="create_blog">Add new blog </g:link></button>--}%



<section class="banner-sec">

    <div class="container">

        <div class="row">
            <g:each in="${blog}" var="blogs">
                <div class="col-md-4">

                    <div class="card">
                        <g:link controller="blog" action="show" id="${blogs?.id}">
                            <img height="200" width="100%" src="${createLink(controller: 'blog', action: 'showImage', params: [id:blogs.id])}"  alt="">
                        </g:link>
                        <div class="card-body">
                            <div class="news-title">
                                <h5> ${blogs.blog_name}</h5>
                                Author: ${blogs.author}<br>
                                <h2 class=" title-small">Date: ${blogs.created}</h2>

                            </div>
                        </div>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <div class="row">
                                <div class="col-lg-3">
                                    <td><g:link action="edit_blog" id="${blogs.id}"><i class="fa fa-edit"></i>Edit</g:link></td>

                                </div>
                                <div class="col-lg-4">
                                    <td><g:link action="delete" id="${blogs.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>delete</g:link></td>

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
