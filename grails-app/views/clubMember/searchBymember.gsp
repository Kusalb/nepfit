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

<body>
<<br><Br><br>
<div class="container">

    <div class ="row">
        <div class="col-lg-5">
            <g:form method ="post" controller="blog" action="searchBymember">
                Search Member:   <g:textField name="search1" class="form-control"></g:textField>
                <input type="submit" class="btn btn-primary" value="Search">
            </g:form>
        </div>
        <div class="col-lg-5">

        </div>
        <div class="col-lg-2">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="clubMember" action="create_member">Add new Member </g:link>
            </button>

        </div>
    </div>
</div>


<br><br><br><br>
<h1>Current Club member</h1>

<section class="banner-sec">

    <div class="container">

        <div class="row">
            <g:each in="${currentClubMember}" var="cm">
                <div class="col-md-4">

                    <div class="card">
                        <g:link controller="clubMember" action="show" id="${cm?.id}">
                            <img height="200px" width=300px" src="${createLink(controller: 'clubMember', action: 'showImage', params: [id:cm.id])}"/> </g:link></td>

                        <div class="card-body">
                            <div class="news-title">
                                <h5> ${cm.member_name}</h5>
                                Address: ${cm.address}
                                <h2 class=" title-small">Contact: ${cm.contact}</h2>

                            </div>
                        </div>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <td><g:link action="edit_member" id="${cm.id}"><i class="fa fa-edit"></i>Edit</g:link></td>
                            <td><g:link action="delete" id="${cm.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>Delete</g:link></td>
                        </sec:ifAnyGranted>
                    </div>

                </div>
            </g:each>
        </div>
    </div></section>




</body>
</html>
