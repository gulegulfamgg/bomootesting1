package ocp

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.User

class ChalanController {

	def springSecurityService

	@Secured('ROLE_USER')
	def displayChalan() {
   		render view : "saveChalan"
	}

	@Secured('ROLE_USER')
    def ajaxSaveChalan() {
		Chalan chalan;
		Map m;

    	if(params.chalanId != "" && params.chalanId != null) {
    		chalan = Chalan.get(params.chalanId)
    		m = [ msg : "Details updated successfully" ]
    	} 
    	else {
    		params.submittedBy = User.get(springSecurityService.currentUser.id)
    		params.submittedOn = new Date()
    		params.status = 'Submitted'

    		params.assignedTo = User.get(params.designatedATP) 

    		chalan = new Chalan(params)
    		chalan.save(failOnError : true)

    		m = [ msg : "Details saved successfully" ]
    	}

    	render m as JSON
	}

	@Secured('IS_AUTHENTICATED_FULLY')
    def saveChalan() { 

		Chalan chalan;

    	if(params.chalanId != null) {
    		chalan = Chalan.get(params.chalanId)
    	} 
    	else {
    		System.out.println("New Chalan")
    		chalan = new Chalan()
    	}

    	chalan.depositorFirstName = params.depositorFirstName
		chalan.depositorMiddleName = params.depositorMiddleName
		chalan.depositorLastName = params.depositorLastName

		chalan.depositorAddress = params.depositorAddress
		chalan.depositorContantNum = params.depositorContantNum
		chalan.depositorEmail = params.depositorEmail

		chalan.ctsNum = params.ctsNum
		chalan.village = params.village
		chalan.taluka = params.taluka

		chalan.architectFirstName = params.architectFirstName
		chalan.architectMiddleName = params.architectMiddleName
		chalan.architectLastName = params.architectLastName

		chalan.architectContactNum = params.architectContactNum
		chalan.architectEmail = params.architectEmail

		chalan.residentialArea = params.residentialArea
		chalan.commercialArea = params.commercialArea
		chalan.residentialBuiltup = params.residentialBuiltup
		chalan.commercialBuiltup = params.commercialBuiltup

		chalan.save(flush : true, failOnError : true)	
    }

	@Secured('ROLE_USER')
    def makePayment() { 
    	def usr = User.get(springSecurityService.currentUser.id)
        def chalanList  = Chalan.where{ submittedBy == usr && status == "TPApproved" }.findAll()
        render view: "payForChalan", model: [chalans : chalanList]
    }

    @Secured('ROLE_USER')
    def pay() { 
    	def chalan = Chalan.get(params.chalanid)
    	chalan.status = "Paid"
    	chalan.save()
    	redirect controller:"Chalan", action:"makePayment"
    }    
}
