<%@ page import="auth.*" %>
<%@ page import="ocp.*" %>

<!doctype html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <title>BOMOO - Transfer Request</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <style type="text/css">
        #main-content {  min-height : 640px; }
        td, th { 
            height: auto;
            width: auto;
            border: 1px solid black;
            padding: 5px 10px;
        }

        tr {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="row">
        <div class="col-lg-6 col-md-12 col-sm-12">
            <select id="zoneSelect">
                <option value="0" selected disabled> Select From Zone </option>
                <g:each in="${flash.zones}" var="zone">
                    <option value="${zone.id}"> ${zone.name} </option>
                </g:each>
            </select>

            <select id="branchSelect">
            </select>
            <br>
            <table id="transferRequestsTable" class="striped bordered highlight" >
                <thead>
                    <tr>
                        <th> # </th>
                        <th> Name </th>
                        <th> From </th>
                        <th> To</th>  
                        <th> Priority </th>                    
                        <th> Reason </th>           
                        <th> Status </th>           
                    </tr>
                </thead>
                <tbody id="RequestTBody"> </tbody>
            </table>
        </div>

        <div class="col-lg-3 col-md-12 col-sm-12">
            <table id="fromBranchTable" class="striped bordered highlight" >
                <thead>
                    <tr><th colspan="4"> From </th></tr>
                    <tr>
                        <th> # </th>
                        <th> Employee Name </th>
                        <th> Designation </th>      
                        <th> Contact No. </th>      
                    </tr>
                </thead>
                <tbody id="fromBranchBody"> </tbody>
            </table>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12">
            <table id="toBranchTable" class="striped bordered highlight" >
                <thead>
                    <tr><th colspan="4"> To </th></tr>
                    <tr>
                        <th> # </th>
                        <th> Employee Name </th>
                        <th> Designation </th>      
                        <th> Contact No. </th>      
                    </tr>
                </thead>
                <tbody id="toBranchBody"> </tbody>
            </table>
        </div>
        <div class="context-menu" style="display: none; background-color: black; color: white;">
            <p>Reject</p>
            <p>Approve</p>
            <p>Consider Later</p>
        </div>
    </div>
    <script type="text/javascript">
        var zoneId = 0
        $("#zoneSelect").on("change", function() {
            zoneId = $(this).val();
            $.ajax({
                dataType : 'JSON',
                data : { zoneId : zoneId },
                url : "${g.createLink(controller:'TransferRequestManagement', action:'getBranchList')}",
                success: function(r) {
                    $('#branchSelect').html('');
                    $('#branchSelect').append('<option value="" selected disabled> Select Branch </option>');
                    $('#branchSelect').append('<option value="0"> All </option>');

                    for(var i = 0; i < (r.branches).length; i++) {
                        $("#branchSelect").append('<option value="'+ r.branches[i].id +'">'+ r.branches[i].code +' : '+ r.branches[i].name +'</option>');
                    }
                }
            });
        });

        $('#branchSelect').on('change', function(){
            var branchId = $(this).val();
            $.ajax({
                dataType : 'JSON',
                data : {branchId : branchId, zoneId : zoneId},
                url : "${g.createLink(controller:'TransferRequestManagement', action:'getTransferRequest')}",
                success : function(r){
                    $('#RequestTBody').html('');
                    for(var i = 0; i < r.tr.length; i++){                   
                        $('#RequestTBody').append('<tr data-employee-id="'+ r.tr[i].employee.id +'" ><td>'+i+'</td><td>'+ r.tr[i].employee.name+'</td><td>'+r.tr[i].fromBranch.name+'</td><td>'+r.tr[i].toZone.name+' - '+r.tr[i].toBranch.name+'</td><td>'+r.tr[i].priority+'</td><td>'+r.tr[i].reason+'</td><td>'+r.tr[i].status+'</td></tr>');
                    }

                    $("#RequestTBody tr").on('click', rowClickEvent);
                    $("#RequestTBody tr td").on('contextmenu', rowRightClickEvent);
                }
            });
        });

        function rowClickEvent() {
            var empId = $(this).data("employee-id");
            $.ajax({
                dataType : 'JSON',
                data : {empId : empId},
                url : "${g.createLink(controller:'TransferRequestManagement', action:'getBranchDetails')}",
                success : function(r){
                    console.log(r)
                    $('#fromBranchBody').html('');
                    for(var i = 0; i < r.fromUsers.length; i++){                   
                        $('#fromBranchBody').append('<tr><td>'+i+'</td><td>'+ r.fromUsers[i].name +'</td><td>'+ r.fromUsers[i].designation +'</td><td>'+ r.fromUsers[i].contactNo +'</td></tr>');
                    }

                    $('#toBranchBody').html('');
                    for(i = 0; i < r.toUsers.length; i++){                   
                        $('#toBranchBody').append('<tr><td>'+i+'</td><td>'+ r.toUsers[i].name +'</td><td>'+ r.toUsers[i].designation +'</td><td>'+ r.toUsers[i].contactNo +'</td></tr>');
                    }
                }
            });
        }

        function rowRightClickEvent(e) {
            e.preventDefault();
            $(".context-menu").css({
                display: "block",
                position: "absolute",
                left: e.pageX + "px",
                top: e.pageY + "px"
            });

            $(".context-menu").show();
        }
    </script>
</body>
</html>
