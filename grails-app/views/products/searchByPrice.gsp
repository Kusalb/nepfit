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

%{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--}%

<body>
<br><br><br>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <g:form method ="post" controller="products" action="searchByPrice">
                Search by price:    <g:textField name="search1" class="form-control"></g:textField>
                <input type="submit"  class="btn btn-primary" value="Search">
            </g:form>
        </div>
        <div class="col-lg-6">
            <g:form method ="post" controller="products" action="searchByProduct">
                Search by product:    <g:textField name="search2" class="form-control"></g:textField>
                <input type="submit"  class="btn btn-primary" value="Search">
            </g:form>
        </div>

    </div>
</div>







<br><br><br><br><br>

%{--<table  class="table table-striped table-dark">--}%

%{--<thead> <tr>--}%
%{--<th scope="col"></th>--}%
%{--<th scope="col"></th>--}%
%{--<th scope="col"></th>--}%
%{--<th scope="col"></th>--}%
%{--<th scope="col"></th>--}%
%{--<g:if test="${role=='ROLE_ADMIN'}">--}%
%{--<th scope="col">Edit</th>--}%
%{--<th scope="col">delete</th>--}%
%{--</g:if>--}%
%{--</tr>--}%
%{--<g:each in="${product}" var="products">--}%
%{--<tr scope="row">--}%

%{--<td><g:link controller="products" action="showproduct" id="${products?.id}"><img height="200px" width=300px" src="${createLink(controller: 'products', action: 'showImage', params: [id:products.id])}"/></g:link></td>--}%

%{--<td> Name: ${products.name}<br></td>--}%
%{--<td> Price: ${products.price}<br></td>--}%

%{--<td> Description: ${raw(products.description)}<br></td>--}%
%{--<g:if test="${role=='ROLE_ADMIN'}">--}%
%{--<td><g:link action="edit" id="${products.id}">Edit</g:link></td>--}%
%{--<td><g:link action="delete" id="${products.id}" onclick="return confirm('Are u sure?')">delete</g:link></td>--}%
%{--</g:if>--}%

%{--</tr>    </g:each>--}%
%{--</table>--}%
<div class="container">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="products" action="create">Add new product </g:link></button>

</div>
<section class="banner-sec">

    <div class="container">

        <div class="row">
            <g:each in="${productList}" var="products">
                <div class="col-md-4">

                    <div class="card">
                        <g:link controller="products" action="showproduct" id="${products?.id}">
                            <img class="img-fluid" src="${createLink(controller: 'products', action: 'showImage', params: [id:products.id])}"  alt="">
                        </g:link>
                        <div class="card-body">
                            <div class="news-title">
                                <h5> ${products.name}</h5>
                                <h2 class=" title-small">Price: ${products.price}</h2>

                            </div>
                        </div>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <div class="row">
                                <div class="col-lg-3">
                                    <g:link action="edit" id="${products.id}"><i class="fa fa-edit"></i>Edit</g:link>

                                </div>
                                <div class="col-lg-4">
                                    <g:link action="delete" id="${products.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>Delete</g:link>

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
