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
                <h3> Create Event </h3><hr>
                <form id="form">
                    <input class="form-control" type="text" name="title" id="title" placeholder="Heading" />
                    <textarea class="form-control" id="content" name="content" placeholder="Description" style="width: 100%; height: 100px; resize:vertical;"></textarea>
                    <div id="add-image-div">
                        <input class="form-control" type="file" name="image1" id="image1" data-target="1" onchange="readURL(this);" />
                    </div>
                    <button class="btn" id="add-image" style="width: 48%; margin-top: 10px; float: left;"> Add Image </button>
                    <input class="btn btn-primary" type="submit" name="submit" value="Submit" style="width: 48%; float: right; margin-top: 10px;" >
                </form>
            </div>
            <div class="col-lg-6 col-md-12 col-sm-12">
                <h3>Preview</h3><hr>
                <div id="preview-window" style="font-family: NotoSans; width: 100%; border: 1px solid #aaa; padding: 10px; border-radius: 2px;">
                    <h4>Heading</h4>
                    <content>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quid Zeno? Quis enim redargueret? Obsecro, inquit, Torquate, haec dicit Epicurus? Duo Reges: constructio interrete. An haec ab eo non dicuntur? Qualem igitur hominem natura inchoavit. </p>
                    </content>
                    <table style="width : 100%">
                        <tr>
                            <td rowspan="2" id="td1" valign="top"> <img style="height: 198px;" src="images/num/1.jpg"> </td>
                            <td id="td2"> <img src="images/num/2.jpg"> </td>
                            <td id="td3"> <img src="images/num/3.jpg"> </td>
                        </tr>
                        <tr>
                            <td id="td4"> <img src="images/num/4.jpg"> </td>
                            <td id="td5"> <img src="images/num/5.jpg"> </td>
                        </tr>
                        <tr>
                            <td id="td6"> <img src="images/num/6.jpg"> </td>
                            <td id="td7"> <img src="images/num/7.jpg"> </td>
                            <td id="td8" rowspan="2" valign="top"> <img style="height: 198px;" src="images/num/8.jpg"> </td>
                        </tr>
                        <tr>
                            <td id="td9"> <img src="images/num/9.jpg"> </td>
                            <td id="td10"> <img src="images/num/10.jpg"> </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var imgNum = 1;

            $("#title").on('change', function() {
                var h = $(this).val()
                $("#preview-window h4").html(h);
            });

            $("#sub-heading").on('change', function() {
                var h = $(this).val()
                $("#preview-window h5").html(h);
            });

            $("#content").keyup(function(e) {
                if(e.keyCode == 13) {
                    var str = $(this).val()
                    str = "<p>" + str.replace(/(?:\r\n|\r|\n)/g, '</p><p>') + "</p>";
                    $("#preview-window content").html(str);
                }
            });

            $("#add-image").click(function(e){
                e.preventDefault();
                if (imgNum < 10) {
                    imgNum++;
                    $("#add-image-div").append('<input class="form-control" type="file" name="image' + imgNum +'" id="image' + imgNum +'" data-target="' + imgNum +'" onchange="readURL(this);" />');
                }
                else {
                    alert("Maximum 10 images are permitted for each image");
                }
            });

            function readURL(input) {
                var target = $(input).data("target");
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#preview-window #td'+ target +' img').attr('src', e.target.result)
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            };

            $('#form').on('submit', function(e) {
                e.preventDefault();
                var formData = new FormData(this);
                
                var str = formData.get('content');
                str = "<p>" + str.replace(/(?:\r\n|\r|\n)/g, '</p><p>') + "</p>";
                formData.set('content', str);

                $.ajax({
                    type:'POST',
                    url: "${g.createLink(controller:'Event', action:'saveEvent')}",
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
                        $('#sub-heading').val('');
                        $('#blog-header-image').val('');
                        $('#content').val('');
                        $('#add-image-div').html('');
                        $('#add-image-div').html('<input class="form-control" type="file" name="image1" id="image1" data-target="1" onchange="readURL(this);" />');
                        imgNum = 1;

                        
                        $('#preview-window').html('');
                        $('#preview-window').html('<h4>Heading</h4><content><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quid Zeno? Quis enim redargueret? Obsecro, inquit, Torquate, haec dicit Epicurus? Duo Reges: constructio interrete. An haec ab eo non dicuntur? Qualem igitur hominem natura inchoavit. </p></content><table style="width : 100%"><tr><td rowspan="2" id="td1" valign="top"> <img style="height: 198px;" src="images/num/1.jpg"> </td><td id="td2"> <img src="images/num/2.jpg"> </td><td id="td3"> <img src="images/num/3.jpg"> </td></tr><tr><td id="td4"> <img src="images/num/4.jpg"> </td><td id="td5"> <img src="images/num/5.jpg"> </td></tr><tr><td id="td6"> <img src="images/num/6.jpg"></td><td id="td7"> <img src="images/num/7.jpg"> </td><td id="td8" rowspan="2" valign="top"> <img style="height: 198px;" src="images/num/8.jpg"> </td></tr><tr><td id="td9"> <img src="images/num/9.jpg"> </td><td id="td10"> <img src="images/num/10.jpg"> </td></tr></table>');
                    }
                });
            });
        </script>
    </body>
</html>
