<%-- 
    Document   : index
    Created on : Apr 1, 2025, 1:46:55 PM
    Author     : floppydisk
--%>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revisão</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Bem vindo!</h1>
        <h1>Agora são: <%= new Date() %></h1>
    </body>
</html>
