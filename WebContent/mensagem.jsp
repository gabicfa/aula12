<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Exemplo de JSP</title>
  </head>
  <body>
  	<%-- comentario --%>
    <% String mensagem = "uma mensagem sendo inserida no html"; %>
    <% out.println(mensagem); %>
    <br />
    <% String mensagem2 = "outra forma de inserir texto"; %>
    <%= mensagem2 %>
    <br />
    <% out.println("Você está conectando da porta:" + request.getRemotePort()); %>
    <% System.out.println("Esse texto só aparece no console do Tomcat!"); %>
  </body>
</html>