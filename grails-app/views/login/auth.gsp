<!doctype html>
<html>
<head>
    <meta name="layout" content="login"/>
    <title>OCHL - Login</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <style type="text/css">
        body { padding-top : 0px; height : 100%;}
        html { background-color : rgba(245, 245, 245, 1);  height : 100%;}
        #login-form { height : 100%; }
        .row { margin-bottom : 0px; }
        .title { 
            font-size: 24px; 
            text-align: center; 
            color: white; 
            font-family: "Open Sans"; 
            padding-bottom : 12px;
        }
    </style>
</head>
<body>
    <div class="indigo" style="height : 45%; width : 100%; position : fixed; top : 0px;"></div>
    <div id="login-form" class="row valign-wrapper">
        <div class="col s12 m8 l4 offset-m2 offset-l4 valign" style="z-index : 0;" >
            <div class="card" id="signupCard">
                <div class="card-content">
                    <form action="/login/authenticate" method="POST" autocomplete="off" style="margin-top : 24px;" >
                        <input type="text" name="username" placeholder="Username" class="form-control"/>
                        <input type="password" name="password" placeholder="Password" class="form-control" />
                        <span id="signup" class="card-title grey-text text-darken-4 btn-flat" style="padding-left : 10px; padding-top: 5px; font-size : 16px; font-weight : 400;" >
                        </span>
      
                        <input type="submit" value="Login" class="waves-effect btn-flat" style="float : right; margin : 12px 0px 24px;" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#signup").on("click", function(){
            window.location.href = "/userManagement/signup";
        });
    </script>
</body>
</html>
