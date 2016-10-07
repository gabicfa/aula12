<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*,mypackage.*" %>
<% DAO dao = new DAO();
	double alturaPes;
	double alturaMetro;
	Calendar cal = Calendar.getInstance(); 
   	List<Pessoas> pessoas = dao.getLista();
%>
<table border='1'>       

    <tr>
    	<td>Nome</td>
    	<td>Nascimento</td>
    	<td>Altura (Pés)</td>
    </tr>
       	
   	<% for (Pessoas pessoa : pessoas ) { %>
 

    <tr>
		<td><%=pessoa.getNome()%></td>
		<td><%=pessoa.getNascimento().getTime()%></td>
		
		<%alturaMetro =  pessoa.getAltura();
		alturaPes = alturaMetro *3.28084;%>
		
		<td><%=alturaPes%></td>        
    </tr>
<% } %>
</table>

<p> <%=cal.getTime()%> </p>

</body>

</html>