package com.bankapp.pkg.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bankapp.pkg.dao.UserDAO;
import com.bankapp.pkg.models.UserBean;

/**
 * Servlet implementation class RegisterSevlet
 */
@WebServlet("/RegisterSevlet")
public class RegisterSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterSevlet() {
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
		System.out.println("---------------> abcdefg");
		Date today = Calendar.getInstance().getTime();
//		
		try {
			UserBean user = new UserBean();
			user.setUserName(request.getParameter("signup_email"));
			user.setPassword(request.getParameter("signup_password"));
			user.setFirstName(request.getParameter("fname"));
			user.setLastName(request.getParameter("lname"));
			user.setPhoneNo(request.getParameter("phno"));
			user.setSin(request.getParameter("sin_no"));
			user.setPassportNo(request.getParameter("passport_no"));
			user.setAddress(request.getParameter("address"));
			user.setOpen_date(today.toString());
			user.setZipCode(request.getParameter("zip_code"));
			user.setDOB(request.getParameter("dob"));

			user.setSav_acc(request.getParameter("savingacc") == null ? false : true);
			user.setCredit_acc(request.getParameter("creditacc") == null ? false : true);
//			user.setCredit_acc(request.getParameter("creditacc"));
			user.setChq_acc(true);
			System.out.println("---------------> abcdefg     " + user.getAddress());
			System.out.println(request.getParameter("creditacc"));
			boolean response_flag = UserDAO.signup(user);
			if (response_flag) {
				response.sendRedirect("index.jsp");
//				PrintWriter out = response.getWriter();
//				out.println("<meta http-equiv='refresh' content='1;URL=index.jsp'>");// redirects after 3 seconds
//				out.println("<a onclick=\"M.toast({html: 'I am a toast'})\" class=\"btn\">Toast!</a>");
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
