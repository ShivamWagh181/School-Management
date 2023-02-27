package schoolmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/createaccount")
public class CreateAccountServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   String name= req.getParameter("name");
	   String age= req.getParameter("age");
	   String email = req.getParameter("email");
	   String mobileno= req.getParameter("mobileno");
	   String password= req.getParameter("password");
	   
	   
	   EntityManagerFactory emf = Persistence.createEntityManagerFactory("Shiva");
	   EntityManager em = emf.createEntityManager();
	   EntityTransaction et = em.getTransaction();
	   	   
//		check the email is already register or not if it is already register 
//		then display msg and redirect to registration page.
	   
	   Query q =em.createQuery("select a from Principle a where Email = ?1");
	   q.setParameter(1, email) ;
	   
	   List<Principle> principle1 = q.getResultList();
	   
	   if(principle1.isEmpty()) {
		   Principle pr = new Principle();
		   pr.setName(name);
			pr.setAge(Integer.valueOf(age));
			pr.setMobileNo(Long.valueOf(mobileno));
			pr.setEmail(email);
			pr.setPassword(password);
			
		   et.begin();
		   em.persist(pr);
		   et.commit();
		   
		   PrintWriter out = resp.getWriter();
		   out.write("Succesfully Register");
		   RequestDispatcher rd = req.getRequestDispatcher("LoginForm.html");
		   rd.include(req, resp);
		   resp.setContentType("text/html");
	   }
	   else {
		   PrintWriter out = resp.getWriter() ;
			out.write("This email is already register !");
			RequestDispatcher rd = req.getRequestDispatcher("account.html") ;
			rd.include(req, resp);
			resp.setContentType("text/html");	   
		   
	   }
	   	
	}
   
}
