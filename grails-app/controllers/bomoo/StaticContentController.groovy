package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class StaticContentController {

    @Secured('permitAll')
    def index(){
      
    }
}
