<%@page import="java.io.PrintWriter"%>
<%@page import="schoolmanagement.Student"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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
String regno = request.getParameter("regno") ;

EntityManagerFactory emf = Persistence.createEntityManagerFactory("Shiva") ;
EntityManager em = emf.createEntityManager() ;

Query query = em.createQuery("select a from Student a where reg_no = ?1") ;
query.setParameter(1, Integer.valueOf(regno)) ;
List<Student> students = query.getResultList() ;
if(students.isEmpty()) {
	
	out.write("Data not available for this Reg No ");
	RequestDispatcher rd = request.getRequestDispatcher("viewstudent.html") ;
	rd.include(request, response);
	response.setContentType("text/html");
}else {
%>
<table cellpadding="10px">
	<tr>
	<td><%= "ID" %></td>
	<td><%= "Name" %></td>
	<td><%= "Reg.NO" %></td>
	<td><%= "Fees" %></td>
	</tr>
	<% for(Student student : students) {%>
	 <tr>
	 <td><%= student.getId() %></td>
	 <td><%= student.getName() %></td>
	 <td><%= student.getReg_no() %></td>
	 <td><%= student.getFees() %></td>
	<% } }%>
</table>
</body>
</html>