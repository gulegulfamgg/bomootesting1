package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class MessageController {
	def springSecurityService
	def saveDataService

	@Secured('ROLE_ADMIN')
    def create() { }

    @Secured('ROLE_ADMIN')
    def saveMessage(){
    	def u = springSecurityService.currentUser

    	saveDataService.saveMessage(u, params.content)
    }
}
