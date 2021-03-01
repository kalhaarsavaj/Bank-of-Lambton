package com.bankapp.pkg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bankapp.pkg.dao.BankingDao;

/**
 * Servlet implementation class Main_Servlet
 */
@WebServlet("/Main_Servlet")
public class Main_Servlet extends HttpServlet {
	BankingDao connectDB;
	private static final long serialVersionUID = 1L;
	

    /**
     * Default constructor. 
     * @throws ClassNotFoundException 
     * @throws SQLException 
     */
    public Main_Servlet() throws ClassNotFoundException, SQLException {
        // TODO Auto-generated constructor stub
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out =  response.getWriter();
    	connectDB = new BankingDao();

		out.print("Hello Garvit....");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
