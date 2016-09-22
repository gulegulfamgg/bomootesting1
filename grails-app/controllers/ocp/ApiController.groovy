package ocp

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class ApiController {

    def springSecurityService

    @Secured('permitAll')
    def index() { 
    	def u = springSecurityService.currentUser
      	String e = u.emailId

    	def m = [ abc : e ]
    	render m as JSON
    }
}
