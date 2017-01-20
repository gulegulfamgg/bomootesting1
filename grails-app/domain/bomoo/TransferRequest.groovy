package bomoo
import auth.*

class TransferRequest {

    User    employee
    Zone    fromZone
    Branch  fromBranch
    Zone    toZone
    Branch  toBranch
    String  priority // urgent, normal
    String  reason
    String  status = "Submitted"
    Date    submittedOn

    TransferRequest(User employee, Zone fromZone, Branch fromBranch, Zone toZone, Branch toBranch, String priority, String reason, String status, Date submittedOn) {
        this()
        this.employee = employee
        this.fromZone = fromZone
        this.fromBranch = fromBranch
        this.toZone = toZone
        this.toBranch = toBranch
        this.priority = priority
        this.reason = reason
        this.status = status
        this.submittedOn = submittedOn
    }

    static constraints = {
        employee nullable: false, blank: false
        fromBranch nullable: false, blank: false
        toBranch nullable: false, blank: false
        priority nullable: false, blank: false
        status nullable: false, blank: false
    	reason nullable: false, blank: false
        submittedOn nullable: false, blank: false
    }
}
