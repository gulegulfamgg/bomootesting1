package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class NewsController {
	def springSecurityService
	def saveDataService

	@Secured('ROLE_ADMIN')
    def create() { }

    @Secured('ROLE_ADMIN')
    def saveNews() {
    	def u = springSecurityService.currentUser
    	def f = request.getFile('blog-header-image')
		def i = null

		if(f.contentType != "application/octet-stream"){
	    	i = saveDataService.saveImage(f.bytes, f.contentType)
	    }

	    saveDataService.saveNews(u, params.title, params.content, i)
    }
}
