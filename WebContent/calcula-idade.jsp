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


<%-- 	${ param.mesN > param.mesH ?
	${ param.diaN > param.diaH ? 	
	(((param.anoH-param.anoN-1)*365)+(12-1-(param.mesN -param.mesH)*30)+30-(param.diaN-param.diaH))
	:
	(((param.anoH-param.anoN-1)*365)+(12-(param.mesN -param.mesH)*30)+(param.diaH-param.diaN))
	}
	:
	${ param.mesN = param.mesH ?
	${ param.diaN > param.diaH ? 	
	(((param.anoH-param.anoN-1)*365)+(12-1-(param.mesN -param.mesH)*30)+30-(param.diaN-param.diaH))
	:
	((param.anoH-param.anoN)*365)+(param.diaH-param.diaN)
	}
	:
	${ param.diaN > param.diaH ? 	
	((param.anoH-patam.anoN)*365)+(param.mesH-param.mesN-1)*30+(30-(param.diaN-param.diaH))
	:
	((param.anoH-patam.anoN)*365)+(param.mesH-param.mesN)*30+(param.diaH-param.diaN)
	}
	}
	} 
	ESSA EH A LOGICA CORRETA PARA ESSE EXRCICIO! POREM NAO DA PARA FAZE-LA NO FORMATO EL
	--%>
	
	A sua idade é de ${ (param.diaH-param.diaN)+(param.mesH-param.mesN)*30+(param.anoH-param.anoN) * 365 } dias. 
	
	 <font color= "red">Você está ${ (param.diaH-param.diaN)+(param.mesH-param.mesN)*30+(param.anoH-param.anoN) * 365 > 40*365 ? "velho" : "novo" }</font>	
	
	
	 	
</body>
</html>