package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class BusinessDevelopmentController {

    def springSecurityService
    def bomooAppService

	@Secured('permitAll')
    def index() { 
        flash.suggestion = BusinessDevelopment.findAll()
        render view: 'index'
    }

    @Secured('permitAll')
    def saveBusinessSuggestion() {
    	
    	def u = springSecurityService.currentUser // User.findById(params.user)

    	bomooAppService.saveBusinessSuggestion(params.suggestion, params.category, u)

    	
    }

}
