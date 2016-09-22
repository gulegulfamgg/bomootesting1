package ocp

class Loan {

		String		appGender
    	String		appName
    	String		appFatherName
    	String		appContactNo
    	String		appEmail

    	boolean		incomeType
    	Double		appNetMonthInc
    	Double		appGrossMonthInc
    	String		appEmployer
    	String		appDesignation

    	String 		areaType
    	String		areaAddress
    	Double		areaCost
    	Double		regTax
    	Double		constructionCost

    	static hasMany = [coApp: CoApplicant]


    static constraints = {
    	
    }
}
