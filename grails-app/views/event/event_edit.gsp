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


<g:form method="post"   action="update" enctype="multipart/form-data">
    <g:hiddenField name="id" value="${edit.id}"/>
    <div class="jumbotron">
        <h1 align="center">Event</h1>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="image">Image</label>
                <input type="file" class="form-control" id="image" name="image" />
                %{--<g:textField  class="form-control" id="image" name="image" placeholder="Insert Image" />--}%
            </div>
            <div class="col-md-6 mb-3">
                <label for="event_name">Event Name</label>
                <g:textField  class="form-control" id="event_name" name="event_name"  value="${edit.event_name}" />
            </div>

        </div>

        <div class="row">


            <div class="col-md-6 mb-3">
                <label for="author">Author</label>
                <g:textField class="form-control" id="author" name="author"  value="${edit.author}"/>

            </div>


            <div class="col-md-6 mb-3">
                <label for="organized_by">Organized by:</label>
                <g:textField  class="form-control" id="organized_by" name="organized_by" value="${edit.organized_by}" />

            </div>


            <div class="col-md-6   mb-3">
                <label for="created">Scheduled date</label>
                <g:datePicker  class="form-control" id="created" name="created" value="${edit.created}"/>

            </div>

            <div class="col-md-12 mb-3">
                <label for="description">Description</label>
                <ckeditor:editor height="140px" width="100%" toolbar="DLC" id="description" name="description">${edit.description}</ckeditor:editor>
            </div>




        <div class="row">
            <div class="col-lg-6">
                <g:submitButton class="btn btn-primary" name="update" value="Update"  style="padding-right: 580px; padding-left: 500px" />
            </div>
        </div>
    </div>

</g:form>

<br><br><br>
<div class="footer-copyright py-3 text-center">
    © 2018 Copyright:
    <a href="https://mdbootstrap.com/material-design-for-bootstrap/"> GudKush </a>
</div>



</body>
</html>
