package mypackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lista")
public class Lista extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service (HttpServletRequest request,
                            HttpServletResponse response)
            throws  ServletException, IOException {

		DAO dao = null;
		try {
			dao = new DAO();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List<Pessoas> pessoas = dao.getLista();
		
		PrintWriter out = response.getWriter();
		out.println("<html><body><table border='1'>");
		out.println("<tr><td>ID</td><td>Nome</td>" + 
                    "<td>Nascimento</td><td>Altura</td><td>Passaporte</td></tr>");
		for (Pessoas pessoa : pessoas) {
	         out.println("<tr><td>" + pessoa.getId() + "</td>");
	         out.println("<td>" + pessoa.getNome() + "</td>");
	         out.println("<td>" + pessoa.getNascimento().getTime() + "</td>");
	         out.println("<td>" + pessoa.getAltura() + "</td>");	  
	         out.println("<td>" + pessoa.getPassaporte() + "</td></tr>");	         

		}
		out.println("</table></body></html>");
		out.println("<form action='/Aula11/remove'>");
		out.println("<input type='submit' value='Remover registro existente' </input>");
		out.println("</form>");
        
		dao.close();
        
    } 
}