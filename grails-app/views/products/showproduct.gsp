<%--
  Created by IntelliJ IDEA.
  User: Sanju
  Date: 5/4/2018
  Time: 6:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
%{--<br><br><br><br><br><br>--}%
%{--<img height="200px" width=300px" src="${createLink(controller: 'products', action: 'showImage', params: [id:product.id])}"/>--}%
%{--Name: ${product.name}--}%
%{--Price: ${product.price}--}%

 %{--${raw(product.description)}--}%

<br><br>
<section class="banner-sec">
    <div class="container">
        <g:each in="${product}" var="products">
        <div class="row">
                <div class="col-md-8">
                    <div class="card">

                        <img  height="300" width="400" src="${createLink(controller: 'products', action: 'showImage', params: [id:products.id])}"  alt="">

                        %{--<div class="card-body">--}%
                            %{--<div class="news-title">--}%
                                %{--<h5> ${products.name}</h5>--}%
                                %{--<h2 class=" title-small">Price: ${products.price}</h2>--}%
                                %{--${raw(product.description)}--}%
                            %{--</div>--}%
                        %{--</div>--}%

                    </div>
            </div>
                <div class="col-md-4">
                    <div class="jumbotron" style="background: wheat">
                        <h1>${products.name}</h1>
                        Price: ${products.price}
                    </div>

                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <g:link action="edit" id="${products.id}"><i class="fa fa-edit"></i>Edit</g:link>
                        <g:link action="delete" id="${products.id}" onclick="return confirm('Are u sure?')"><i class="fa fa-trash"></i>Delete</g:link>
                    </sec:ifAnyGranted>
                </div>
            <div class="jumbotron" style="background: lightblue;  width: 100%" >
                ${raw(product.description)}
            </div>
            </g:each>
        </div>
    </div></section>

</body>
</html>