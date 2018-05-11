<%--
  Created by IntelliJ IDEA.
  User: saneel
  Date: 4/10/18
  Time: 5:41 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


%{--<body>

    <g:form action="register">
        <g:textField name="email" placeholder="enter email"/>
        <g:passwordField name="password" type ="password" placeholder="enter password"/>
        <g:submitButton value="register" name="register"/>
    </g:form>
</body>--}%
<body>
<g:form action="register">

    <div class="container">
        <div class="row main">
            <div class="main-login main-center">
                <form class="" method="post" action="#">

                    %{--  <div class="form-group">
                          <label for="name" class="cols-sm-2 control-label">Your Name</label>
                          <div class="cols-sm-10">
                              <div class="input-group">
                                  <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                  <input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>
                              </div>
                          </div>
                      </div>--}%

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Your Email</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>
                            </div>
                        </div>
                    </div>

                    %{--    <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Username</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username"/>
                                </div>
                            </div>
                        </div>
        --}%
                    <div class="form-group">
                        <label for="password" class="cols-sm-2 control-label">Password</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
                            </div>
                        </div>
                    </div>%{--

                <div class="form-group">
                    <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
                        </div>
                    </div>
                </div>--}%

                    <div class="form-group ">
                        <g:submitButton value="register" name="register" id="button"/>
                        %{--
                                            <a href="http://deepak646.blogspot.in" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>
                        --}%
                    </div>

                </form>
            </div>
        </div>
    </div>
</g:form>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
</body>
</html>
