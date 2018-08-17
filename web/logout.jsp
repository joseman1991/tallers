<%-- 
    Document   : logout
    Created on : 12-jul-2018, 22:35:00
    Author     : JOSE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar Sesión</title>
    </head>
    <body>
        <%
            session.setAttribute("usuario", null);
            session.setAttribute("listaItems", null);
            //session.setAttribute("lista", null);
            session.setAttribute("reserva", null);
            session.invalidate();
            
            response.sendRedirect("Bienvenido");
        %>
    </body>
</html>
