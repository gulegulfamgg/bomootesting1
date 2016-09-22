<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
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
    </style>
</head>
<body>
    <div class="col m3 l3" style="position : relative;">
        <div id="name-and-mail">
            <div id="avatar">
                <asset:image src="avatar-man.png" />
            </div>
            <div id="info">
                <div id="info-name"> Shashank Goyal </div>
                <div id="info-mail"> shashank@turingsolutions.com </div>
            </div>
        </div>
        <div id="navigation-menu">
            <div class="navigation-group-header">CHALAN</div>

            <div class="navigation-item">
                <i class="material-icons md-dark">description</i>
                Scrutiny
            </div>
            <div class="navigation-item">
                <i class="material-icons md-dark">insert_drive_file</i>
                SomeOtherOne
            </div>
            <div class="navigation-item">
                <i class="material-icons md-dark">location_city</i>
                AnotherOne
            </div>
            <div class="navigation-item">
                <i class="material-icons md-dark">poll</i>
                DifferentOne
            </div>
            <div class="navigation-item">
                <i class="material-icons md-dark">apps</i>
                More Chalans
            </div>
            <div class="divider" ></div>
            <div class="navigation-group-header">CHALAN STATUS</div>

            <div class="navigation-item">
                <i class="material-icons md-dark">assignment_turned_in</i>
                Approved
            </div>
            <div class="navigation-item">
                <i class="material-icons md-dark">low_priority</i>
                Pending
            </div>
            <div class="navigation-item">
                <i class="material-icons md-dark">delete_forever</i>
                Rejected
            </div>
        </div>
    </div>
    <div class="col m9 19" style="padding-right : 30px;">
        <div class="card" id="main-content">
            <g:form controller="chalan" action="saveChalan" >
                <div class="card-content">
                    <span class="card-title">Scrutiny Form</span>
                    <div class="row">
                        <div class="col s12">
                            <div class="form-section-title">Depositor Details</div>
                            <div class="row">
                                <div class="input-field col s4">
                                    <input id="first_name" type="text" class="validate">
                                    <label for="first_name">First Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="middle_name" type="text" class="validate">
                                    <label for="middle_name">Middle Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="last_name" type="text" class="validate">
                                    <label for="last_name">Last Name</label>
                                </div>
                            </div>
                          
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="address" type="text" class="validate">
                                    <label for="address">Address</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s4">
                                    <input id="contact_number" type="text" class="validate">
                                    <label for="contact_number">Contact no.</label>
                                </div>
                                <div class="input-field col s8">
                                    <input id="email" type="email" class="validate">
                                    <label for="email">Email</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s4">
                                    <input id="cts_number" type="number" class="validate">
                                    <label for="cts_number">CTS No.</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="village" type="text" class="validate">
                                    <label for="village">Village</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="taluka" type="text" class="validate">
                                    <label for="taluka">Taluka</label>
                                </div>
                            </div>
                            <div class="form-section-title">Architect Details</div>
                            <div class="row">
                                <div class="input-field col s4">
                                    <input id="first_name" type="text" class="validate">
                                    <label for="first_name">First Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="middle_name" type="text" class="validate">
                                    <label for="middle_name">Middle Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="last_name" type="text" class="validate">
                                    <label for="last_name">Last Name</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s4">
                                    <input id="contact_number" type="text" class="validate">
                                    <label for="contact_number">Contact no.</label>
                                </div>
                                <div class="input-field col s8">
                                    <input id="email" type="email" class="validate">
                                    <label for="email">Email</label>
                                </div>
                            </div>
                            
                            <div class="form-section-title">Other Details</div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <select>
                                        <option value="" disabled selected>Select ATP</option>
                                        <option value="1">Gulfam Pradhan</option>
                                        <option value="2">Shashank Goyal</option>
                                        <option value="3">Suyash Tirole</option>
                                    </select>
                                    <label>ATP</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s3">
                                    <input id="residential_area" type="text" class="validate">
                                    <label for="residential_area">Residential Area</label>
                                </div>
                                <div class="input-field col s3">
                                    <input id="commercial_area" type="text" class="validate">
                                    <label for="commercial_area">Commercial Area</label>
                                </div>
                                <div class="input-field col s3">
                                    <input id="residential_builtup" type="text" class="validate">
                                    <label for="residential_builtup">Residential Builtup</label>
                                </div>
                                <div class="input-field col s3">
                                    <input id="commercial_builtup" type="text" class="validate">
                                    <label for="commercial_builtup">Commercial Builtup</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-action" style="text-align : right;">
                    <input type="submit" class="btn waves-effect indigo" name="submitScrutinyForm" value="submit" />
                </div>
            </g:form>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('select').material_select();
        });
    </script>
</body>
</html>
