<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="BOMOO"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="site.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="bootstrap.min.js"/>
         
    <g:layoutHead/>
</head>
<body>
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="div960">
            <ul id='account-actions' class='dropdown-content'>
                <li><g:link controller="logoff">Log Out</g:link></li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="#" style="color: black; background-color: #eee;"> Home </a>
                </li>
                <li class="nav-menu-item" data-target="about-us-sub">
                    <a href="#" style="color: white;"> About us </a>
                    <div id="about-us-sub">
                        <div class="mi">Founder</div>
                        <div class="mi">History</div>
                        <div class="mi">Management</div>
                        <div class="mi">Publications</div>
                        <div class="mi">Tribute</div>
                    </div>
                </li>
                <li class="nav-menu-item">
                    <a href="bulletin.html" style="color: white;"> Bulletin </a>
                </li>
                <li class="nav-menu-item">
                    <a href="notice.html" style="color: white;"> Notice </a>
                </li>
                <li class="nav-menu-item">
                    <a href="blog.html" style="color: white;"> Blog </a>
                </li>
                <li class="nav-menu-item" data-target="gallery-sub">
                    <a href="#" style="color: white;"> Gallery </a>
                    <div id="gallery-sub">
                        <table style="width : 100%">
                            <tr>
                                <td rowspan="2" valign="top"> <asset:image src="gallery/6.jpg" style="height: 295px;"/> </td>
                                <td> <asset:image src="gallery/1.jpg"/> </td>
                                <td> <asset:image src="gallery/2.jpg"/> </td>
                            </tr>
                            <tr>
                                <td> <asset:image src="gallery/3.jpg"/> </td>
                                <td> <asset:image src="gallery/4.jpg"/> </td>
                            </tr>
                            <tr>
                                <td> <asset:image src="gallery/5.jpg"/> </td>
                                <td> <asset:image src="gallery/8.jpg"/> </td>
                                <td> <asset:image src="gallery/7.jpg"/></td>
                            </tr>
                        </table>
                        <div style="text-align: center; padding: 3px 0 6px 0;">
                            <a href="" style="text-decoration: none;">View gallery</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    
        <g:layoutBody/>
    
</body>
</html>
