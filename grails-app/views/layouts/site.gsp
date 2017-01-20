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
    <asset:stylesheet src="font-awesome.min.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:stylesheet src="site.css"/>
    
    <g:layoutHead/>
</head>
<body>
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="div960">
            <ul class="nav navbar-nav">
                <li class="active">
                    <g:link controller="site" style="color: black; background-color: #eee;" action="index">Home</g:link>
                </li>
                <li class="nav-menu-item" data-target="about-us-sub">
                    <a href="#" style="color: white;"> About us </a>
                    <div id="about-us-sub">
                        <g:link controller="site" action="founder"><div class="mi">Founder</div></g:link>
                        <g:link controller="site" action="history"><div class="mi">History</div></g:link>
                        <g:link controller="site" action="management"><div class="mi">Management</div></g:link>
                        <g:link controller="site" action="publication"><div class="mi">Publication</div></g:link>
                        <g:link controller="site" action="tribute"><div class="mi">Tribute</div></g:link>
                    </div>
                </li>
                <li class="nav-menu-item">
                    <g:link controller="site" style="color: white;" action="bulletin">Bulletin</g:link>
                </li>
                <li class="nav-menu-item">
                    <g:link controller="site" style="color: white;" action="notice">Notice</g:link>
                </li>
                <li class="nav-menu-item">
                    <g:link controller="site" style="color: white;" action="blog">Blog</g:link>
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
                            <g:link controller="site" action="gallery">View Gallery</g:link>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div>
        <g:layoutBody/>
    </div>
    <footer>
        <div style="width: 100%; margin-top: 15px; border-top-style: solid; border-width: 1px; border-color: #333; "></div>
        <div style="width: 960px; margin-right: auto; margin-left: auto;">
            <div class="row" style="margin-top: 10px; color:#666 !important;">
                <a href="#about-us">About BOMOO</a> &nbsp&nbsp | &nbsp&nbsp 
                <a href="">Sitemap</a> &nbsp&nbsp | &nbsp&nbsp 
                <a href="">Feedback</a> &nbsp&nbsp | &nbsp&nbsp 
                <a href="">Contact Us</a>
                <p class="pull-right"><a href="" style="color: #666;">&#169 2016 BIoT Solutions LLP. All Rights Reserved</a></p>
            </div>
        </div>
    </footer>
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
