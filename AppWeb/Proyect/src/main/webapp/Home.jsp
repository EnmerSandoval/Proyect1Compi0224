<%--
  Created by IntelliJ IDEA.
  User: laptop
  Date: 23/09/
  Time: 00:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.servidor.Objects.User"%>
<html>
<head>
    <title>Home</title>
    <jsp:include page="WEB-INF/pages/header/head.jsp"/>
</head>
<body>
    <jsp:include page="WEB-INF/pages/header/NavBarHome.jsp"/>
    <div class="col-auto p-5 text-center">
        <%
            User user = (User) session.getAttribute("user");
            if(user != null) {
                out.print("<strong><h1>BIENVENIDO " + user.getUsername()+"</h1></strong>");
            } else {
                out.print("<strong> Usuario no encontrado. </strong>");
            }
        %>
    </div>
    <div class="col-auto p-5 text-center">
        <img src="resources/logo.jpg" width="500" alt="500">
    </div>

</body>
</html>
