<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home.jsp">
            <img src="resources/logo.png" height="70" width="70">
        </a>
        <div class="collage navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link text-white" href="<%= request.getContextPath() %>/TriviasServlet">Mis Trivias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="NewTrivia.jsp">Crear Trivia</a>
                </li>
            </ul>
        </div>
        <a class="nav-link text-white ms-auto" href="index.jsp">Cerrar Session</a>
    </div>
</nav>