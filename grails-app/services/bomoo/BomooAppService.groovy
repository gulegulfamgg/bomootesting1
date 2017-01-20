package bomoo

import grails.transaction.Transactional
import auth.User

import java.io.BufferedReader; 
import java.io.DataOutputStream; 
import java.io.InputStreamReader; 
import java.net.HttpURLConnection; 
import java.net.URL;
import java.net.URLEncoder;

@Transactional
class BomooAppService {

	def saveTrRequest(User employee, Zone toZone, Branch toBranch, String priority, String reason, String status) {
        def fromBranch = employee.branch
        def fromZone = employee.zone
        def submittedOn = new Date()
    	def tr = new TransferRequest(employee : employee, fromZone : fromZone, fromBranch : fromBranch, toZone : toZone, toBranch : toBranch, priority : priority, reason : reason, status : status, submittedOn: submittedOn).save(flush:true)
    }

    def saveBusinessSuggestion(String suggestion, String category, User user){
        def bds = new BusinessDevelopment(suggestion : suggestion, category : category, user : user).save(flush:true)
    }

    def saveIRIssue(String msg, String type, User user){
        def iri = new IRIssue(msg: msg, type: type, submittedBy: user).save(flush:true)
    }

    def sendSMS(String msg, String mobile){
        
    	// System.out.println(msg + " | " + mobile)
        String username = "BOMPMRDA"; 
        String password = "lnf7try"; 
        String message = msg; 
        String dlr = 0; //Delivery Report Not Required = 0, Required = 1
        String type = 0; // 0: means plain text
        String destination = mobile; 
        String source = "PMRDAP"; // source id 
        String server = "http://sms6.routesms.com";
        int port = 8080;
    	
        try {
           
            
            URL url = new URL("http://sms6.routesms.com:8080/bulksms/bulksms?username=BOMPMRDA&password=lnf7try&type=0&dlr=1&destination=" + destination + "&source=PMRDAP&message=" + message +"");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.connect();
            Reader rdr = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            StringBuilder r = new StringBuilder();
            for(int c; (c=rdr.read())>=0;){
                r.append((char)c);
            }
            String output = r.toString();

        } 
        catch (Exception ex) {
            System.out.println("Error: " + ex.toString());
        }

    }
}
