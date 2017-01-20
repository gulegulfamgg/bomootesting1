package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class EventController {
	def springSecurityService
	def saveDataService

	@Secured('ROLE_ADMIN')
    def create() { }

    @Secured('ROLE_ADMIN')
    def saveEvent(){
    	def u = springSecurityService.currentUser

		def imgs = [];
		for(int i= 1; i <= 10; i++){
			def f = request.getFile('image' + i)
			if(f != null) {
				if(f.contentType != "application/octet-stream"){
		    		imgs.push(saveDataService.saveImage(f.bytes, f.contentType))
		   		}	
		   	}
		}	

	    saveDataService.saveEvent(u, params.title, params.content, imgs)
    }
}
