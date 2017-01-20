package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class TransferRequestApiController {

    def springSecurityService
    def bomooAppService

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
}
