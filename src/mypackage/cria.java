package mypackage;
import java.io.*;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/cria")
public class cria extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, 
                         HttpServletResponse response) 
    		             throws ServletException, IOException {
      PrintWriter out = response.getWriter();
	out.println("<html><body>");
	out.println("<form method='post'>");
	out.println("Nome: <input type='text' name='nome'><br>");
	out.println("Nascimento: <input type='date' name='nascimento'><br>");
	out.println("Altura: <input type='number' name='altura' step='0.01'><br>");
	out.println("Passaporte: <input type='text' name='passaporte'><br>");
	out.println("<input type='submit' value='Submit'>");
	out.println("</form>");
	out.println("<form action='/Aula11/remove'>");
	out.println("<input type='submit' value='Remover registro existente' </input>");
	out.println("</form>");
	out.println("<body><html>");
    }
	
    @Override
    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response) 
    		throws ServletException, IOException {
	
    	DAO dao = null;
		try {
			dao = new DAO();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

    	Pessoas pessoa = new Pessoas();
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
		
    	dao.adiciona(pessoa);
		
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("adicionado" + pessoa.getNome());
        out.println("</body></html>");
		
	  dao.close();

    } 
}