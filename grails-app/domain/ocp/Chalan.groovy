package ocp

import auth.User

class Chalan {

	String depositorFirstName
	String depositorMiddleName
	String depositorLastName

	String depositorAddress
	String depositorContantNum
	String depositorEmail

	String ctsNum
	String village
	String taluka

	String architectFirstName
	String architectMiddleName
	String architectLastName

	String architectContactNum
	String architectEmail

	int residentialArea
	int commercialArea
	int residentialBuiltup
	int commercialBuiltup

	User submittedBy
	User approverATP
	User approverTP

	User assignedTo
	
	Date submittedOn
	Date updatedOn = new Date() 
	Date approvedByATPOn
	Date approvedByTPOn
	Date paidOn

	int ammount

	String status

	Chalan(String depositorFirstName, String depositorLastName, String depositorContantNum, String depositorEmail, String depositorAddress, String architectFirstName, String architectLastName, String architectContactNum, String architectEmail, String ctsNum, String village, String taluka, int residentialArea, int residentialBuiltup, int commercialArea, int commercialBuiltup, User submittedBy, Date submittedOn, User assignedTo, String status, Date approvedByTPOn = null, Date paidOn = null) {
		this()
		this.depositorFirstName = depositorFirstName
		this.depositorLastName = depositorLastName

		this.depositorContantNum = depositorContantNum
		this.depositorEmail = depositorEmail
		this.depositorAddress = depositorAddress

		this.architectFirstName = architectFirstName
		this.architectLastName = architectLastName
		this.architectContactNum = architectContactNum
		this.architectEmail = architectEmail

		this.ctsNum = ctsNum
		this.village = village
		this.taluka = taluka

		this.residentialArea = residentialArea
		this.residentialBuiltup = residentialBuiltup
		this.commercialArea = commercialArea
		this.commercialBuiltup = commercialBuiltup

		this.submittedBy = submittedBy
		this.submittedOn = submittedOn
		this.assignedTo = assignedTo

		this.approvedByTPOn = approvedByTPOn
		this.paidOn = paidOn

		this.status = status
	}


	def beforeInsert() {
		ammount = residentialArea + residentialBuiltup + commercialArea + commercialBuiltup;
	}

    static constraints = {
    	depositorMiddleName nullable:true, blank:true
    	depositorEmail nullable:true, blank:true
    	architectMiddleName nullable:true, blank:true
    	architectEmail nullable:true, blank:true
    	approverTP nullable:true, blank:true
    	approverATP nullable:true, blank:true
    	approvedByATPOn nullable:true, blank:true
    	approvedByTPOn nullable:true, blank:true
    	paidOn nullable:true, blank:true
    	status nullable: false, blank: true, inList: ["Submitted", "TPApproved", "TPRejected", "ATPApproved", "ATPRejected", "Paid"]
    }
}
