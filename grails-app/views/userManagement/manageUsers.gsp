<%@ page import="auth.*" %>

<!doctype html>
<html>
<head>
    <meta name="layout" content="other"/>
    <title>OCP - Home</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <style type="text/css">
        .newHeader {
            color : white;
            font-weight : 300;
            font-size : 24px;
        }

        .divider {
            height: 1px;
            background-color: #C5CAE9;
            width: 100%;
            margin-top : 12px;
        }

        .tabs { margin-top : 18px; }
        .tabs .tab a { color: white; }
        .floatright { float : right; }
        #fab {    
            position: fixed;
            bottom: 24px;
            right: 24px;
        }
    </style>
</head>
<body>
    <div class="row indigo" style="height : 150px; width : 100%; padding-top : 48px;">
        <div class="col s12 m12 l10 offset-l1" >
            <span class="newHeader"> User Management </span>
            <ul class="tabs indigo">
                <g:each in="${Role.where{authority != 'ROLE_SITEADMIN' && authority != 'ROLE_USER'}.findAll()}" var="role" >
                    <li class="tab col s3">
                        <a class="active" href="#${role.name}">${role.name}</a>
                    </li>
                </g:each>
            </ul>
        </div>
    </div>
    <g:each in="${Role.where{authority != 'ROLE_SITEADMIN' && authority != 'ROLE_USER' }.findAll()}" var="role" >
                
    <div class="row" id="${role.name}" >
        <div class="col s12 m12 l10 offset-l1" >
            <table class="striped bordered highlight" >
                <thead>
                    <tr>
                        <th> # </th>
                        <th> Username </th>
                        <th> Name </th>
                        <th> Email Id </th>
                        <th> </th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${UserRole.findAllByRole(Role.where{authority == role.authority}.find()).user}" var="usr" >
                        <tr>
                            <td> ${ usr.id } </td>
                            <td> ${ usr.username } </td>
                            <td> ${ usr.name } </td>
                            <td> ${ usr.emailId } </td>
                            <td> <i class="material-icons md-dark">edit</i> </td>
                            <td> <i class="material-icons md-dark">delete</i> </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>

    </g:each>
    <button data-target="modal1" class="waves-effect btn-large btn-floating floatright red accent-2 modal-trigger" id="fab" >
        <i class="material-icons md-light">add</i>
    </button>

    <div id="modal1" class="modal modal-fixed-footer">
        <g:form controller="UserManagement" action="saveUser">
            <div class="modal-content">
                <h5> Create User </h5>
                <div class="row">
                    <div class="input-field col s8">
                        <input required name="username" id="username" type="text" class="validate">
                        <label for="username">Username</label>
                    </div>
                    <div class="input-field col s4">
                        <select required name="role">
                            <option value="" disabled selected>Select Role</option>
                            <g:each in="${Role.where{ authority != 'ROLE_SITEADMIN' && authority != 'ROLE_USER' }.findAll()}" var="role">
                                <option value="${role.id}">${role.name}</option>
                            </g:each>
                        </select>
                        <label>Role</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <input required name="firstName" id="first_name" type="text" class="validate">
                        <label for="first_name">First Name</label>
                    </div>
                    <div class="input-field col s4">
                        <input name="middleName" id="middle_name" type="text" class="validate">
                        <label for="middle_name">Middle Name</label>
                    </div>
                    <div class="input-field col s4">
                        <input requrired name="lastName" id="last_name" type="text" class="validate">
                        <label for="last_name">Last Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input required name="emailId" id="emailId" type="text" class="validate">
                        <label for="first_name">Email Id</label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input type="submit" value="Create" class="modal-action waves-effect btn-flat" />
            </div>
        </g:form>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.modal-trigger').leanModal();
            $('select').material_select();
            $('ul.tabs').tabs();
        });
    </script>
</body>
</html>
