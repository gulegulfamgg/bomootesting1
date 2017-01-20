package bomoo
import auth.*

class Branch {

    String name
    String code
    Zone    zone

    Branch(String name, String code, Zone zone) {
        this()
        this.name = name
        this.code = code
        this.zone = zone
    }

    static constraints = {
        name nullable: false, blank: false
        code nullable: false, blank: false, unique: true
        zone nullable: false, blank: false	
    }
}
