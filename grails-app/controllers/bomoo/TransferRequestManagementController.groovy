package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class TransferRequestManagementController {

    def springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_SITEADMIN'])
    def index() {
    	flash.zones = Zone.list()
    	render view:"index"
    }

    @Secured('permitAll')
    def getZoneList() {
        def zoneList = Zone.findAll()
        def response = [zones : zoneList]
        render response as JSON
    }
    
    @Secured('permitAll')
    def getBranchList() {
    	def z = Zone.findById(params.zoneId)
        def branchList = Branch.findAllByZone(z)
        def response = [branches : branchList]
        System.out.println(params)
        
        render response as JSON
    }

    @Secured('permitAll')
    def getTransferRequest() {
        System.out.println(params.branchId.getClass())
        if(params.branchId != 0 && !params.branchId.equals("0")) {
            def brnch = Branch.get(params.branchId)
            def transferRequestList = TransferRequest.where{ fromBranch == brnch }.findAll()
            def response = [ tr : transferRequestList]
            JSON.use('deep') {
                render response as JSON
            }
        }
        else {
            System.out.println(params.branchId)
            System.out.println(params.zoneId)
            def z = Zone.findById(params.zoneId)
            def branchList = Branch.findAllByZone(z)
            def transferRequestList = []

            branchList.each {
                def trl = TransferRequest.findAllByFromBranch(it)
                transferRequestList = transferRequestList + trl
            }

            def response = [ tr : transferRequestList]
            JSON.use('deep') {
                render response as JSON
            }
        }

    }

    @Secured('permitAll')
    def getBranchDetails() {
        def empId = params.empId
        def t = TransferRequest.where{ employee.id == empId }.find()
        def fromBranch = t.fromBranch
        def toBranch = t.toBranch

        def frmUsrList = User.where{ branch.id == fromBranch.id }.findAll()
        def toUsrList = User.where{ branch.id == toBranch.id }.findAll()

        def response = [ fromUsers : frmUsrList, toUsers : toUsrList]
        render response as JSON
    }
}
