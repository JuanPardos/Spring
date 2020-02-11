<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome page</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/cosmo/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<form:form action="insert" method="post" modelAttribute="trainer">
		<span>nombre del entrenador:</span>
		<form:input type="text" path="name" />
		<input type="submit" value="Guardar nombre entrenador" />
	</form:form>
	<br />
	<br /> El nombre del entrenador es
	<span><c:out value="${trainer.name}" /></span>
	<br />
	<br />
	<br />


	<form:form action="insert" method="post" modelAttribute="trainer">
		<span>nuevo pokemon:</span>
		<span>nombre:</span>
		<form:input type="text" path="pokemon.name" />
		<span>nivel:</span>
		<form:input type="text" path="pokemon.level" />
		<input type="submit" value="guardar pokemon" />
	</form:form>
	<br/>
	<table border="1">
		<thead>
			<tr>
				<td>Nombre</td>
				<td>Estado</td>
				<td>Nivel</td>
				<td>HP</td>
				<td>Ataque</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${trainer.team.pokemons}">
				<tr>
					<td style="text-align:center"><c:out value="${item.name}" /></td>
					<td style="text-align:center"><c:out value="${item.status}" /></td>
					<td style="text-align:center"><c:out value="${item.level}" /></td>
					<td style="text-align:center"><c:out value="${item.HP}" /></td>
					<td style="text-align:center"><c:out value="${item.attack}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
	
	<form:form action="switchPokemon" method="post" modelAttribute="trainer">
		<form:select path="aux">
			<c:set var = "count" scope = "page" value = "0"/>
			<c:forEach var="item" items="${trainer.team.pokemons}">
				<form:option value="${count}"><c:out value="${item.name}"/></form:option>
				<c:set var="count" value="${count + 1}" scope="page"/>
			</c:forEach>
		</form:select>
		<input type="submit" value="Cambiar pokemon activo" />
	</form:form>
	<br/><br/>
	<form:form action="createEnemy" method="post" modelAttribute="enemy">
		<input type="submit" value="Entrar a la hierba alta"/>
	</form:form>
	
	<br />
 	<a>Pokemon Activo</a><br/><c:out value="${trainer.primary.name}"/> &#8212;
	<c:out value="${trainer.primary.status}"/>&#8212; Nivel: &nbsp;
	<c:out value="${trainer.primary.level}"/> Vida: &nbsp;
	<c:out value="${trainer.primary.HP}"/> &#47;
	<c:out value="${trainer.primary.maxHP}"/> Ataque: &nbsp;
	<c:out value="${trainer.primary.attack}"/>
	<br/>
	<a>Pokemon Enemigo</a><br/><c:out value="${enemy.pokemon.name}"/> &#8212;
	<c:out value="${enemy.pokemon.status}"/>&#8212; Nivel: &nbsp;
	<c:out value="${enemy.pokemon.level}"/> Vida: &nbsp;
	<c:out value="${enemy.pokemon.HP}"/> &#47;
	<c:out value="${enemy.pokemon.maxHP}"/> Ataque: &nbsp;
	<c:out value="${enemy.pokemon.attack}"/>
	
</body>
</html>