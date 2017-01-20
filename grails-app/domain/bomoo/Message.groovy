package bomoo
import auth.*

class Message {

	String content
	User postedBy
	Date postedOn = new Date()

    static constraints = {
    	content nullable:false, blank:false, type: 'text'
    	postedBy nullable:false, blank:false
    }
}
