package bomoo

import grails.transaction.Transactional
import auth.User
//import org.springframework.scheduling.annotation.Async

@Transactional

class UploadDataService {
	
	
	def saveUser(String username, String name, String emailId, String designation, String gender, String contactNo, String zoneCode, String zoneName, String branchCode, String branchName, String dateOfBirth, String dateOfRetirement, String unionCode) {
    	def z = Zone.findWhere(code : zoneCode)
    	def b = Branch.findWhere(code : branchCode)
    	def uTemp = User.findWhere(username : username)
    	if(z == null){
    		try{
    			z = new Zone(name : zoneName, code : zoneCode).save(flush:true)		
    		} finally{}
    	}
		
		if(b == null){
    		try{
    			b = new Branch(name : branchName, code : branchCode, zone : z).save(flush:true)	
    		} finally{}
    	}
    	
    	if(uTemp == null){
    		try{
    			def u = new User(username : username, name : name, emailId : emailId, designation : designation, gender : gender, contactNo : contactNo, zone : z, branch : b, dateOfBirth : dateOfBirth, dateOfRetirement : dateOfRetirement, unionCode : unionCode).save(flush:true)	
    		} finally{}
    	}
        else{
            try{ 
                uTemp.designation = designation
                uTemp.contactNo = contactNo
                uTemp.zone = z
                uTemp.branch = b
                uTemp.unionCode = unionCode
                uTemp.save(flush:true)  
            } 
            finally{}   
        }
    }

    
    def saveZone(String name, String code){
    	def zTemp = Zone.findWhere(code : code)
    	if(zTemp == null){
    		def z = new Zone(name : name, code : code).save(flush:true)	
    	}
    }

    def saveBranch(String name, String code, String zoneCode){
    	def zTemp = Zone.findWhere(code : zoneCode)
    	def bTemp = Branch.findWhere(code : code)
    	if(bTemp == null){
    		def z = new Branch(name : name, code : code, zone : zTemp).save(flush:true)	
    	}
    }

//    @Async
    def saveScale(String name){
    	def sTemp = Scale.findWhere(name : name)
    	if(sTemp == null){
    		def z = new Scale(name : name).save(flush:true)	
    	}
    }
}
