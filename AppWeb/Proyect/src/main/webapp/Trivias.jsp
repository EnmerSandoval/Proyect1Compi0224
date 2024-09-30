<%--
  Created by IntelliJ IDEA.
  User: laptop
  Date: 23/09/2024
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.servidor.Objects.*"%>
<html>
<head>
    <title>Mis Trivias</title>
    <jsp:include page="WEB-INF/pages/header/head.jsp"/>
</head>
<body>
    <jsp:include page="WEB-INF/pages/header/NavBarHome.jsp"/>
    <div class="col-auto p-5 text-center">
        <h1 class="display-1">Mis trivias</h1>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Id</th>
                <th scope="col">Nombre</th>
                <th scope="col">Tema</th>
                <th scope="col">Fecha de Creacion</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td>@fat</td>
            </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
