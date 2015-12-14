# grails-starter
A starter project for Grails with **Bootstrap**, **PostgreSQL 9.4**, **RestAPI** and **AngularJS**.

Uses **SpringSecurity** for authentication

Uses **mail plugin** to send confirmation emails and "recover password" email.


## Configuration

### Mail server
Open <code>Config.groovy</code>, and modify the following lines to your needs :

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
Like this for example :

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
