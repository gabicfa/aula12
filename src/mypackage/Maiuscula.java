package mypackage;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/maiuscula")
public class Maiuscula extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        out.println(request.getParameter("texto").toUpperCase());
    } 	
}