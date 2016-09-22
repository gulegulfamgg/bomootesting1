<!doctype html>
<html>
    <head>
        <meta name="layout" content="login"/>
        <title>OCP - User Management</title>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico" /> 
    </head>
    <body>
        <input type="text" name="username" id="username" />

        <table id="userList" class="table">
			<thead>
				<tr>
					<th> # </th>
					<th> Username </th>
					<th> Designation </th>
				</tr>
			</thead>
			<tbody id="userListListBody">
				<tr>
					<td> 1 </td>
					<td> Shashank Goyal </td>
					<td> TP </td>
				</tr>
				<tr>
					<td> 1 </td>
					<td> Shashank Goyal </td>
					<td> TP </td>
				</tr>
				<tr>
					<td> 1 </td>
					<td> Shashank Goyal 2 </td>
					<td> TP </td>
				</tr>
			</tbody>
		</table>
        <script type="text/javascript">
        	$(document).ready(function(){
        		$('#userList').DataTable();
        	});
        </script>
    </body>
</html>
