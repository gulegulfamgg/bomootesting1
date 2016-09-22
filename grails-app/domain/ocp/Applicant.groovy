package ocp

class Applicant {

		String		gender
    	String		name
    	String		fatherName
    	String		contactNo
    	String		email

    	boolean		incomeType
    	
    	Double		netMonthInc
    	Double		grossMonthInc
    	Double		itrThisYear
    	Double		itrLastYear

    	String		company
    	String		designation

    static constraints = {
    	
    	fatherName(nullable:true, blank:true)
    	email(nullable:true, blank:true)
    	incomeType(nullable:true, blank:true)
    	netMonthInc(nullable:true, blank:true)
    	grossMonthInc(nullable:true, blank:true)
    	itrLastYear(nullable:true, blank:true)
    	itrThisYear(nullable:true, blank:true)
    	company(nullable:true, blank:true)
    	designation(nullable:true, blank:true)
    }
}
