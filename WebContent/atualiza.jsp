<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,mypackage.*,javax.servlet.*,java.sql.SQLException,java.text.*"   %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	DAO dao = null;
	try {
		dao = new DAO();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	Pessoas pessoa = new Pessoas();
	pessoa.setId(Integer.valueOf(request.getParameter("id")));
	pessoa.setNome(request.getParameter("nome"));   
	pessoa.setAltura(Double.valueOf(request.getParameter("altura")));
	String nascimento = request.getParameter("nascimento");
	Date data = null;
	try {
		data = new SimpleDateFormat("yyyy-MM-dd").parse(nascimento);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	Calendar dataNascimento = Calendar.getInstance();
	dataNascimento.setTime(data);
	pessoa.setNascimento(dataNascimento);
	pessoa.setPassaporte(request.getParameter("passaporte"));


	dao.altera(pessoa);

	dao.close();
	%>
	<div class="container">
		<h2>${ param.nome } foi atualizado(a)</h2>
	</div>
</body>
</html>