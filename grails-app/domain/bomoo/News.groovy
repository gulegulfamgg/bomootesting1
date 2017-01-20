package bomoo
import auth.*

class News {

	String	title
	String	content
	Img		img
	User	postedBy
	Date	postedOn = new Date()

    static constraints = {
    	title nullable:false, blank:false
    	content nullable:false, blank:false, type: 'text'
    	img nullable: true, blank:true
    	postedBy nullable:false, blank:false
    }
}
