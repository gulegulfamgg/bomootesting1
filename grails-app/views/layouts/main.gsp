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
        
    <link rel="stylesheet" href="/assets/css/area-chart.css">
    
    <script type="text/javascript" src="/assets/js/line-chart.js" ></script>
    <script type="text/javascript" src="/assets/js/bar-chart.js" ></script>
    <script type="text/javascript" src="/assets/js/area-chart.js" ></script>
    <script type="text/javascript" src="/assets/js/area-chart-2.js" ></script>
    <script type="text/javascript" src="/assets/js/pie-chart.js" ></script>
    <script type="text/javascript" src="/assets/js/dougnnut-chart.js" ></script>
    
    <style type="text/css">
        #avatar {
            height : 48px;
            width : 48px;
            margin : 4px;
            float : left;
            display : inline-block;
        }

        #avatar img {
            width : 100%;
            height : 100%;
        }

        #name-and-mail { margin-top : 4px; }
        #name-and-mail #info {
            display : inline-block;
            color : white;
            margin : 6px 12px;
        }

        #name-and-mail #info #info-name { 
            font-size : 16px; 
            font-family : "Open Sans";
            margin-top : 4px;
            font-weight : bold;
        }

        #name-and-mail #info #info-mail { 
            font-size : 12px; 
            font-family : "Open Sans";
            margin-top : 2px;
            color : rgba(255, 255, 255, 0.7);
        }

        #navigation-menu {
            padding-top : 36px;
            padding-left : 8px;
        }

        .navigation-group-header {
            color : #727272;
            margin-bottom : 36px;
        }

        .navigation-item { 
            color : #212121;
            font-size : 16px;
            margin-top: 24px;
         }

        .navigation-item .material-icons {
            margin-top: -2px;
            margin-right: 24px;
            float: left;
        }

        .form-section-title {
            margin : 18px 10px;
            font-size : 16px;
            font-weight : bold;
        }

        .divider {
            height: 1px;
            width: 100%;
            background-color: #B6B6B6;
            margin : 24px 0px;
        }    

        .notification-dropdown {
            right: 66px;
            top: 42px !important;
            position: absolute;
            width: 360px !important;
            z-index: 100;
            display: none;
        }

        .notification-dropdown .card {
            margin-top: 0px;
            margin-bottom: 10px;
        }

        .notification-dropdown .card .card-content { padding : 16px; }

    </style>    
    
    <g:layoutHead/>
</head>
<body>
    <div id="topbar">
        <div id="logo">
            <span id="main"> PMRDA </span>
            <span id="sub"> [ Pune Metropolitan Region Development Authority ] </span>
        </div>
        <a class='dropdown-button topbar-icons' href='#' data-activates='account-actions'>
            <i class="material-icons md-light">more_vert</i>
        </a>
        <a class='dropdown-button topbar-icons' href='#' data-activates='notification-actions'>
            <i class="material-icons md-light">notifications</i>
        </a>
        <a class='topbar-icons' href='#'>
            <i class="material-icons md-light">account_box</i>
        </a>
        <ul id='account-actions' class='dropdown-content'>
            
        </ul>

        <div id='notification-actions' class='notification-dropdown card' style="background-color : #eee;">
            <div class="card-content">
                <div class="card">
                    <div class="card-content">
                        <div class="title-and-date">Chalan Approved</div>
                        <div class="text"> Your Chalan has been approved.</div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <div class="title-and-date">Chalan Approved</div>
                        <div class="text"> Your Chalan has been approved.</div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <div class="title-and-date">Chalan Approved</div>
                        <div class="text"> Your Chalan has been approved.</div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <div class="title-and-date">Chalan Approved</div>
                        <div class="text"> Your Chalan has been approved.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="overflow : hidden; margin-top : -72px;">
        <g:layoutBody/>
    </div>
    <div id="footer">
        <div style="margin-top: 10px;">
            About PMRDA &nbsp&nbsp &#124 &nbsp&nbsp Feedback &nbsp&nbsp &#124 &nbsp&nbsp Contact Us
            <span style="float : right;">&#169 2016 Bharat Digital Solutions Private Limited. All Rights Reserved</span>
        </div>
    </div>
</body>
</html>
