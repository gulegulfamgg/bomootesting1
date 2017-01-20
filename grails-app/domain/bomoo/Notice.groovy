package bomoo
import auth.*

class Notice {

	String title
	String content

	User postedBy
	Date postedOn = new Date()

    static constraints = {
    	title nullable:false, blank:false
    	content nullable:false, blank:false, type: 'text'
    	postedBy nullable:false, blank:false
    }
}
