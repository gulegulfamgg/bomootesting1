<!doctype html>
<html>
<head>
    <meta name="layout" content="other"/>
    <title>OCP - Admin Home</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <style type="text/css">
        .card { overflow: visible; }
        .grid path { stroke-width: 1; }
        .grid .tick {
            stroke: lightgrey;
            stroke-opacity: 0.7;
            shape-rendering: crispEdges;
        }

        .axis path,
        .axis line {
            fill: none;
            stroke: lightgrey;
            shape-rendering: crispEdges;
        }

        .axis { color : #727272; }
        .line { fill: none; stroke-width: 2px; }

        .line-submitted { stroke : blue; }
        .line-approved { stroke : red; }
        .line-paid { stroke : green;}

        text { font-size : 12px; }
    </style>
</head>
<body>
    <div class="row">
        <div class="col m6 16 offset-11 offset-m1">
            <div class="card" style="padding-top : 0px;">
                <ul class="tabs" style="border-bottom : 1px solid lightgrey; margin-bottom : 20px;">
                    <li class="tab col s6">
                        <a class="active" id="dailyAnchor" href="#">Weekly</a>
                    </li>
                    <li class="tab col s6">
                        <a class="" id="monthlyAnchor" href="#">Monthly</a>
                    </li>
                </ul>
                <div id="dailyTrend" style="height : 220px; overflow : visible;"></div>
                <div id="monthlyTrend" style="height : 220px; overflow : visible;"></div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {

            $.ajax({
                url:"${g.createLink(controller:'performance', action:'getData')}",
                success: function(r) {
                    drawChalanTrendChart("dailyTrend", r.submittedDaily, r.approvedDaily, r.paidDaily); 
                    drawChalanTrendChart("monthlyTrend", r.submittedMonthly, r.approvedMonthly, r.paidMonthly); 
                    $("#monthlyTrend").hide();
                }
            });
        });

        $("#dailyAnchor").click(function() {
            $("#monthlyTrend").fadeOut(120, function() {
                $("#dailyTrend").fadeIn(280);
            });
        });

        $("#monthlyAnchor").click(function() {
            $("#dailyTrend").fadeOut(120, function() {
                $("#monthlyTrend").fadeIn(280);
            });
        });
    </script>
</body>
</html>
