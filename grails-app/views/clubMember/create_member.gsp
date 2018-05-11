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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">



<body style="background-color:lightgrey;">
<form method ="post" id ="commentForm" action="save" enctype="multipart/form-data">
    <div class="jumbotron">
        <h1 align="center">Members</h1>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="image">Image</label>
                <input type="file" class="form-control" id="image" name="clubMemberImage" required/>
                %{--<g:textField  class="form-control" id="image" name="image" placeholder="Insert Image" />--}%
            </div>

            <div class="col-md-6 mb-3">
                <label for="mname">Member Name</label>
                <g:textField class="form-control" id="mname" name="member_name" placeholder="Enter author" required="" type="text" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="height">Height in cm</label>
                %{--<g:textField class="form-control" id="height" name="height" placeholder="Enter height" required="" type="number"/>--}%
                <input type="number" class="form-control" id="height" name="height" placeholder="Enter height" required=""/>

            </div>

                <div class="col-md-6 mb-3">
                    <label for="weight">Weight in kg</label><br>
                    <input type="number"  class="form-control" id="weight" name="weight" placeholder="Enter weight" required="" type="number"/>

                </div>
        </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="address">Address</label>
            <g:textField  class="form-control" id="address" name="address" placeholder="Type address" required="" type="text" />
        </div>

        <div class="col-md-6 mb-3">
            <label for="contact">Contact</label>
            <input type="number" class="form-control" id="contact" name="contact" placeholder="Type Contact" type="number"/>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="email">Email</label>
            <g:textField  class="form-control" id="email" name="email" placeholder="Type email" type="email"/>
        </div>

        %{--<div class="col-md-6 mb-3">--}%
            %{--<label for="package">Package type</label>--}%
            %{--<g:textField  class="form-control" id="package" name="package_type" placeholder="Type package" required="" type="text"/>--}%
        %{--</div>--}%
        <div class="col-md-6 mb-3">
        <label for="package">Package type</label>
        <g:select from="${Nepfit_3.ClubMember?.Packages}" class="form-control" id="package" name="package_type" required="" type="text"/>
    </div>

    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="date">Created on</label>
            <g:datePicker  class="form-control" id="date" name="issued_date" placeholder="Type date" />
        </div>
    </div>




        %{-- <g:textField name="name" placeholder="Enter product name"/>
                 <g:textField name="price" placeholder="Enter price of product"/>
                 <g:textField name="location" placeholder="Enter location"/>

     <button type="button" class="btn btn-primary">Primary</button>--}%

        <br><br>
        <div class="row">
            <div class="col-lg-6">
                <g:submitButton class="btn btn-primary" name="save" value="Save"  style="padding-right: 580px; padding-left: 500px" />
            </div>
        </div>
    </div>

</form>

<br><Br>
<div class="footer-copyright py-3 text-center">
    © 2018 Copyright:
    <a href="https://mdbootstrap.com/material-design-for-bootstrap/"> GudKush </a>
</div>


</body>
</html>