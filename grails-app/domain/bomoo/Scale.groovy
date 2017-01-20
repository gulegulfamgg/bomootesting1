package bomoo

class Scale {

    String name
    
    static constraints = {
        name unique: true
    }
}
