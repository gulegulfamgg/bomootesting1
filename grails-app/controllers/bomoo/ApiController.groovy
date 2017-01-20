package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class ApiController {

    def springSecurityService

    @Secured('permitAll')
    def index() {
    	def u = springSecurityService.currentUser
      	String e = u.emailId != null ? u.emailId : "abc@xyz.com"
      	String n = u.name != null ? u.name : "Anonymous"
    	def m = [ emailId : e, name : n ]
    	render m as JSON
    }

    @Secured('permitAll')
    def changePassword() {
    	System.out.println(params)
    	def u = springSecurityService.currentUser
    	User usr = User.get(u.id)
    	usr.password = params.newPassword
    	usr.save()
    	def m = [ "Status" : "Changed" ]
    	render m as JSON
    }

    
}
