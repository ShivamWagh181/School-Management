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

Teacher teacher = em.find(Teacher.class, Integer.valueOf(id)) ;

if(teacher!=null) {
%>
<form action="updateteacherform" method="post">
		 ID:<input type="number" name="id" value="<%= teacher.getId()%>"><br><br>
		 Name:<input type="text" name="name" value="<%= teacher.getName()%>"><br><br>
		 Salary<input type="text" name="salary" value="<%= teacher.getSalary() %>"><br><br>
		<input type="submit" value="Update">
	</form>
<%	
}
else {
	
	out.write("for this id there is no teacher is present.");
	RequestDispatcher rd = request.getRequestDispatcher("updateteacher.html") ;
	rd.include(request, response);
	response.setContentType("text/html");
}


%>
</body>
</html>