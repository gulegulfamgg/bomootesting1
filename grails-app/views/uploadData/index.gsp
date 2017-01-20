<!doctype html>
<html>
    <head>
        <title><g:if env="development">BOMOO</g:if><g:else>Error</g:else></title>
        <meta name="layout" content="admin">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
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

            td { 
                height: 100px;
                width: 200px;
                border: 2px solid #000;
                vertical-align: middle;
                text-align: center;
            }

            td img {
                width: 100%;
                height: 100%;
            }

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
        </style>
    </head>
    <body>
        <div class="notify-success" > Event was created successfully </div>
       <div class="div960">
            <div class="col-lg-6 col-md-12 col-sm-12">
                <h3> Upload User Data </h3><hr>
                <g:if test="${flash.msg}"><div class="message" role="status">${flash.msg}</div></g:if>
                <g:uploadForm action="saveUser">
                    <fieldset class="form">
                        <input type="file" name="file" />
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="doUpload" value="Upload" />
                    </fieldset>
                </g:uploadForm>
            </div>
        </div>

    </body>
</html>
