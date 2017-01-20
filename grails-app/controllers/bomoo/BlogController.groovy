package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class BlogController {
	
	def springSecurityService
	def saveDataService

	@Secured('ROLE_ADMIN')
    def create() { }

    @Secured('ROLE_ADMIN')
    def saveBlog() {	
    	def u = springSecurityService.currentUser

    	def f = request.getFile('blog-header-image')
		def i		
		if(f.contentType != "application/octet-stream"){
	    	i = saveDataService.saveImage(f.bytes, f.contentType)
	   }

	   saveDataService.saveBlog(u, params.title, params.subHeading, params.content,i)
    }

    @Secured('permitAll')
    def show() {
    	flash.blog = Blog.get(params.id)
    	render view: 'show'
    }
}
