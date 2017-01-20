import auth.*
import bomoo.*

class BootStrap {

    def init = { servletContext ->
    	
    // def z1 = new Zone("Site Admin Zone","Z1").save(flush:true)

    //     def b1 = new Branch("Home Branch", "B1", z1).save(flush:true)

    //     def r1 = new Role("ROLE_SITEADMIN", "Site Admin").save()
    //     def r2 = new Role("ROLE_ADMIN", "Admin").save()

    //     def u1 = new User("94241", "changeit", "gulegulfamgg@gmail.com", "SA", "M", "9424190146", b1, z1, "04/12/1991", "04/30/2050", "1").save(flush:true)
        
    //     UserRole.create u1, r2, true

    //     ArrayList zoneList = new ArrayList();
    //     zoneList.add(z1);
     
    }
    
    def destroy = {
    }

}
