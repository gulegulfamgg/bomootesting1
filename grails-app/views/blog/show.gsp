<!doctype html>
<html>
    <head>
        <title><g:if env="development">BOMOO</g:if><g:else>Error</g:else></title>
        <meta name="layout" content="site">
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

            #about-us-sub {
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
            #gallery-sub { padding: 2px; }

            td { 
                height: 150px; 
                width: 300px; 
                border: 5px solid white; 
                border-collapse: collapse;
            }

            td img { height : 100%; width: 100%; }
        </style>
    </head>
    <body>
        <div class="div960">
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                <h2>${flash.blog.title}</h2>
                <p class="lead"> by <a href="#">${flash.blog.postedBy.name}</a> </p> <hr>
                <p><span class="glyphicon glyphicon-time"></span> Posted on ${flash.blog.postedOn}</p> <hr>

                <img src="${createLink(controller:'Site', action:'getImage', params:[id: flash.blog.img.id])}" width="400px" height="300px" /> <hr>
                <div style="font-size: 17px; font-family: NotoSans;">
                    ${flash.blog.content}
                </div>
            </div>
            <div class="col-lg-3" style="font-size: 18px;">
                <h3 style="margin-left: 0px;"> Recent Blogs </h3> <hr/>
                <ul class="list-styled" style="margin-left: 0px;" >
                </ul>   
            </div>
        </div>
    </body>
</html>
