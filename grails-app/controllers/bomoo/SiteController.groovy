package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class SiteController {

	def springSecurityService
	def saveDataService

	@Secured('permitAll')
    def index() { 
    	flash.blogs = Blog.list([max:3, sort:"id", order:"desc"])
        flash.news = News.list([max:3, sort:"id", order:"desc"])
    	render view: 'index'
    }

    @Secured('permitAll')
    def gallery(){
    	
    }
    @Secured('permitAll')
    def founder(){
    	
    }
    @Secured('permitAll')
    def history(){
    	
    }
    @Secured('permitAll')
    def management(){
    	
    }
    @Secured('permitAll')
    def publication(){
    	
    }
    @Secured('permitAll')
    def tribute(){
    	
    }
    @Secured('permitAll')
    def bulletin(){
    	
    }
    @Secured('permitAll')
    def notice(){
        
    }
    @Secured('permitAll')
    def news(){
        
    }
    @Secured('permitAll')
    def blog(){
        
    }
    
    @Secured('permitAll')
    def getImage() {
		def img = Img.get(params.id)

		OutputStream out = response.outputStream
		out.write(img.imageData)
		out.close() 
	}
}
