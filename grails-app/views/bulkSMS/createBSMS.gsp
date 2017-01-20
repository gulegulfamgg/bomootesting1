<!doctype html>
<html>
    <head>
        <title>BOMOO - Create SMS</title>
        <meta name="layout" content="admin">
        <style type="text/css">
            
        </style>
    </head>
    <body>
        <div class="notify-success" > SMS send successfully </div>
        <div class="div960">
            <div class="col-lg-6 col-md-12 col-sm-12">
                <h3> Birthday Wish SMS </h3><hr>
                <form id="form">
                    <input class="form-control" type="text" name="msg" id="msg" placeholder="Heading" multiple="" required="" />
                    <br/>
                    <input class="btn btn-primary" type="submit" name="submit" value="Submit" style="width: 100%; margin-top: 10px;" >
                </form>
            </div>
        </div>

        <script type="text/javascript">
            
            $('#form').on('submit', function(e) {
                e.preventDefault();
                var formData = new FormData(this);

                var str = formData.get('content');
                str = "<p>" + str.replace(/(?:\r\n|\r|\n)/g, '</p><p>') + "</p>";
                formData.set('content', str);

                $.ajax({
                    type:'POST',
                    url: "${g.createLink(controller:'BulkSMS', action:'sendSMS')}",
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

                        $('#title').val('');
                        
                    }
                });
            });
        </script>
    </body>
</html>
