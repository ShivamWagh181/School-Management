<%@page import="schoolmanagement.Student"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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
	
	Query query = em.createQuery("select a from Student a where id = ?1") ;
	query.setParameter(1, Integer.valueOf(id)) ;
	List<Student> students = query.getResultList() ;
	for(Student student : students )	{
%>
<form action="updatestudentform" method="post">
		<input type="number" name="id" value="<%= student.getId()%>"><br><br>
		<input type="text" name="name" value="<%= student.getName() %>"><br><br>
		<input type="number" name="regno" value="<%= student.getReg_no() %>"><br><br>
		<input type="text" name="fees" value="<%= student.getFees() %>"><br><br>
		<input type="submit" value="Update">
	</form>
<% } %>
</body>
</html>