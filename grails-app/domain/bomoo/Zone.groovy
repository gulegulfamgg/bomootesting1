package bomoo
import auth.*

class Zone {

    String name
    String code

    Zone(String name, String code) {
        this()
        this.name = name
        this.code = code
    }

    static constraints = {
        name nullable: false, blank: false
        code nullable: false, blank: false, unique: true	
    }
}
