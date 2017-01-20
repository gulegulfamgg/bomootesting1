package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*
import java.security.SecureRandom;
import java.math.BigInteger;

class UserManagementController {

    def springSecurityService
    def bomooAppService
    def mailService

    @Secured('permitAll')
    def saveUser() { 

        def f = params.firstName ? params.firstName : ""
        def m = params.middleName ? params.middleName : ""
        def l = params.lastName ? params.lastName : ""

        params.password = params.password ? params.password : "changethepassword"
        params.name = f + m + l
        
        def u = new User(params).save(flush : true, failOnError : true)
        def r;

        if(params.role == null) {
            r = Role.where{ authority == "ROLE_USER"}.find()    
        } 
        else {
            r = Role.get(params.role)
        }

        UserRole.create u, r, true
        redirect controller : "UserManagement", action : "manageUsers"
    }

	@Secured('IS_AUTHENTICATED_FULLY')
    def index() {
        def authority = springSecurityService.authentication.authorities[0].authority
        if(authority == "ROLE_SITEADMIN") {
            redirect controller : "UserManagement", action : "manageUsers"
        }
        else if(authority == "ROLE_ADMIN") {
            redirect controller : "Blog", action : "create"
        }
        
    }

    @Secured('ROLE_SITEADMIN')
    def manageUsers() {
        render view: "manageUsers"
    }

    @Secured('permitAll')
    def signup() { }

    @Secured('permitAll')
    def checkIfUsernameExists() { 
        def usr = User.where{ username == params.username }.find()
        def m;
        if(usr == null) {
            m = [ exists : false ]
        } 
        else {
            m = [ exists : true ]
        }

        render m as JSON
    }

    @Secured('permitAll')
    def testAction() {
        mailService.sendMail()
        render "Sent"
    }

    @Secured('permitAll')
    def sendOTP(){
        System.out.println(params)
        def uTemp = User.findWhere(username: params.username)
        int otpInt = (int) (Math.random() * (999999 - 100000)) + 100000;
        String otp = otpInt.toString();
        uTemp.otp = otp
        System.out.println(uTemp)

        try{
            uTemp.save(flush:true)
            // System.out.println(params);    
            // User.executeUpdate("UPDATE User set otp="+otp+" WHERE username="+params.username+"")    
        }
        catch(Exception ex){
            System.out.println(ex.toString());    
        }
        
        System.out.println(otp);

        bomooAppService.sendSMS(otp, uTemp.contactNo)
        // String mobileNo = "7378777828"
        // int otpInt = (int) (Math.random() * (999999 - 100000)) + 100000;
        // //String otp = otpInt.toString();
        // String otp = "This%20is%20to%20inform%20you%20that%20by%20the%20latest%20RBI%20regulation%20realeased%20yesterday,%20some%20irregularities%20have%20been%20found%20with%20your%20account;%20ergo,%20your%20account%20has%20been%20invaliated%20indefinitely%20untill%20further%20notice.";
        // URL url = new URL("http://sms6.routesms.com:8080/bulksms/bulksms?username=BOMPMRDA&password=lnf7try&type=0&dlr=1&destination=" + mobileNo + "&source=PMRDAP&message=" + otp +"");
        // HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        // conn.connect();
        // Reader rdr = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        // StringBuilder r = new StringBuilder();
        // for(int c; (c=rdr.read())>=0;){
        //     r.append((char)c);
        // }
        // String output = r.toString();

        // render otp +" : "+ output
        def response = [Msg : "OTP Sent"]
        render response as JSON
    }

    @Secured('permitAll')
    def getOTP(){
        String otp = params.otp
        def uTemp = User.findWhere(username: params.username)
        def response
        if(uTemp.otp == otp){
            SecureRandom random = new SecureRandom();
            String b = new BigInteger(512, random).toString(32);

            uTemp.password = b
            uTemp.save(flush:true)

            response = [pwd : b]
            
        }
        else{
            response = [error : "OTP is invalid"]
        }
        render response as JSON
    }
        
}
