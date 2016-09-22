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
        <div class="card" id="main-content">
            <form id="scrutiny" >
                <div class="card-content">
                    <span class="card-title">Scrutiny Form</span>
                    <div class="row">
                        <div class="col s12">
                            <input type="hidden" name="chalanId" value="" />
                            <div class="form-section-title">Depositor Details</div>
                            <div class="row">
                                <div class="input-field col s4">
                                    <input required name="depositorFirstName" id="first_name" type="text" class="validate">
                                    <label for="first_name">First Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input name="depositorMiddleName" id="middle_name" type="text" class="validate">
                                    <label for="middle_name">Middle Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input requrired name="depositorLastName" id="last_name" type="text" class="validate">
                                    <label for="last_name">Last Name</label>
                                </div>
                            </div>
                          
                            <div class="row">
                                <div class="input-field col s12">
                                    <input required name="depositorAddress" id="address" type="text" class="validate">
                                    <label for="address">Address</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s4">
                                    <input required name="depositorContantNum" id="contact_number" type="text" class="validate">
                                    <label for="contact_number">Contact no.</label>
                                </div>
                                <div class="input-field col s8">
                                    <input name="depositorEmail" id="email" type="email" class="validate">
                                    <label for="email">Email</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s4">
                                    <input required required name="ctsNum" id="cts_number" type="number" class="validate">
                                    <label for="cts_number">CTS No.</label>
                                </div>
                                <div class="input-field col s4">
                                    <input required name="village" id="village" type="text" class="validate">
                                    <label for="village">Village</label>
                                </div>
                                <div class="input-field col s4">
                                    <input required name="taluka" id="taluka" type="text" class="validate">
                                    <label for="taluka">Taluka</label>
                                </div>
                            </div>
                            <div class="form-section-title">Architect Details</div>
                            <div class="row">
                                <div class="input-field col s4">
                                    <input required name="architectFirstName" id="first_name" type="text" class="validate">
                                    <label for="first_name">First Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input name="architectMiddleName" id="middle_name" type="text" class="validate">
                                    <label for="middle_name">Middle Name</label>
                                </div>
                                <div class="input-field col s4">
                                    <input required name="architectLastName" id="last_name" type="text" class="validate">
                                    <label for="last_name">Last Name</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s4">
                                    <input required name="architectContactNum" id="contact_number" type="text" class="validate">
                                    <label for="contact_number">Contact no.</label>
                                </div>
                                <div class="input-field col s8">
                                    <input name="architectEmail" id="email" type="email" class="validate">
                                    <label for="email">Email</label>
                                </div>
                            </div>
                            
                            <div class="form-section-title">Other Details</div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <select required name="designatedATP">
                                        <option value="" disabled selected>Select ATP</option>
                                        <g:each in="${UserRole.findAllByRole(Role.where{authority == 'ROLE_ATP'}.find()).user}" var="usr">
                                            <option value="${usr.id}">${usr.name}</option>
                                        </g:each>
                                    </select>
                                    <label>ATP</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s3">
                                    <input required name="residentialArea" id="residential_area" type="text" class="validate">
                                    <label for="residential_area">Residential Area</label>
                                </div>
                                <div class="input-field col s3">
                                    <input required name="commercialArea" id="commercial_area" type="text" class="validate">
                                    <label for="commercial_area">Commercial Area</label>
                                </div>
                                <div class="input-field col s3">
                                    <input required name="residentialBuiltup" id="residential_builtup" type="text" class="validate">
                                    <label for="residential_builtup">Residential Builtup</label>
                                </div>
                                <div class="input-field col s3">
                                    <input required name="commercialBuiltup" id="commercial_builtup" type="text" class="validate">
                                    <label for="commercial_builtup">Commercial Builtup</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-action" style="text-align : right;">
                    <input type="submit" class="btn waves-effect indigo" name="saveBtn" value=" save " />
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('select').material_select();
        });

        $("#scrutiny").submit(function(e) {   
            $.ajax({
                    url:"${g.createLink(controller:'chalan', action:'ajaxSaveChalan')}",
                    dataType: 'json',
                    method: 'POST',
                    data: $("#scrutiny").serialize(),
                    success: function(result) {
                        console.log(result)
                        Materialize.toast(result.msg, 4000)
                    },
                    error: function(result) {
                        Materialize.toast('Something went wrong. Contact Administrator.', 4000)
                    }
                });

            e.preventDefault()
        });
    </script>
</body>
</html>
