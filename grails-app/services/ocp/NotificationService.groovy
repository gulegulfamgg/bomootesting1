package ocp

import grails.transaction.Transactional
import auth.User

@Transactional
class NotificationService {

    def notify(User u, String title, String text, String cntrlr, String actn) {
    	def n = new Notification(title : title, text : text, cntrlr : cntrlr, actn : actn).save(flush:true)
    	u.addToNotifications(n)
    	u.save()
    }
}
