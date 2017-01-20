<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="BOMOO - Admin"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    
    <asset:stylesheet src="site.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <style type="text/css">
        nav {
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .form-control { margin-top: 10px; }
        #preview-window content p { text-align: justify; }
        #preview-window content p:nth-child(1) { margin-top: 20px; }

        .notify-success {
            position: fixed; 
            bottom: 20px; 
            right: 50px; 
            padding: 20px; 
            border-radius: 3px;
            border: 1px solid black;
            color: white;
            background-color: #3498db;
            display: none;
        }

        .sub-menu    {
                display: none;
                position: absolute;
                top: 50px;
                width: 150px;
                border-style: solid;
                border-width: 0px;
                border-color: black;
                background-color: white;
                color: black;
                z-index: 1000;
                
                   -moz-box-shadow: 0 0 0.3em #255b17;
                -webkit-box-shadow: 0 0 0.3em #255b17;
                        box-shadow: 0 0 0.3em #255b17;
                        
                   -moz-box-top-shadow: none;
                -webkit-box-top-shadow: none;
                        box-top-shadow: none;
            }

            #logoff{
                float: right;
            }
    </style>
    <g:layoutHead/>
</head>
<body>
    <nav class="navbar navbar-inverse" role="navigation">
        <ul id="logoff" class="nav navbar-nav">
            <li class="nav-menu-item">
                <g:link controller="logoff">Logout</g:link>
            </li>
        </ul>
        <div class="div960">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="#" style="color: black; background-color: #eee;"> BOMOO - Admin </a>
                </li>
                <li class="nav-menu-item" data-target="about-us-sub">
                    <a href="#" style="color: white;"> Website Administration </a>
                    <div id="about-us-sub" class="sub-menu">
                        <g:link controller="blog" action="create"><div class="mi">Blog</div></g:link>
                        <g:link controller="event" action="create"><div class="mi">Event</div></g:link>
                        <g:link controller="news" action="create"><div class="mi">News</div></g:link>
                        <g:link controller="notice" action="create"><div class="mi">Notification</div></g:link>
                    </div>
                </li>
                <li class="nav-menu-item" data-target="sms-sub">
                    <a href="#" style="color: white;"> Bulk SMS </a>
                    <div id="sms-sub" class="sub-menu">
                        <g:link controller="bulkSMS" action="createBSMS"><div class="mi">Birthday SMS</div></g:link>
                        <g:link controller="bulkSMS" action="createGSMS"><div class="mi">Group SMS</div></g:link>
                    </div>
                </li>
                <li class="nav-menu-item" data-target="query-sub">
                    <a href="#" style="color: white;"> Member's Query </a>
                    <div id="query-sub" class="sub-menu">
                        <g:link controller="transferRequestManagement" action="index"><div class="mi">Transfer Request</div></g:link>
                        <g:link controller="IRIssue" action="index"><div class="mi">IR Issue</div></g:link>
                    </div>
                </li>
                <li class="nav-menu-item">
                    <g:link controller="BusinessDevelopment" style="color: white;" action="index">Business Development Sugestions</g:link>
                </li>
                <li class="nav-menu-item">
                    <g:link controller="uploadData" style="color: white;" action="index">Upload User Data</g:link>
                </li>
            </ul>
        </div>
    </nav>

    <div>
        <g:layoutBody/>
    </div>
    <script type="text/javascript">
            
            $(".nav-menu-item").mouseenter(function() {
                var s = $(this).data("target");
                $("#" + s).show();
            });

            $(".nav-menu-item").mouseleave(function() {
                var s = $(this).data("target");
                $("#" + s).hide();
            });
        </script>
</body>
</html>
