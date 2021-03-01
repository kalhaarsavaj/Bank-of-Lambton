package com.bankapp.pkg.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bankapp.pkg.dao.BankingDao;

import utilites.common_constants;

/**
 * Servlet implementation class DepositServlet
 */
@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DepositServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String ToAccountNum = request.getParameter("deposit_account");
		String Amount = request.getParameter("deposit_amount").toString();
		
		
		// Converting to account name to number
		if (ToAccountNum.equals(common_constants.SAV)) {
			ToAccountNum = BankingDao.getAccountNumber(session.getAttribute("Username").toString(),
					common_constants.SAV);
		} else if (ToAccountNum.equals(common_constants.CRD)) {
			ToAccountNum = BankingDao.getAccountNumber(session.getAttribute("Username").toString(),
					common_constants.CRD);
		} else {
			ToAccountNum = BankingDao.getAccountNumber(session.getAttribute("Username").toString(),
					common_constants.CHQ);
		}
		BankingDao.depositMoney(ToAccountNum, Double.parseDouble(Amount),"");
		response.sendRedirect(request.getHeader("referer"));
	}

}
