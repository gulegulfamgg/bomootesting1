package bomoo
import auth.*

class IRIssue {

	String	msg
	String 	type

	User	submittedBy
	Date	submittedOn = new Date()

	IRIssue(String msg, String type, User submittedBy){
		this()
		this.msg = msg
		this.type = type
		this.submittedBy = submittedBy
	}
	
    static constraints = {
    }
}
