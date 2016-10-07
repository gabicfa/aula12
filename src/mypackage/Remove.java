package mypackage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.*;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet("/remove")
public class Remove extends HttpServlet {

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
		out.println("Remover registro cujo passaporte é: <input type='text' name='passaporte'><br>");
		out.println("<input type='submit' value='Submit'>");
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
					
		dao.remove(String.valueOf(request.getParameter("passaporte")));
		
       		PrintWriter out = response.getWriter();
       		out.println("<html><body>");
       		out.println("removido");
       		out.println("</body></html>");
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	 dao.close();
    } 
}