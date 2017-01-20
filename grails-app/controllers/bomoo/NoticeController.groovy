package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class NoticeController {
	def springSecurityService
	def saveDataService

	@Secured('ROLE_ADMIN')
    def create() { }

    @Secured('ROLE_ADMIN')
    def saveNotice(){
    	def u = springSecurityService.currentUser
    	saveDataService.saveNotice(u, params.content, params.title)
    }

}
