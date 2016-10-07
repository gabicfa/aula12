<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<%-- 	<c:import url="cabecalho.jsp" />
 --%>    <jsp:useBean id="dao" class="mypackage.DAO"/>
<% int registros= 0; %>    
<div class="container">
	<div class="panel panel-default">
	  <div class="panel-heading">Informacoes Pessoais</div>
	    <table class="table">
	      <tr>
	            <td><b>#</b></td>
	            <td><b>id</b></td>
	            <td><b>nome</b></td>
				<td><b>data nascimento</b></td>
	            <td><b>altura</b></td>
	            <td><b>classificacao</b></td>
	            <td><b>passaporte</b></td>
	      </tr>
	      <c:forEach var="pessoa" items="${dao.lista}" varStatus="oi">
	        <tr bgcolor="#${oi.count%2 == 0 ? 'bbffcc' : 'ffffbb' }" >
	            <td>${oi.count}</td>
	            <td>${pessoa.id}</td>
	            <td>${pessoa.nome}</td>
				<td>
				<fmt:formatDate 
				    value="${pessoa.nascimento.time}"
	                pattern="yyyy/MM/dd"/>
	         	</td>
	            <td>${pessoa.altura}</td>
	            <c:if test = "${pessoa.altura < 1.5 }">
	            	<td>baixo</td>
	            </c:if> 
	            <c:if test = "${pessoa.altura < 1.8 and pessoa.altura > 1.5 }">
	            	<td>medio</td>
	            </c:if>
	            <c:if test = "${pessoa.altura>1.8 }">
	            	<td>alto</td>
	            </c:if>
	            <td>${pessoa.passaporte}</td>
	        </tr>
	        <%registros+=1; %>
	      </c:forEach>
	   
	</table>
</div>
</div>
</body>
</html>