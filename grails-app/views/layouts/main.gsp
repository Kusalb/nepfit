<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--}%
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <asset:stylesheet href="custom.css"/>

    <asset:javascript src="indexs.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:stylesheet src="new.scss"/>

    <asset:javascript src="jquery-2.2.0.min.js"/>
    %{--<asset:javascript src="jqueryValidate.js"/>--}%
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <asset:javascript src="custom.js"/>
    <asset:stylesheet href="card.css"/>
    <ckeditor:resources/>
    <g:layoutHead/>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">NepFit</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
            </li>
            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_USER">

                <li class="nav-item">
                    %{-- <a class="nav-link">Product</a>--}% <g:link controller="products" class="nav-link" action="list">Products</g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="exercise" class="nav-link" action="exercise_list">Exercise</g:link>
                    %{-- <a class="nav-link " href="#">Exercise</a>--}%
                </li>
                <li class="nav-item">
                    %{--<a class="nav-link " href="#">Blog</a>--}%
                    <g:link controller="blog" class="nav-link" action="blog_list">Blog</g:link>
                </li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                <li class="nav-item">
                    <g:link controller="clubMember" class="nav-link" action="member_list">Member </g:link>
                    %{-- <a class="nav-link " href="#">Exercise</a>--}%
                </li>
                </sec:ifAnyGranted>

                <li class="nav-item">
                    <g:link controller="event" class="nav-link" action="event_list">Event </g:link>
                    %{-- <a class="nav-link " href="#">Exercise</a>--}%
                </li>


            %{--<li class="nav-item dropdown">--}%
            %{--<g:link class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</g:link>--}%
            %{--<div class="dropdown-menu" aria-labelledby="dropdown01">--}%
            %{--<g:link class="dropdown-item" href="#">Action</g:link>--}%
            %{--<g:link class="dropdown-item" href="#">Another action</g:link>--}%
            %{--<g:link class="dropdown-item" href="#">Something else here</g:link>--}%
            %{--</div>--}%
            %{--</li>--}%
                <li class="nav-item">
                    <g:link controller="products" class="nav-link" action="bmi">BMI Calculator </g:link>
                    %{-- <a class="nav-link " href="#">Exercise</a>--}%
                </li>

            </sec:ifAnyGranted>
        </ul>
    %{--        <g:link controller="products" action="list">products</g:link>--}%



        <sec:ifLoggedIn>

            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link  controller="logout" action="index">Log-out</g:link> </button>
        %{--<button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link action="signup">Signup</g:link></button>--}%

        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link  controller="login" action="auth">Log-in</g:link> </button>

        </sec:ifNotLoggedIn>
        <sec:ifAnyGranted roles="ROLE_USER">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link  controller="clubMember" action="changePassword">Change Password</g:link> </button>

        </sec:ifAnyGranted>


    %{--
            <g:link action="logout">Logout</g:link>--}%
    %{--<button class="btn btn-outline-success my-2 my-sm-0" type="submit"><g:link controller="login" action="auth">Log-in</g:link> </button>--}%

    </div>
    <br><br>
</nav>
<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
</body>
</html>
