package ocp

class Property {

		String 		areaType
    	String		areaAddress
    	Double		areaCost
    	Double		registrationTax
    	Double		constructionCost

    static constraints = {
    	
    	areaType(nullable:true, blank:true)
    	areaAddress(nullable:true, blank:true)
    	registrationTax(nullable:true, blank:true)
    	constructionCost(nullable:true, blank:true)
    }
}
