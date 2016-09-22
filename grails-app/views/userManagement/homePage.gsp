<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>OCP - Home</title>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
        <style type="text/css">

        	#tableCard {
        		background-color : white;
        		margin-bottom : 20px;
        		border-radius : 2px;
    			box-shadow : 0px 1px 1px rgba(0, 0, 0, 0.3);
    			padding : 0px;
        	}

        	.tableHead {
        		padding : 15px 20px 0px;
        		font-size : 20px; 	
        		font-family : "Open Sans";
        	}

        	td {  padding : 12px !important; 	}

        	td.deleteCell { 
        		padding : 0px !important;
        	}

        	.deleteCell button { 
        		height : 145%;
        		width : 100%;
        		margin : 0px;
        	}

        	#userList_filter {
        		color : white;
        		margin-top : -48px;
        		margin-right : 20px; 
        	}

        	#userList_filter input {
        		border : none;
        		font-weight : normal;
        		color : black;
        		padding : 2px 6px;
        		text-align : right;
        	}

        	#userList_filter input:focus {	outline: none; 	}
        	#userList_paginate {
        		margin : 12px;
        	}
        	
        	.half { 
        		width : 49%; 
        		display : inline-block;
        	}

        </style>
    </head>
    <body>
    	<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
    		<div class="card">
    			<div class="card-head">
	    			<p>Create New Employee</p>
	    		</div>
	    		<div class="card-form">
		    		<input class="card-input" placeholder="Enter Username" type="text" name="username" id="username" />
	    			<input class="card-input" placeholder="Enter Email Id" type="email" name="email" id="email" />
		    		<input class="card-input half" placeholder="Enter Firstname" type="text" name="firstname" id="firstname" />
		    		<input class="card-input half" placeholder="Enter Lastname" type="text" name="lastname" id="lastname" />
		    		<select class="card-input" >
	    				<option disabled="true"> Select Employee Type</option>
	    				<option> ATP </option>
	    				<option> TP </option>
	    				<option> Banker </option>
	    			</select>
	    			<button class="submit-btn ripple flat-ripple-btn" id="createUserBtn" data-ripple-color="#000">Create</button>
    			</div>
    		</div>
    	</div>
    	<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
	    	<div class="card">
	    		<div class="card-head">
	    			<p>Employees</p>
	    		</div>
		        <table id="userList" class="table">
					<thead>
						<tr>
							<th> # </th>
							<th> Name </th>
							<th> Username </th>
							<th> Email Id </th>
							<th> Designation </th>
							<th> </th>
						</tr>
					</thead>
					<tbody id="userListListBody">
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td> Shashank Goyal </td>
							<td> ShashankG </td>
							<td> shashank@turingsolutions.com </td>
							<td> TP </td>
							<td class="deleteCell" style="padding : 0px !important;">
								<button class="ripple flat-ripple-btn" data-ripple-color="#000">
									<span class="glyphicon glyphicon-trash"></span> 
								</button>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
        <script type="text/javascript">	
        	$(document).ready(function() {
        		$('#userList').dataTable({
	        		"lengthChange": false,
	        		"info": false
        		});

        		$('#userList_filter').find('input').attr("placeholder", "Search Employees");
        	});

        	$("#createUserBtn").on("click", function(){

        	});
        </script>
    </body>
</html>
