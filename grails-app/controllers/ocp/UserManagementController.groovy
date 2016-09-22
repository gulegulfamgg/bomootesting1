package ocp

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class UserManagementController {

    def springSecurityService
    def mailService

    @Secured('permitAll')
    def saveUser() { 

        def f = params.firstName ? params.firstName : ""
        def m = params.middleName ? params.middleName : ""
        def l = params.lastName ? params.lastName : ""

        params.password = params.password ? params.password : "changethepassword"
        params.name = f + m + l
        
        def u = new User(params).save(flush : true, failOnError : true)
        def r;

        if(params.role == null) {
            r = Role.where{ authority == "ROLE_USER"}.find()    
        } 
        else {
            r = Role.get(params.role)
        }

        UserRole.create u, r, true
        redirect controller : "UserManagement", action : "index"
    }

	@Secured('IS_AUTHENTICATED_FULLY')
    def index() {
        def authority = springSecurityService.authentication.authorities[0].authority
        if(authority == "ROLE_SITEADMIN") {
            redirect controller : "UserManagement", action : "manageUsers"
        }
        else if(authority == "ROLE_ADMIN") {
            redirect controller : "Performance", action : "index"
        }
        else if(authority == "ROLE_USER") {
            redirect controller : "Chalan", action : "displayChalan"
        }
        else if(authority == "ROLE_ATP") {
            redirect controller : "ChalanReview", action : "showChalanList"
        }
        else if(authority == "ROLE_TP") {
            redirect controller : "ChalanReview", action : "showATPApprovedChalanList"
        }
    }

    @Secured('ROLE_SITEADMIN')
    def manageUsers() {
        render view: "manageUsers"
    }

    @Secured('permitAll')
    def signup() { }

    @Secured('permitAll')
    def checkIfUsernameExists() { 
        def usr = User.where{ username == params.username }.find()
        def m;
        if(usr == null) {
            m = [ exists : false ]
        } 
        else {
            m = [ exists : true ]
        }

        render m as JSON
    }

    @Secured('permitAll')
    def testAction() {
        mailService.sendMail()
        render "Sent"
    }
}
