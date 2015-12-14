<html>

<head>
    <title><g:message code="default.forgotPassword" default="Forgot password ?"/></title>
    <meta name='layout' content='main'/>
</head>

<body>

<p/>

<div class="container">
    <div class="row">
        <div class="col-md-6 center-block">
            <div class="jumbotron header-background nomargin-left-right">
                <g:if test='${emailSent}'>
                    <br/>
                    <g:message code='spring.security.ui.forgotPassword.sent'/>
                </g:if>
                <g:else>
                    <form action='forgotPassword' method='POST' id="forgotPasswordForm" name="forgotPasswordForm"
                          class="form-horizontal">
                        <h4><g:message code='spring.security.ui.forgotPassword.description'/></h4>
                        <div class="form-group">
                            <label for="username" class="col-md-4 control-label">
                                <g:message code="default.email" default="Email"/>
                            </label>

                            <div class="col-md-8">
                                <input name="username" id="username" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    <g:message code="default.login" default="Se connecter"/>
                                </button>
                                <span class="text-small margin-left-20">
                                    <g:link controller='register' action='forgotPassword'>
                                        <g:message code="default.forgotPassword"
                                                   default="Mot de passe oublié ?"/>
                                    </g:link>
                                </span>
                            </div>
                        </div>
                    </form>
                </g:else>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#username').focus();
    });
</script>

</body>
</html>
