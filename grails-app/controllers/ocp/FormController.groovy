package ocp

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.User

class FormController {

	def springSecurityService

    def index() { }

    @Secured('IS_AUTHENTICATED_FULLY')
    def saveApllicant() { 

		Applicant applicant;

    	if(params.applicantId != null) {
    		applicant = Applicant.get(params.chalanId)
    	} 
    	else {
    		
    		applicant = new Applicant()
    	}

    	applicant.gender = params.gender
    	applicant.name 	= params.name
    	applicant.fatherName = params.fatherName
    	applicant.contactNo = params.contactNo
    	applicant.email = params.email

    	applicant.incomeType = params.incomeType
    	
    	applicant.netMonthInc = params.netMonthInc
    	applicant.grossMonthInc = params.grossMonthInc
    	applicant.itrThisYear = params.itrThisYear
    	applicant.itrLastYear = params.itrLastYear

    	applicant.company = params.company
    	applicant.designation = params.designation

		chalan.save(flush : true, failOnError : true)	
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    def saveProperty() { 

		Property property;

    	if(params.propertyId != null) {
    		property = Property.get(params.prpoertId)
    	} 
    	else {
    		
    		property = new Property()
    	}

    	Property.areaType = params.areaType
    	Property.areaAddress 	= params.areaAddress
    	Property.areaCost = params.areaCost
    	Property.registrationTax = params.registrationTax
    	Property.constructionCost = params.constructionCost


		property.save(flush : true, failOnError : true)	
    }
}
