package com.cems.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cems.dao.connection;
import com.cems.dao.UserDAO;
import com.cems.model.User;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  

		
		//PrintWriter out = response.getWriter();
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		


		User login = new User();
		login.setUname(uname);
		login.setPassword(password);

		UserDAO ldao = new UserDAO(connection.getConnection());

		if (ldao.validate(login)) {
			//response.sendRedirect("welcome.jsp");
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");  
	        rd.forward(request,response);  
		} else {
			//response.sendRedirect("errorlogin.jsp");
			//out.print("Sorry username or password error");  
	        //RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
	        //rd.include(request,response); 
			//request.setAttribute("error","Invalid Username/password");
	        request.setAttribute("errorMessage", "Wrong credentials!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
		}	}

}
