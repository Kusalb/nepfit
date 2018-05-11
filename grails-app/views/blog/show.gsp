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
%{--<br><br><br><br><br>--}%
%{--<img height="200px" width=300px" src="${createLink(controller: 'blog', action: 'showImage', params: [id:blog.id])}"/>--}%

%{--<td> Name: ${blog.blog_name}<br></td>--}%
%{--<td> Author: ${blog.author}<br></td>--}%
%{--<td> Created: ${blog.created}<br></td>--}%
%{--<td> Description: ${raw(blog.description)}<br></td>--}%


<br><br>
<section class="banner-sec">
    <div class="container">
        <g:each in="${blog}" var="blogs">
            <div class="row">
                    <div class="col-md-8">
                        <div class="card">

<img height="300"   width="400" src="${createLink(controller: 'blog', action: 'showImage', params: [id:blog.id])}"/>            </div>
    </div>
            <div class="col-md-4">
                <div class="jumbotron" style="background: wheat">
                    <h1>${blog.blog_name}</h1>
                    Author: ${blog.author}<br>
                    Date: ${blog.created}
                </div>

                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <g:link action="edit_blog" id="${blog.id}"><i class="fa fa-edit"></i>Edit</g:link>
                    <g:link action="delete" id="${blog.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>delete</g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="jumbotron" style="background: lightblue; width: 100%">
                ${raw(blog.description)}
            </div>
        </g:each>
    </div>
    </div></section>
</body>
</html>
