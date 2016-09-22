<!doctype html>
<html>
<head>
    <meta name="layout" content="other"/>
    <title>OCP - Home</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <style type="text/css">
        #main-content {  min-height : 240px; }
        #avatar {
            height : 48px;
            width : 48px;
            margin : 4px;
            float : left;
            display : inline-block;
        }

        #avatar img {
            width : 100%;
            height : 100%;
        }

        #name-and-mail { margin-top : 4px; }
        #name-and-mail #info {
            display : inline-block;
            color : white;
            margin : 6px 12px;
        }

        #name-and-mail #info #info-name { 
            font-size : 16px; 
            font-family : "Open Sans";
            margin-top : 4px;
            font-weight : bold;
        }

        #name-and-mail #info #info-mail { 
            font-size : 12px; 
            font-family : "Open Sans";
            margin-top : 2px;
            color : rgba(255, 255, 255, 0.7);
        }

        #navigation-menu {
            padding-top : 36px;
            padding-left : 8px;
        }

        .navigation-group-header {
            color : #727272;
            margin-bottom : 36px;
        }

        .navigation-item { 
            color : #212121;
            font-size : 16px;
            margin-top: 24px;
         }

        .navigation-item .material-icons {
            margin-top: -2px;
            margin-right: 24px;
            float: left;
        }

        .form-section-title {
            margin : 18px 10px;
            font-size : 16px;
            font-weight : bold;
        }

        .divider {
            height: 1px;
            width: 100%;
            background-color: #B6B6B6;
            margin : 24px 0px;
        }

        .collapsible-body { padding : 24px; }
        .abc {
            margin-bottom : 16px;
            font-size : 16px;
            font-weight : bold;
        }

        .xyz { float : left; margin-right : 20px; }
        .pqr { padding-top : 2px; }
        .hij { margin-bottom : 16px; }

        .floatright { float : right; }
        .floatleft { float : left; }
    </style>
</head>
<body>
    <div class="row">
        <div class="col m10 110 offset-m1 offset-l1" style="">
            <g:each in="${chalans}" var="month">
                <g:each in="${chalans[month.key]}" var="date">
                    <p style="font-size : 16px; margin-left : 36px;" > ${date.key} <g:getMonth month="${month.key}" /> </p>
                    <ul class="collapsible popout" id="" data-collapsible="accordion">
                        <g:each in="${chalans[month.key][date.key]}" var="chalan">
                            <li>
                                <div class="collapsible-header">
                                    <span> <b> Scrutiny Chalan : </b> ${chalan.depositorFirstName} ${chalan.depositorMiddleName} ${chalan.depositorLastName} </span>
                                    <span style="float : right;" > <g:cleanDate date="${chalan.submittedOn}" /> </span>
                                </div>
                                <div class="collapsible-body">
                                    <div class="row" >
                                        <div class="col m6 l6">
                                            <div class="abc" >Depositor Details</div>
                                            <div class="hij" > 
                                                <i class="xyz material-icons md-dark">account_circle</i>
                                                <div class="pqr" > ${chalan.depositorFirstName} ${chalan.depositorMiddleName} ${chalan.depositorLastName} </div>
                                            </div>
                                            <div class="hij" > 
                                                <i class="xyz material-icons md-dark">phone</i>
                                                <div class="pqr" > ${chalan.depositorContantNum} </div>
                                            </div>
                                            <div class="hij" > 
                                                <i class="xyz material-icons md-dark">mail_outline</i>
                                                <div class="pqr" > ${chalan.depositorEmail} </div>
                                            </div>
                                            <div class="hij" > 
                                                <i class="xyz material-icons md-dark">home</i>
                                                <div class="pqr" > ${chalan.depositorAddress} </div>
                                            </div>
                                        </div>
                                        <div class="col m6 l6">
                                            <div class="abc" >Architect Details</div>
                                            <div class="hij" > 
                                                <i class="xyz material-icons md-dark">account_circle</i>
                                                <div class="pqr" > ${chalan.architectFirstName} ${chalan.architectMiddleName} ${chalan.architectLastName} </div>
                                            </div>
                                            <div class="hij" > 
                                                <i class="xyz material-icons md-dark">phone</i>
                                                <div class="pqr" > ${chalan.architectContactNum} </div>
                                            </div>
                                            <div class="hij" > 
                                                <i class="xyz material-icons md-dark">mail_outline</i>
                                                <div class="pqr" > ${chalan.architectEmail} </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="overflow : hidden;">
                                        <g:form controller="ChalanReview" action="approveChalan" >
                                            <input type="hidden" name="chalanId" value="${chalan.id}">
                                            <input type="submit" name="rejected" class="waves-effect btn-flat floatright" value="Reject" style="margin-left : 10px;">
                                            <input type="submit" name="approved" class="waves-effect btn-flat floatright" value="Approve">
                                        </g:form>
                                    </div>
                                </div>
                            </li>
                        </g:each>
                    </ul>
                </g:each>
            </g:each>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('.collapsible').collapsible({
              accordion : false 
            });
        });
    </script>
</body>
</html>
