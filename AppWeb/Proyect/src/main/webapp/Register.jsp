<%--
  Created by IntelliJ IDEA.
  User: laptop
  Date: 10/09/2024
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar Usuario</title>
    <jsp:include page="WEB-INF/pages/header/head.jsp"/>
</head>
<body>
    <jsp:include page="WEB-INF/pages/header/NavBar.jsp"/>
    <div class="col-auto p-5 text-center">
        <h1 class="display-1">Registrar Usuario</h1>
        <p class="text-muted">Ingrese el comando para registrarse.</p>
        <form class="FormRegister needs-validation" id="formRegister" name="register-user"  action="RegisterServlet" method="POST">
            <div class="form-floating">
                <label for="registerText"></label><textarea class="form-control" placeholder="Ingrese la estructura xml aca" id="registerText" name="registerText" style="height: 200px"></textarea>
                <button type="submit" class="btn btn-primary">Registrar</button>
            </div>
        </form>
    </div>
</body>
</html>
