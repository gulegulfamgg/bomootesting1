package bomoo

import grails.transaction.Transactional
import auth.User

@Transactional
class SaveDataService {
	def saveBlog(User u, String title, String subHeading, String content, Img img) {
    	def b = new Blog(title : title, content : content, subHeading : subHeading, img : img, postedBy: u).save(flush:true)
    }

    def saveEvent(User u, String title, String content, ArrayList imgs) {
    	def e = new Event(title : title, content : content, postedBy: u).save(flush:true)

    	imgs.each {
    		e.addToImages(it)
    	}

    	e.save()
    }

    def saveMessage(User u, String content){
    	def m = new Message(content : content, postedBy: u).save(flush:true)
    }

    def saveNews(User u, String title, String content, Img img){
    	def n = new News(title : title, content : content, img : img, postedBy : u).save(flush:true)
    }

    def saveNotice(User u, String content, String title){
    	def n = new Notice(title : title, content : content, postedBy : u).save(flush:true)
    }

    def saveImage(byte[] imgCode, String imgType){
    	def i = new Img(imageData : imgCode, imageType : imgType).save(flush:true)
        return i
    }

    def saveUser(String username, String name, String emailId, String designation, String gender, String contactNo, Branch branch, Zone zone, String dateOfBirth, String dateOfRetirement, String unionCode){
        def u = new User(username : username, name : name, emailId : emailId, designation : designation, gender : gender, contactNo : contactNo, branch : branch, zone : zone, dateOfBirth : dateOfBirth, dateOfRetirement : dateOfRetirement, unionCode : unionCode).save(flush:true)
    }
}
