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
			
			td { 
				height: 200px; 
				width: 300px; 
				border: 5px solid #fff; 
			    border-collapse: collapse;
			}

			td img { height : 100%; width: 100%; border: 1px solid black; }
		</style>
    </head>
    <body>
    	<div class="div960">
			<h2 style="margin: 15px 5px;"> BOMOO - From the Lens </h2>
	        <div id="gallery-random">
				<table style="width : 100%">
				  	<tr>
				    	<td rowspan="2" valign="top"> 
				    		<asset:image src="gallery/10.jpeg" style="height: 395px;"/>
				    	</td>
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
				    	<td rowspan="2" valign="top">
				    		<asset:image src="gallery/6.jpg" style="height: 395px;"/>
				    	</td>
				  	</tr>
				  	<tr>
				    	<td rowspan="2" colspan="2" valign="top"> 
				    		<asset:image src="gallery/9.jpg" style="height: 395px;"/> 
				    	</td>
				  	</tr>
				  	<tr>
				  		<td> <asset:image src="gallery/7.jpg"/> </td>
				  	</tr>
				</table>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				console.log($(window).innerHeight())
				$("#about-us-sub").hide();
			});

			$(".nav-menu-item").mouseenter(function() {
				var s = $(this).data("target");
				$("#" + s).show();
			});

			$(".nav-menu-item").mouseleave(function() {
				var s = $(this).data("target");
				$("#" + s).hide();
			});

			$("#gallery-random img").on('click', function() {
				console.log("img clicked");
				var s = $(this).attr("src");
				console.log(s);

				$("#display-image").attr("src", s);
				$(".notification-background").fadeIn(500);
			});
		</script>
    </body>
</html>
