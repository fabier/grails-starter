# grails-starter
A starter project for Grails with **Bootstrap**, **PostgreSQL 9.4**, **RestAPI** and **AngularJS**.

Uses **SpringSecurity** for authentication

Uses **mail plugin** to send confirmation emails and "recover password" email.


## Configuration

### Security

By default, **email** is the user's login. This can be changed to **username** if needed by modifying both <code>User.groovy</code> and <code>Config.groovy</code>.

> in User.groovy change :

```groovy
static constraints = {
    username blank: false
    password blank: false
    email email: true, unique: true
    creator nullable: true
}
```
to :
```groovy
static constraints = {
    username blank: false, unique: true
    password blank: false
    email email: true
    creator nullable: true
}
```
> in Config.groovy change :

```groovy
grails.plugin.springsecurity.userLookup.usernamePropertyName = 'email'
```
to :
```groovy
grails.plugin.springsecurity.userLookup.usernamePropertyName = 'username'
```

### Mail server
Open <code>Config.groovy</code>, and modify the following lines to your needs :
> Config.groovy

```groovy
// Configuration pour le serveur de mail
grails {
  mail {
    host = "smtp.XXXXXXXXXXX.com"
    port = 587
    username = "XXXXXXXXXXX@XXXXXXXXXXX.com"
    password = "XXXXXXXXXXX"
    props = ["mail.smtp.auth"                  : "true",
             "mail.smtp.socketFactory.port"    : "587",
             "mail.smtp.socketFactory.class"   : "javax.net.ssl.SSLSocketFactory",
             "mail.smtp.socketFactory.fallback": "true"]
  }
}
```
Like this for example :
> Config.groovy

```groovy
// Configuration pour le serveur de mail
grails {
  mail {
    host = "smtp.gmail.com"
    port = 587
    username = "randomuser@gmail.com"
    password = "mypassword_is_*AW50me*!"
    props = ["mail.smtp.auth"                  : "true",
             "mail.smtp.socketFactory.port"    : "587",
             "mail.smtp.socketFactory.class"   : "javax.net.ssl.SSLSocketFactory",
             "mail.smtp.socketFactory.fallback": "true"]
  }
}
```
