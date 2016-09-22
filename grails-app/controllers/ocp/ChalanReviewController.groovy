package ocp

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class ChalanReviewController {

    def springSecurityService
    def mailService

    @Secured(['ROLE_ATP','ROLE_TP'])
    def approveChalan() {
    	def chalan = Chalan.get(params.chalanId)
        def usr = User.get(springSecurityService.currentUser.id)
        Date today = new Date()

        def role = springSecurityService.authentication.authorities[0].authority

        if(role == "ROLE_ATP") {
	        chalan.approverATP = usr
    	    chalan.approvedByATPOn = today
        	chalan.status = params.approved ? "ATPApproved" : "ATPRejected"
        }
        else if(role == "ROLE_TP") {
	        chalan.approverTP = usr
    	    chalan.approvedByTPOn = today
        	chalan.status = params.approved ? "TPApproved" : "TPRejected"
        }

        chalan.save()
        //mailService.sendApprovalMail(Integer.parseInt(params.chalanId))
        
        if(role == "ROLE_ATP") {
            redirect controller: "ChalanReview", action: "showChalanList"
        }
        else {
            redirect controller: "ChalanReview", action: "showATPApprovedChalanList"
        }
    }

    @Secured('ROLE_ATP')
    def showChalanList() {
        def usr = User.get(springSecurityService.currentUser.id)
        def chalanList  = Chalan.where{ assignedTo == usr && status == "Submitted" }.findAll().groupBy({it.submittedOn.month}, {it.submittedOn.date})
        render view: "approveChalan", model: [chalans : chalanList]
    }

    @Secured('ROLE_TP')
    def showATPApprovedChalanList() {
        def usr = User.get(springSecurityService.currentUser.id)
        def chalanList  = Chalan.where{ status == "ATPApproved" }.findAll().groupBy({it.submittedOn.month}, {it.submittedOn.date})
        render view: "approveChalan", model: [chalans : chalanList]
    }
}
