package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class BomooAppApiController {

    def springSecurityService
    def bomooAppService

    @Secured('permitAll')
    def getZoneList() {
        def zoneList = Zone.findAll()
        def response = [zones : zoneList, ozones : zoneList]
        render response as JSON
    }

    @Secured('permitAll')
    def getBranchList() {
        def z = Zone.findWhere(name: params.zone)

        def branchList = Branch.findAllWhere(zone: z)

        def response = [branches : branchList]
        System.out.println(branchList)
        render response as JSON
    }

    @Secured('permitAll')
    def getScaleList() {
        def scaleList = Scale.findAll()
        def response = [scales : scaleList]
        render response as JSON
    }

    @Secured('permitAll')
    def saveTransferRequest() {
        def u =  springSecurityService.currentUser
        // def usr = User.get(u)
        def toZone = Zone.findWhere(name: params.toZone)
        def toBranch = Branch.findWhere(name: params.toBranch)
        System.out.println(u)
        bomooAppService.saveTrRequest(u, toZone, toBranch, params.priority, params.reason, params.status)
        def response = [status: "Saved"]
        render response as JSON
    }


    @Secured('permitAll')
    def saveIRIssue(){
        def u = springSecurityService.currentUser
        bomooAppService.saveIRIssue(params.msg, params.type, u)
    }

    @Secured('permitAll')
    def saveBusinessSuggestion() {
        def u = springSecurityService.currentUser // User.findById(params.user)
        bomooAppService.saveBusinessSuggestion(params.suggestion, params.category, u)
    }

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
