package ocp

import grails.plugin.springsecurity.SpringSecurityService

class UserTagLib {

	def springSecurityService

    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def loggedInUserEmailId = {
    	def u = springSecurityService.currentUser
        def emailId = u.emailId ? u.emailId : "Email id not available"
    	out << emailId
	}

    def loggedInUserName = {
    	def u = springSecurityService.currentUser
    	def name = u.name ? u.name : u.username
    	out << name
	}

    def cleanDate = { attrs ->
        def date = attrs.date
        def newDate = date.format("dd MMM, yyyy")
        out << newDate
    }

    def getMonth = { attrs ->
        def month;

        if(attrs.month == 0) { month = "Jan" } 
        else if(attrs.month == 1) { month = "Feb" }
        else if(attrs.month == 2) { month = "Mar" }
        else if(attrs.month == 3) { month = "Apr" }
        else if(attrs.month == 4) { month = "May" }
        else if(attrs.month == 5) { month = "Jun" }
        else if(attrs.month == 6) { month = "Jul" }
        else if(attrs.month == 7) { month = "Aug" }
        else if(attrs.month == 8) { month = "Sep" }
        else if(attrs.month == 9) { month = "Oct" }
        else if(attrs.month == 10) { month = "Nov" }
        else if(attrs.month == 11) { month = "Dec" }
        
        out << month
    }
}
