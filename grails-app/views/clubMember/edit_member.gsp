<%--
  Created by IntelliJ IDEA.
  User: Gud Kush
  Date: 4/10/2018
  Time: 4:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

</head>

<body>


<g:form method="post" action="update" enctype="multipart/form-data">
    <g:hiddenField name="id" value="${edit.id}"/>
    <div class="jumbotron">
        <h1 align="center">Members</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="image">Image</label>
                <input type="file" class="form-control" id="image" name="image"  value="${edit.image}"/>
                %{--<g:textField  class="form-control" id="image" name="image" placeholder="Insert Image" />--}%
            </div>

            <div class="col-md-6 mb-3">
                <label for="mname">Member Name</label>
                <g:textField class="form-control" id="mname" name="member_name"  value="${edit.member_name}"/>
                <div class="invalid-feedback">
                    Valid address name is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="height">Height</label>
                <g:textField class="form-control" id="height" name="height" value="${edit.height}"/>
                <div class="invalid-feedback">
                    Valid address name is required.
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label for="weight">Weight</label><br>
                <g:textField  class="form-control" id="weight" name="weight" value="${edit.weight}"/>

            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="address">Address</label>
                <g:textField  class="form-control" id="address" name="address" value="${edit.address}" />
            </div>

            <div class="col-md-6 mb-3">
                <label for="contact">Contact</label>
                <g:textField  class="form-control" id="contact" name="contact" value="${edit.contact}" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <g:textField  class="form-control" id="email" name="email" value="${edit.email}" />
            </div>

            <div class="col-md-6 mb-3">
                %{--<label for="package">Package type</label>--}%
                %{--<g:textField  class="form-control" id="package" name="package_type" value="${edit.package_type}" />--}%
                <g:select from="${Nepfit_3.ClubMember?.Packages}" class="form-control" id="package" name="package_type" value="${edit.package_type}"/>

            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="date">Created on</label>
                <g:datePicker  class="form-control" id="date" name="issued_date" value="${edit.issued_date}" />
            </div>
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