package bomoo
import auth.*

class SmsLog {

	String	smsText
	String	filters

	User	sentBy
	Date	sentOn

    static constraints = {
    	smsText nullable:false, blank:false
    	filters nullable:false, blank:false
    	sentBy nullable:false, blank:false
    	sentOn nullable:false, blank:false
    }
}
