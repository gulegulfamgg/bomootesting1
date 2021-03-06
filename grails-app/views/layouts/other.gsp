<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="OCP"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="datatables.css"/>
    <asset:stylesheet src="layout.css"/>
    <asset:stylesheet src="materialize.css"/>

    <asset:javascript src="application.js"/>
    <asset:javascript src="datatables.min.js"/>
    <asset:javascript src="materialize.js"/>
    <asset:javascript src="d3.v3.min.js"/>

    <script type="text/javascript" src="/assets/js/chalan-trend.js" ></script>

    <style type="text/css">
        body { padding-top: 48px; }
        #topbar {
            background-color : #303F9F;
            position: fixed;
            top : 0px;
            height: 48px !important;
            z-index: 100;
        }
    </style>
    
    <g:layoutHead/>
</head>
<body>
    <div id="topbar">
        <div id="logo">
            <span id="main"> BOMOO </span>
            <span id="sub">Bank of Maharashtra Officers Organization</span>
        </div>
        <a class='dropdown-button topbar-icons' href='#' data-activates='account-actions'>
            <i class="material-icons md-light">more_vert</i>
        </a>
        <ul id='account-actions' class='dropdown-content'>
            <li><g:link controller="logoff">Log Out</g:link></li>
        </ul>
        <a class='dropdown-button topbar-icons' href='#' data-activates=''>
            <i class="material-icons md-light">notifications</i>
        </a>
        <a class='topbar-icons' href='#'>
            <i class="material-icons md-light">account_box</i>
        </a>
        
        <a class='dropdown-button topbar-icons' href='http://localhost:8080' data-activates=''>
            <i class="material-icons md-light">home</i>
        </a>
    </div>
        <g:layoutBody/>
    <div id="footer">
        <div style="margin-top: 10px;">
            About BOMOO &nbsp&nbsp &#124 &nbsp&nbsp Feedback &nbsp&nbsp &#124 &nbsp&nbsp Contact Us
            <span style="float : right;">&#169 All Rights Reserved</span>
        </div>
    </div>
</body>
</html>
