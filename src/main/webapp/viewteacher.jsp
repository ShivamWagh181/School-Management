<%@page import="schoolmanagement.Teacher"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id") ;


	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Shiva") ;
	EntityManager em = emf.createEntityManager() ;
	EntityTransaction et = em.getTransaction() ;
	
	Teacher t = em.find(Teacher.class, Integer.valueOf(id)) ;
	
%>
<table cellpadding="10px">
	<tr>
	<td><%= "ID" %></td>
	<td><%= "Name" %></td>
	<td><%= "Salary" %></td>
	</tr>
	 <tr>
	 <td><%= t.getId() %></td>
	 <td><%= t.getName() %></td>
	 <td><%= t.getSalary() %></td>
</table>
</body>
</html>