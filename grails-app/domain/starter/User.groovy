package starter

class User {

    transient springSecurityService

    String username
    String password
    String email
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Date lastUpdated
    Date dateCreated
    User creator

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false
        password blank: false
        email email: true, unique: true
        creator nullable: true
    }

    static mapping = {
        table '`user`'
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role }
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
}
