package bomoo

import auth.*

class BusinessDevelopment {

	String 	suggestion
	String 	category
	User	submittedBy
	Date	submittedOn = new Date()

	BusinessDevelopment(String suggestion, String category, User user){
		this()
		this.suggestion = suggestion
		this.category = category
		this.submittedBy = submittedBy
	}

    static constraints = {
    }
}
