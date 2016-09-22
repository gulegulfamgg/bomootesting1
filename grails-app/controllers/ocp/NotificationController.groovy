package ocp

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class NotificationController {

	def springSecurityService

    def getNotifications() { 

    }
    
    @Secured('permitAll')
    def getTop5Notifications() { 
    	User u 
    }
}
