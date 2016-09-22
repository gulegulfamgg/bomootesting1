<%@ page import="auth.*" %>

<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>OCP - Home</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <g:render template="sidebarTemplate" />
    <div class="col m9 19" style="padding-right : 30px;">
        <div class="card">
            <div class="card-content">
                <table>
                    <thead>
                        <tr>
                            <th> Chalan Id </th>
                            <th> Submitted On</th>
                            <th> Approved On</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${chalans}" var="chalan">
                        <tr>
                            <td> ${chalan.id} </td>
                            <td> <g:cleanDate date="${chalan.submittedOn}" /> </td>
                            <td> <g:cleanDate date="${chalan.approvedByTPOn}" /> </td>
                            <td> <button class="waves-effect waves-light btn-flat">Pay</button> </td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
      
    </script>
</body>
</html>
