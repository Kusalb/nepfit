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
<br><br>

<section class="banner-sec">
    <div class="container">
        <g:each in="${member}" var="members">
            <div class="row">
                    <div class="col-md-8">
                        <div class="card">

<img height="400"  width="400"  src="${createLink(controller: 'clubMember', action: 'showImage', params: [id:members.id])}"/>            </div>
    </div>
            <div class="col-md-4">
                <div class="jumbotron" style="background: wheat">
                    <h1>Name: ${member.member_name}</h1>
                    Address: ${member.address}<br>
                    Contact: ${member.contact}<br>
                    Height ${member.height}<br>
                    Weight ${member.weight}<br>
                     Email: ${member.email}<br>
                    Package Type: ${member.package_type}<br>
                    Issued date: ${member.issued_date}<br>
                </div>

                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <g:link action="edit_member" id="${member.id}"><i class="fa fa-edit"></i>Edit</g:link>
                    <g:link action="delete" id="${member.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>delete</g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="jumbotron" style="background: lightblue; width: 100%">

            </div>
        </g:each>
    </div>
    </div></section>

</body>
</html>

%{--<img height="200px" width=300px" src="${createLink(controller: 'clubMember', action: 'showImage', params: [id:member.id])}"/>--}%

 %{--Name: ${member.member_name}--}%
 %{--Height ${member.height}--}%
 %{--Weight ${member.weight}--}%
 %{--Address: ${member.address}--}%
 %{--Contact: ${member.contact}<br></>--}%
%{--<td> Email: ${member.email}<br></td>--}%
%{--<td> Package Type: ${member.package_type}<br></td>--}%
%{--<td> Issued date: ${member.issued_date}<br></td>--}%