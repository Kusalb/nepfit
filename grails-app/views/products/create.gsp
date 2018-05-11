<%--
  Created by IntelliJ IDEA.
  User: Gud Kush
  Date: 4/9/2018
  Time: 11:05 PM
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


    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    %{--<asset:javascript src="jqueryValidate.js"/>--}%

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <asset:javascript src="custom.js"/>

</head>
<body style="background-color:lightgrey;">
<form method ="post" id ="commentForm"  action="save" enctype="multipart/form-data">
    <div class="jumbotron">
        <h1 align="center">Products</h1>
    </div>

    <div class="container">
    <div class="row">
    <div class="col-md-6 mb-3">
        <label for="image">Image</label>
        <input type="file" class="form-control" id="image" required="" name="productImage"/>
        %{--<g:textField  class="form-control" id="image" name="image" placeholder="Insert Image" />--}%
    </div>


    <div class="col-md-6 mb-3">
        <label for="pro">Product</label>

        <g:textField required="" class="form-control" id="pro" name="name" placeholder="Enter name" type="text"    />
    </div>
    </div>
    <div class="row">
    <div class="col-md-12 mb-3">
        <label for="price">Price</label>
        <input type="number" class="form-control" required="" id="price" name="price" placeholder="Enter price" type="number" />
        <div class="invalid-feedback">
            Valid address name is required.
        </div>
    </div>
    </div>
    <div class="col-md-12 mb-3">
        <label for="description">Description</label>
        <ckeditor:editor height="140px" width="100%" toolbar="DLC" id="description" name="description"></ckeditor:editor>
        </div>
        <br><br>
    <div class="row">
        <div class="col-lg-6">
    <g:submitButton class="btn btn-primary" name="save" value="Save"  style="padding-right: 580px; padding-left: 500px" />

    </div>
    </div>
</div>

    </div>
</form>


<br><Br><br><br><br>
<div class="footer-copyright py-3 text-center">
    © 2018 Copyright:
    <a href="https://mdbootstrap.com/material-design-for-bootstrap/"> GudKush </a>
</div>
<script>

</script>
</body>
</html>