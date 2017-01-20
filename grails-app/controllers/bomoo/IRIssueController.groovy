package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class IRIssueController {

    def springSecurityService
    def bomooAppService

	@Secured(['ROLE_ADMIN', 'ROLE_SITEADMIN'])
    def index() {
        flash.irissue = IRIssue.findAll()
        render view: 'index'
     }

    @Secured('permitAll')
    def saveIRIssue(){

    	// def u = User.findById(params.user)
    	def u = springSecurityService.currentUser
    	
    	bomooAppService.saveIRIssue(params.msg, params.type, u)
    }

    
}
