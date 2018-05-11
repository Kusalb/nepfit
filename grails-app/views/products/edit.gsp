<%--
  Created by IntelliJ IDEA.
  User: Gud Kush
  Date: 4/9/2018
  Time: 11:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
    <script type="text/javascript">
        <ckeditor:config var="toolbar_DLC">
        [
            [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ],
            [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
            [ 'Link','Unlink' ],
            [ 'Styles','Format','FontSize' ],
            [ 'TextColor','BGColor' ],
            ['Preview'],
        ]
        </ckeditor:config>
    </script>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<body style="background-color:lightskyblue;">

<g:uploadForm method="post" action="update" enctype="multipart/form-data">
    <g:hiddenField name="id" value="${edit.id}"/>

%{--<g:form method ="post" action="save">--}%

        <div class="jumbotron">
            <h1 align="center">Products</h1>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="image">Image</label>
                    <input type="file" class="form-control" id="image" name="image" value="${edit.image}" />

%{--<g:textField  class="form-control" id="image" name="image" placeholder="Insert Image" value="${edit.image}" />--}%


                </div>


                <div class="col-md-6 mb-3">
                    <label for="pro">Product</label>
                    <g:textField  class="form-control" id="pro" name="name" placeholder="Enter name" value="${edit.name}"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="price">Price</label>
                    <g:textField class="form-control" id="price" name="price" placeholder="Enter price" value="${edit.price}"/>
                    <div class="invalid-feedback">
                        Valid address name is required.
                    </div>
                </div>
            </div>

                <div class="col-md-12 mb-3">
                    <label for="description">Description</label>

                    <ckeditor:editor height="140px" width="100%" toolbar="DLC" id="description" name="description">${edit.description}</ckeditor:editor>

                    %{--<g:textField  class="form-control" id="description" name="description" placeholder="Enter name" value="${edit.description}"/>--}%

                </div>



<br><br>

   %{-- <g:textField name="name" placeholder="Enter product name"/>
                <g:textField name="price" placeholder="Enter price of product"/>
                <g:textField name="location" placeholder="Enter location"/>

<button type="button" class="btn btn-primary">Primary</button>--}%

            <div class="row">
                <div class="col-lg-6">
                    <g:submitButton class="btn btn-primary" name="update" value="Update"  style="padding-right: 580px; padding-left: 500px" />
                </div>
            </div>
        </div>

    </g:uploadForm>

<br><Br><br><br><br>

<div class="footer-copyright py-3 text-center">
    © 2018 Copyright:
    <a href="https://mdbootstrap.com/material-design-for-bootstrap/"> GudKush </a>
</div>


   %{-- <g:submitButton class="btn btn-primary" name="update" value="update"/>
</g:form>--}%
</body>
</html>