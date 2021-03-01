package com.bankapp.pkg.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bankapp.pkg.dao.UserDAO;
import com.bankapp.pkg.models.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			UserBean user = new UserBean();
			user.setUserName(request.getParameter("login_email"));
			user.setPassword(request.getParameter("login_password"));

			user = UserDAO.login(user);
			
			if (user.getUsername().contentEquals("admin@gmail.com")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				session.setAttribute("Username", user.getUsername());
				response.sendRedirect("admin_index.jsp");
				response.sendRedirect("header.jsp?name=adminlogout");
			} else {
				if (user.isValid()) {

					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser", user);
					session.setAttribute("Username", user.getUsername());
					response.sendRedirect("dashboard.jsp?name=" + user.getFirstName() + " " + user.getLastName()
							+ "&&username=" + user.getUsername()); // logged-in
						}

				else
					response.sendRedirect("Invalid_user.jsp"); // error page

			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
