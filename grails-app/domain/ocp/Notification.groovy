package ocp

import auth.User

class Notification {

	String title
	String text
	Date createdOn = new Date()
	
	String cntrlr
	String actn
    boolean read = false

    static belongsTo = User 

    static constraints = {
    	title nullable: false, blank: false
    	text nullable: false, blank: false
    }
}
