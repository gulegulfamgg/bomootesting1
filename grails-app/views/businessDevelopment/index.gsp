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
         <h3>Business Development </h3>
            <table id="irIssueTable" class="striped bordered highlight" >
                <thead>
                    <tr>
                        <th> # </th>
                        <th> Type </th>
                        <th> Message </th>
                        <th> Submmited BY</th>  
                        <th> Date </th>             
                    </tr>
                </thead>
                <tbody id="RequestTBody">
                    <g:each in="${flash.suggestion}" var="suggestion">
                        <tr data-suggestion-id="${flash.suggestion.id}" ><td>${flash.suggestion.id}</td><td>${flash.suggestion.category}</td><td>${flash.suggestion.suggestion}</td><td>${flash.suggestion.submittedBy.name}</td><td>${flash.suggestion.submittedOn}</td></tr>
                    </g:each>
                </tbody>
            </table>
        </div>

        
    </div>
    <script type="text/javascript">
        var zoneId = 0
        $("#zoneSelect").on("change", function() {
            zoneId = $(this).val();
            $.ajax({
                dataType : 'JSON',
                data : { zoneId : zoneId },
                url : "${g.createLink(controller:'IRIssue', action:'getIRIssue')}",
                success : function(r){
                    $('#RequestTBody').html('');
                    for(var i = 0; i < r.tr.length; i++){                   
                        $('#RequestTBody').append('<tr data-irissue-id="'+ r.tr[i].irissue.id +'" ><td>'+i+'</td><td>'+ r.tr[i].type+'</td><td>'+r.tr[i].msg+'</td><td>'+r.tr[i].submittedBy.name+' - '+r.tr[i].submittedOn+'</td></tr>');
                    }

                    $("#RequestTBody tr").on('click', rowClickEvent);
                    $("#RequestTBody tr td").on('contextmenu', rowRightClickEvent);
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
