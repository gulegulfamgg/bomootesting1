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
    <div class="notify-success" > Messagelog was created successfully </div>
       <div class="div960">
            <div class="col-lg-6 col-md-12 col-sm-12">
                <h3> Create Message </h3><hr>
                <form id="form">
                    <textarea class="form-control" id="content" name="content" style="width: 100%; height: 300px; resize:vertical;" placeholder="Message"></textarea>
                    <input class="btn btn-primary" type="submit" name="submit" value="Submit" style="width: 100%; margin-top: 10px;" >
                </form>
            </div>
            <div class="col-lg-6 col-md-12 col-sm-12">
                <h3>Preview</h3><hr>
                <div id="preview-window" style="font-family: NotoSans; width: 100%; border: 1px solid #aaa; padding: 10px; border-radius: 2px;">
                    <content>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quid Zeno? Quis enim redargueret? Obsecro, inquit, Torquate, haec dicit Epicurus? Duo Reges: constructio interrete. An haec ab eo non dicuntur? Qualem igitur hominem natura inchoavit? </p>
                        <p>Summum a vobis bonum voluptas dicitur. Quorum altera prosunt, nocent altera. Peccata paria. Utilitatis causa amicitia est quaesita. </p>
                        <p>Praeteritis, inquit, gaudeo. Immo alio genere; Praeteritis, inquit, gaudeo. Cur id non ita fit? Minime vero istorum quidem, inquit. </p>
                        <p>Eam stabilem appellas. Sed tamen intellego quid velit. Quid enim? Quare attende, quaeso. Quibus ego vehementer assentior. Quid de Pythagora? </p>
                    </content>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $("#content").keyup(function(e) {
                if(e.keyCode == 13) {
                    var str = $(this).val()
                    str = "<p>" + str.replace(/(?:\r\n|\r|\n)/g, '</p><p>') + "</p>";
                    $("#preview-window content").html(str);
                }
            });

            $('#form').on('submit', function(e) {
                e.preventDefault();
                var formData = new FormData(this);
                    
                var str = formData.get('content');
                str = "<p>" + str.replace(/(?:\r\n|\r|\n)/g, '</p><p>') + "</p>";
                formData.set('content', str);

                $.ajax({
                    type:'POST',
                    url: "${g.createLink(controller:'Message', action:'saveMessage')}",
                    data: formData,
                    async: true,
                    cache:false,
                    contentType: false,
                    processData: false,
                    success:function(data) {
                       $(".notify-success").slideDown();
                        
                        setTimeout(function() {
                            $(".notify-success").fadeOut();
                        }, 3000);

                        
                        $('#content').val('');
                        
                        $('#preview-window').html('');
                        $('#preview-window').html('<content><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quid Zeno? Quis enim redargueret? Obsecro, inquit, Torquate, haec dicit Epicurus? Duo Reges: constructio interrete. An haec ab eo non dicuntur? Qualem igitur hominem natura inchoavit? </p><p>Summum a vobis bonum voluptas dicitur. Quorum altera prosunt, nocent altera. Peccata paria. Utilitatis causa amicitia est quaesita. </p><p>Praeteritis, inquit, gaudeo. Immo alio genere; Praeteritis, inquit, gaudeo. Cur id non ita fit? Minime vero istorum quidem, inquit. </p><p>Eam stabilem appellas. Sed tamen intellego quid velit. Quid enim? Quare attende, quaeso. Quibus ego vehementer assentior. Quid de Pythagora? </p></content>');
                    }
                });
            });
        </script>
    </body>
</html>
