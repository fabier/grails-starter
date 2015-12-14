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
### SpringSecurity UI Configuration
It is possible to change the default configuration for SpringSecurity UI.
It is recommended to change the following properties
 * grails.plugin.springsecurity.ui.register.emailFrom
 * grails.plugin.springsecurity.ui.register.emailSubject
```groovy
grails.plugin.springsecurity.ui.register.postRegisterUrl = '/'
grails.plugin.springsecurity.ui.register.emailFrom = 'XXXXXXXXXXX@XXXXXXXXXXX.com'
grails.plugin.springsecurity.ui.register.emailSubject = 'XXXXXXXXXXX - Valider votre email'
grails.plugin.springsecurity.ui.register.defaultRoleNames = ['ROLE_USER']
grails.plugin.springsecurity.ui.password.validationRegex = '^.*(?=.*[a-zA-Z\\d]).*$' // Au moins quelques caractères
grails.plugin.springsecurity.ui.password.minLength = 4
grails.plugin.springsecurity.ui.password.maxLength = 64
grails.plugin.springsecurity.userLookup.usernamePropertyName = 'email'
grails.plugin.springsecurity.logout.postOnly = false
```

### Register and Forgot Password Emails
You can also change default messages used in emails sent to new registred user by modifying the following properties :
 * grails.plugin.springsecurity.ui.register.emailBody
 * grails.plugin.springsecurity.ui.register.emailBodyToInternalEmailAccount
 * grails.plugin.springsecurity.ui.forgotPassword

It is recommended to change the following properties :
 * grails.plugin.springsecurity.ui.register.emailFrom
 * grails.plugin.springsecurity.ui.register.emailSubject
 * grails.plugin.springsecurity.ui.register.emailTo
 * grails.plugin.springsecurity.ui.forgotPassword.emailFrom
 * grails.plugin.springsecurity.ui.forgotPassword.emailSubject
 * grails.plugin.springsecurity.ui.forgotPassword.emailTo

```groovy
grails {
    plugin {
        springsecurity {
            ui {
                encodePassword = false
                register {
                    emailBody = '''\
Bonjour $user.username,<br/>
<br/>
Vous venez de créer un compte sur <a href="http://www.XXXXXXXXXXX.com">XXXXXXXXXXX</a> et nous vous en remercions !<br/>
<br/>
Merci de <strong><a href="$url">cliquer ici</a></strong> pour terminer la procédure d'enregistrement, ou copier coller l'adresse suivante dans votre navigateur :<br/>
$url<br/>
<br/>
Merci de ne pas répondre à ce message automatique.<br/>
<br/>
L'équipe XXXXXXXXXXX
'''
                    emailFrom = 'XXXXXXXXXXX <XXXXXXXXXXX@XXXXXXXXXXX.com>'
                    emailSubject = 'XXXXXXXXXXX - Création de compte'
                    defaultRoleNames = ['ROLE_USER']
                    postRegisterUrl = null // use defaultTargetUrl if not set
                    emailTo = 'contact@XXXXXXXXXXX.com'
                    emailBodyToInternalEmailAccount = '''\
Bonjour,<br/>
<br/>
Un nouvel utilisateur vient d'être créé sur <a href="http://www.XXXXXXXXXXX.com">XXXXXXXXXXX</a>.<br/>
<br/>
  Nom : <b>$user.username</b><br/>
Email : <b>$user.email</b><br/>
<br/>
Merci de ne pas répondre à ce message automatique.<br/>
<br/>
L'équipe XXXXXXXXXXX
'''
                }

                forgotPassword {
                    emailBody = '''\
Hi $user.username,<br/>
<br/>
Vous, ou quelqu'un se faisant passer pour vous, venez de faire une demande de mise à zéro de votre mot de passe sur <a href="http://www.XXXXXXXXXXX.com">XXXXXXXXXXX</a>.<br/>
<br/>
Si vous n'avez pas fait cette demande, alors ignorez ce message et supprimez le, aucun changement de sera appliqué à votre compte.<br/>
<br/>
Si vous êtes bien celui qui a fait la demande, alors <a href="$url">cliquez ici</a> pour remettre à zéro votre mot de passe.
<br/>
Merci de ne pas répondre à ce message automatique.<br/>
<br/>
L'équipe XXXXXXXXXXX
'''
                    emailFrom = 'XXXXXXXXXXX <XXXXXXXXXXX@XXXXXXXXXXX.com>'
                    emailSubject = 'XXXXXXXXXXX - Réinitialisation du mot de passe'
                    postResetUrl = null // use defaultTargetUrl if not set
                }
            }
        }
    }
}
```
