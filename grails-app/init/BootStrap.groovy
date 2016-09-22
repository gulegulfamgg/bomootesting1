import auth.*
import ocp.*

class BootStrap {

    def init = { servletContext ->

    	def u = new User("pmrda", "changeit").save()
    	
        def r1 = new Role("ROLE_SITEADMIN", "Site Admin").save()
    	def r2 = new Role("ROLE_ADMIN", "Admin").save()
    	def r3 = new Role("ROLE_USER", "User").save()
    	def r4 = new Role("ROLE_ATP", "ATP").save()
    	def r5 = new Role("ROLE_TP", "TP").save()

    	UserRole.create u, r1, true

        def u1 = new User("Admin", "changeit").save()
        def u2 = new User("TP", "changeit").save()
        def u3 = new User("ATP", "changeit").save()

        def u4 = new User("User", "changeit").save()

        UserRole.create u1, r2, true
        UserRole.create u2, r5, true
        UserRole.create u3, r4, true
        UserRole.create u4, r3, true

        for(int i = 0; i <= 380; i++) {
            int randomNum = (int) (Math.random() * 2)
            for(int j = 0; j <= randomNum; j++) {
                def c = new Chalan("Shashank","Goyal","98877 12222","shanky.guru@gmail.com","Raigarh","Ted","Mosby","98989 78789","ted@mosby.com","1212","Raigarh","Raigarh",121,121,121,121,u4,new Date() - i,u3,"Submitted").save()
            }
        }

        for(int i = 0; i <= 380; i++) {
            int randomNum = (int) (Math.random() * 11)
            for(int j = 0; j <= randomNum; j++) {
                int r = (int) (Math.random() * 29)
                def c = new Chalan("Shashank","Goyal","98877 12222","shanky.guru@gmail.com","Raigarh","Ted","Mosby","98989 78789","ted@mosby.com","1212","Raigarh","Raigarh",121,121,121,121,u4,new Date() - i - r,u3,"TPApproved",new Date() - i).save()        
            }
        }

        for(int i = 0; i <= 380; i++) {
            int randomNum = (int) (Math.random() * 11)
            for(int j = 0; j <= randomNum; j++) {
                int r = (int) (Math.random() * 29)
                int p = (int) (Math.random() * 29)
                def c = new Chalan("Shashank","Goyal","98877 12222","shanky.guru@gmail.com","Raigarh","Ted","Mosby","98989 78789","ted@mosby.com","1212","Raigarh","Raigarh",121,121,121,121,u4,new Date() - i - r - p,u3,"Paid",new Date() - i - r,new Date() - i).save()        
            }
        }
    }
    
    def destroy = {
    }
}
