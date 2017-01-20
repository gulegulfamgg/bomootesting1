package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class BulkSMSController {

    def springSecurityService
    def bomooAppService

	@Secured('permitAll')
    def index() { }
    
    @Secured(['ROLE_ADMIN', 'ROLE_SITEADMIN'])
    def createGSMS(){
        flash.zone = Zone.findAll()
        flash.scale = Scale.findAll()

        render view: 'createGSMS'
    }
     
    @Secured(['ROLE_ADMIN', 'ROLE_SITEADMIN'])
    def createBSMS(){}  
    
    @Secured('permitAll')
    def sendBirthDayWish(){
        
        Date now = new Date()
        
        now.clearTime()
        String today = now.format("dd-MMM")  
        
        def users = User.findAllByDateOfBirthLike(today+'%') //User.withCriteria {like('dateOfBirth', now)}
        def msg
        if(params.msg){
            for(u in users){
                System.out.println(u.name)
                msg = "Dear " + u.name +" "+ params.msg + " From: BOMOO"
                msg = msg.replaceAll("\\s","%20")
                bomooAppService.sendSMS(msg, u.contactNo)
            }
        }
        System.out.println(today)
        def response = [status: "done"]
        render response as JSON
    }

    @Secured('permitAll')
    def groupSMS(){
        def zone = Zone.findByNameLike(params.zone)

        def scale = Scale.findByNameLike(params.scale)
        def users


        if(params.gender == "Both"){
            users = User.findAllByZoneAndDesignationLike(zone, scale.name)
        }
        else{
            users = User.findAllByZoneAndDesignationLikeAndGenderLike(zone, scale.name, params.gender)   
        }

        
        def msg = params.msg
        
        for(u in users){
            def msgContent = "Dear " + u.name + " \n" + msg + " \n" + "From: BOMOO, Pune"
            msgContent = msgContent.replaceAll("\\s","%20")
            bomooAppService.sendSMS(msgContent, u.contactNo)
            System.out.println(u.name + ' : ' + u.contactNo)
        }
        System.out.println(params)
        def response = [status: "done"]
        render response as JSON
    }

}
