<!doctype html>
<html>
<head>
    <meta name="layout" content="login"/>
    <title>OCP - Login</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <style type="text/css">
        body { padding-top : 0px; height : 100%;}
        html { background-color : rgba(245, 245, 245, 1);  height : 100%;}
        .row { margin-bottom: 0px; }
        .signupDiv input { text-align : left; }
        [type="checkbox"] + label:before, [type="checkbox"]:not(.filled-in) + label:after {
            margin-left : -10px;
        }
        [type="checkbox"] + label {
            padding-left : 24px;
        }
    </style>
</head>
<body>
    <div class="row" style="height : 100%;" >
        <div class="col l6 indigo" style="height : 100%;" >
        </div>
        <div class="col s12 m12 l6 row valign-wrapper" style="height : 100%;" >
            <form method="POST" action="/UserManagement/saveUser">
                <div class="col s12 m12 l8 offset-l2 signupDiv valign">
                    <span style="color : #3f51b5; font-size: 20px; margin-left : 10px; line-height : 60px" >Sign up</span>
                    <div class="row">
                        <div class="input-field col s12">
                            <input required placeholder="Username" minlength="5" name="username" id="username" type="text" id="username">
                        </div>
                        <div class="input-field col s12">
                            <input required placeholder="Password" minlength="8" name="password" id="password" type="password" id="password">
                            
                        </div>
                        <div class="input-field col s12">
                            <input required disabled placeholder="Re-enter Password" minlength="8" name="reEnteredPassword" id="reEnteredPassword" type="password">
                            
                        </div>
                        <div class="input-field col s12">
                            <input requrired placeholder="Email Id" name="emailId" id="email" type="email" class="validate">
                            
                        </div>
                        <div class="input-field col s12">
                            <input requrired name="agree" id="agree" type="checkbox"> 
                            <label for="agree" >I Agree to the Terms and Conditions</label>                 
                        </div>

                        <div class="input-field col s12" style="margin-top : 36px; text-align : right;">
                            <input disabled class="btn indigo disabled" name="submit" id="submit" value="submit" type="submit">                        
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        var isPasswordValid = false;
        var isUsernameValid = false;
        var isUsernameUnique = false;
        var isEmailValid = false;
        var arePasswordsEqual = false;
        var areTermsAgreed = false;

        function termsAgreedStatus() {
            if ($("#agree").is(":checked")) {
                areTermsAgreed = true
                return true
            } 
            else {
                areTermsAgreed = false
                return false
            }
        }

        function emailValidity() {
            var emailId = $("#email").val();
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(emailId);
        }

        function passwordValidity() {
            var pwd = $("#password").val();
            if (pwd.length >= 8) {
                isPasswordValid = true
                return true;
            } 
            else {
                isPasswordValid = false
                return false;
            }          
        }

        function usernameValidity() {
            var usr = $("#username").val();
            if (usr.length >= 5) {
                isUsernameValid = true
                return true;
            } 
            else {
                isUsernameValid = false
                return false;
            }          
        }

        function passwordEquality() {
            var pwd = $("#password").val();
            var reEntrdPwd = $("#reEnteredPassword").val();
            if (pwd == reEntrdPwd) {
                arePasswordsEqual = true
                return true
            } 
            else {
                arePasswordsEqual = false
                return false
            }
        }

        function usernameUniqueness() {
            var usrnme = $("#username").val();
            $.ajax({
                url:"${g.createLink(controller:'UserManagement', action:'checkIfUsernameExists')}",
                dataType: 'json',
                method: 'POST',
                async: false,
                data: { "username" : usrnme },
                success: function(r) {
                    if (r.exists == true) {
                        isUsernameUnique = false
                    } 
                    else {
                        isUsernameUnique = true
                    }
                }
            });
        }

        function changeSubmitBtnAbility() {
            if (isUsernameValid && isUsernameUnique && isPasswordValid && isEmailValid && arePasswordsEqual && areTermsAgreed) {
                $("#submit").removeAttr("disabled");
                $("#submit").removeClass("disabled");
            }
            else {
                $("#submit").attr("disabled", "true");  
                $("#submit").addClass("disabled") ;
            }
        }

        $("#username").on("change", function(){
            if (usernameValidity()) {
                usernameUniqueness()
                if (isUsernameUnique) {
                    Materialize.toast('Username is acceptable', 4000)
                    makeValid("username")
                } 
                else {
                    Materialize.toast('Username already exists', 4000)
                    makeInvalid("username")
                }
            }
            else {
                Materialize.toast('Username should be atleast 5 characters long', 4000)
                makeInvalid("username")
            }

            changeSubmitBtnAbility()
        });

        $("#email").on("keyup", function(){
            isEmailValid = emailValidity()
            changeSubmitBtnAbility()
        });

        $("#password").on("keyup", function(){
            if (passwordValidity()) {
                $("#reEnteredPassword").removeAttr("disabled")
            } 
            else {
                $("#reEnteredPassword").attr("disabled", "true")
            }
        });

        $("#password").on("change", function(){
            if (!passwordValidity()) {
                Materialize.toast('Password should be atleast 8 characters long', 4000)
            }

            if ($("#reEnteredPassword").val() != "") {
                if (!passwordEquality()) {
                    Materialize.toast('Passwords are not same', 4000)
                    makeInvalid("password")
                    makeInvalid("reEnteredPassword")
                }
                else {
                    makeValid("password")
                    makeValid("reEnteredPassword")       
                }
            }
            changeSubmitBtnAbility();
        });

        $("#reEnteredPassword").on("change", function(){
            if (!passwordEquality()) {
                Materialize.toast('Passwords are not same', 4000)
                makeInvalid("password")
                makeInvalid("reEnteredPassword")
            }
            else {
                makeValid("password")
                makeValid("reEnteredPassword")       
            }

            changeSubmitBtnAbility();
        });

        $("#agree").on("change", function(){
            termsAgreedStatus();
            changeSubmitBtnAbility();
        });

        function makeValid(id) {
            $("#" + id).addClass("valid")
            $("#" + id).removeClass("invalid")
        }

        function makeInvalid(id) {
            $("#" + id).addClass("invalid")
            $("#" + id).removeClass("valid")
        }
    </script>
</body>
</html>
