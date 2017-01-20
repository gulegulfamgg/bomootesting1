package auth
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import bomoo.*


@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username		// PF Number
	String password = "changeit"

	String emailId = "changeit"
	String designation = "changeit"
	String name = "changeit"
	String gender = "changeit"
	String contactNo = "changeit"
	
	String	dateOfBirth = "Date"
	String	dateOfRetirement = "Date"

	String unionCode = "3"

	Branch	branch
	Zone	zone

	String otp = "0"

	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false

	int updateVersion = 0

	User(String username, String name, String emailId, String designation, String gender, String contactNo, Branch branch, Zone zone, String dateOfBirth, String dateOfRetirement, String unionCode) {
		this()
		this.username = username
		
		this.name = name
		this.gender = gender
		this.contactNo = contactNo
		this.emailId = emailId
		this.designation = designation
		this.branch = branch
		this.zone = zone
		this.dateOfBirth = dateOfBirth
		this.dateOfRetirement = dateOfRetirement
		this.unionCode = unionCode
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		emailId blank: true, nullable: true
		contactNo blank: true, nullable: true
		designation blank: true, nullable: true
		name blank: true, nullable: true
		otp blank: true, nullable: true
		branch blank: false, nullable: false
		dateOfRetirement nullable : true, blank : true
		dateOfBirth nullable : true, blank : true
	}

	static mapping = {
		password column: '`password`'
		table "users"
	}
}
