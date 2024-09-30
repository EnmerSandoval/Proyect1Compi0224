<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <jsp:include page="WEB-INF/pages/header/head.jsp"/>
</head>
<body>
    <jsp:include page="WEB-INF/pages/header/NavBar.jsp"/>
    <div class="col-auto p-5 text-center">
        <h1 class="display-1">Login</h1>
        <p class="text-muted">Por favor ingrese el comando para poder ingresar.</p>
        <form class="FormLogin needs-validation" id="formlogin" name="user-login"  action="LoginServlet" method="POST">
            <div class="form-floating">
                <label for="text"></label><textarea class="form-control" placeholder="Ingrese la estructura xml aca" id="text" name="text" style="height: 200px"></textarea>
                <button type="submit" class="btn btn-primary">Ingresar</button>
            </div>
            <div id="positionDisplay" class="mt-2">
                <c:if test="${!empty(error)}">
                    <br>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>No se pudo completar la solicitud!</strong> ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>
        </form>
    </div>
</body>
</html>
