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
    <style type="text/css">
            nav {
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            .carousel img {
                height: 330px !important;
                width: 960px !important;
            }

            #about-us-sub    {
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

            #gallery-sub {
                display: none;
                position: absolute;
                top: 50px;
                left: -300px;
                width: 760px;
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

            .mi {
                width: 100%;
                padding: 10px 10px;
                border-bottom: 1px solid #dfdfdf;
            }

            .mi:hover { 
                background-color: orange;
                cursor: pointer; 
            }

            .nav-menu-item:hover { background-color: orange; }
            .nav-menu-item > div a {
                text-decoration: none !important;
                color: black !important; 
            }
            
            #gallery-sub { padding: 2px; }

            td { 
                height: 150px; 
                width: 300px; 
                border: 5px solid white; 
                border-collapse: collapse;
            }

            td img { height : 100%; width: 100%; }
        </style>
     
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
            <div class="div960">
                <div class="row" style="margin-top: 0px;">
                    <div class="col-sm-3 col-md-3 col-lg-3"> 
                        <p class="coloumn-heading">Quick Find</p>
                        <p><a target="_blank" href="http://nobw.co.in/">NOBW</a></p>
                        <p><a target="_blank" href="http://www.labour.nic.in/">Ministry of Labour</a></p>
                        <p><a target="_blank" href="http://www.finmin.nic.in/">Ministry Of Finance</a></p>
                        <p><a target="_blank" href="http://www.bms.org.in/">Bhartiya Mazdoor Sangh</a></p>
                        <p><a target="_blank" href="http://www.iba.org.in/">Indian Banks Association</a></p>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3"> 
                        <p class="coloumn-heading">Explore BOM</p>
                        <p><a target="_blank" href="http://www.bankofmaharashtra.in/">Bank Of Maharashtra</a></p>
                        <p><a target="_blank" href="https://www.mahaconnect.in/jsp/index.html">BOM Internet Banking</a></p>
                        <p><a target="_blank" href="https://www.mahaconnect.in/jsp/ContactUs.html">BOM Customer Care</a></p>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3"> 
                        <p class="coloumn-heading">Explore BOMOO</p>
                        <p><a href="#about-us">History of BOMOO</a></p>
                        <p><a href="#">Facilities and Benefits</a></p>
                        <p><a href="#">Publication and Training</a></p>
                        <p><a href="#">Achivements and Milestones</a></p>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3">
                        <div class="social-button fb" data-location="https://www.facebook.com/BOMOO-594355733912964/"> <span class="fa fa-facebook"></span> </div>
                        <div class="social-button twitter" data-location="https://twitter.com/bomoo" >  <span class="fa fa-twitter"></span> </div>
                        <div class="social-button google-plus"> <span class="fa fa-google-plus"></span> </div>
                        <div class="social-button linked-in"> <span class="fa fa-linkedin-square"></span> </div>

                        <asset:image class="google-play-button" src="en_badge_web_generic.png" alt="bomoo"/>
                    </div>
                </div>
            </div>
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
