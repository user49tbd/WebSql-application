<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./CSS/css01.css">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
<div align="center" class="c">
	<form action="viagem" method="post">
		<p><b>Viagens / Onibus</b></p>
		<table>
			<tr>
				<td><input class="cl1" id="botao_v" name="botao_v" type="submit" value="Viagem"></td>
				<td><input class="cl1" id="botao_v" name="botao_v" type="submit" value="Onibus"></td>
			</tr>
		</table>
	</form>
</div>
<div align="center">
<c:if test="${not empty erro}">
	<c:out value="${erro }"></c:out>
</c:if>
<c:if test="${not empty viagems }">
	<table border="1">
	<thead>
		<tr>
			<th><b>codigo</b></th>
			<th><b>onibus</b></th>
			<th><b>horaS</b></th>
			<th><b>horaC</b></th>
			<th><b>partida</b></th>
			<th><b>destino</b></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${viagems }" var="v">
			<tr>
				<td><c:out value="${v.codigo }"></c:out></td>
				<td><c:out value="${v.onibus }"></c:out></td>
				<td><c:out value="${v.horaS }"></c:out></td>
				<td><c:out value="${v.horaC }"></c:out></td>
				<td><c:out value="${v.partida }"></c:out></td>
				<td><c:out value="${v.destino }"></c:out></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</c:if>
<c:if test="${not empty onibus }">
	<table border="1">
	<thead>
		<tr>
			<th><b>codigo</b></th>
			<th><b>nome</b></th>
			<th><b>placa</b></th>
			<th><b>marca</b></th>
			<th><b>ano</b></th>
			<th><b>descricao</b></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${onibus }" var="o">
			<tr>
				<td><c:out value="${o.codigo }"></c:out></td>
				<td><c:out value="${o.nome }"></c:out></td>
				<td><c:out value="${o.placa }"></c:out></td>
				<td><c:out value="${o.marca }"></c:out></td>
				<td><c:out value="${o.ano }"></c:out></td>
				<td><c:out value="${o.descricao }"></c:out></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</c:if>
</div>
</div>
</body>
</html>






