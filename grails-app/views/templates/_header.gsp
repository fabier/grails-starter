<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link uri="/" class="navbar-brand danger">
                <span>
                    <g:img dir="images" file="favicons/favicon-32x32.png" class="logo-top-frontpage"/>
                    Grails
                </span>
            </g:link>
        </div>

        <g:if test="${backofficeAdminPage}">
            <div class="nav navbar-nav">
                <div class="admin-header-nav">
                    <span class="badge bg-danger admin-header">Administration</span>
                </div>
            </div>
        </g:if>

        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-dashboard"></i>
                        &nbsp;Link One
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-map-marker"></i>
                        &nbsp;Link Two
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-th-large"></i>
                        &nbsp;Link Three
                    </a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-user"></i>
                        &nbsp;Connexion
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-log-out"></i>
                        &nbsp;Déconnexion
                    </a>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>