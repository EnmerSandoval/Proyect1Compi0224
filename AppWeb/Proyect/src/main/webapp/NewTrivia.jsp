<%--
  Created by IntelliJ IDEA.
  User: laptop
  Date: 23/09/2024
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Trivia</title>
    <jsp:include page="WEB-INF/pages/header/NavBarHome.jsp"/>
</head>
<body>
    <jsp:include page="WEB-INF/pages/header/NavBarHome.jsp"/>
    <div class="col-auto p-5 text-center">
        <h1 class="display-1">Crear Trivia</h1>
        <p class="text-muted">Ingrese el comando para crear una trivia</p>
        <form class="FormRegisterTrivia needs-validation" id="formRegisterTrivia" name="registerTrivia"
              action="RegisterTriviaServlet" method="POST">
            <div class="form-floating">
                <label for="registerTrivia"></label>
                <textarea class="form-control" placeholder="Ingrese el comando para crear una trivia"
                id="registerTrivia" name="registerTrivia" style="height: 200px"></textarea>
                <button type="submit" class="btn btn-primary mt-3">Crear</button>
            </div>
        </form>
    </div>
</body>
</html>
