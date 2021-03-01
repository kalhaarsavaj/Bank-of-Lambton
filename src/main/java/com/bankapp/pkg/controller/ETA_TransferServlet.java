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
 * Servlet implementation class ETA_TransferServlet
 */
@WebServlet("/ETA_TransferServlet")
public class ETA_TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ETA_TransferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String FromAccountNum = request.getParameter("eta_From");
		String ToEmail = request.getParameter("to_email_eta");
		String Amount = request.getParameter("amount_eta").toString();
		String message = request.getParameter("eta_message");
		// Converting from account name to number
		if (FromAccountNum.equals(common_constants.SAV)) {
			FromAccountNum = BankingDao.getAccountNumber(session.getAttribute("Username").toString(),
					common_constants.SAV);
		} else if (FromAccountNum.equals(common_constants.CRD)) {
			FromAccountNum = BankingDao.getAccountNumber(session.getAttribute("Username").toString(),
					common_constants.CRD);
		} else {
			FromAccountNum = BankingDao.getAccountNumber(session.getAttribute("Username").toString(),
					common_constants.CHQ);
		}

		System.out.println(
				"Transfering from:" + FromAccountNum + " To:" + ToEmail + " Amount:" + Double.parseDouble(Amount));
		BankingDao.etransfer(FromAccountNum, ToEmail, Double.parseDouble(Amount),message);
		response.sendRedirect(request.getHeader("referer"));
	}

}
