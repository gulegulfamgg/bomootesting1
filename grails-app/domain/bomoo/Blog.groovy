package bomoo
import auth.*

class Blog {

	String	title
	String	content
    String  subHeading
	Img		img
	User	postedBy
	Date	postedOn = new Date()

    static constraints = {
    	title nullable:false, blank:false
        content nullable:false, blank:false, type: 'text'
    	subHeading nullable:true, blank:true, type: 'text'
    	img nullable: true, blank:true
    	postedBy nullable:false, blank:false
    }
}
