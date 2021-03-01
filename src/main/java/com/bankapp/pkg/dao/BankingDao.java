package com.bankapp.pkg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utilites.ConnectionManager;

public class BankingDao {
	static Connection con;

	/* ======================================== */
	public static ArrayList<String> getTransactions(String AccNo) {
		con = ConnectionManager.getConnection();
		ArrayList<String> transactions = new ArrayList<>();
		Statement stmt;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from transactions where accounts_AccountNumber='" + AccNo
					+ "' ORDER BY date_creation DESC");
			while (rs.next()) {
				transactions.add(rs.getString(3) + " " + rs.getString(4)+" "+rs.getString("date_creation"));
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transactions;
	}

	public static ArrayList<String> getAccType(String username) {
		con = ConnectionManager.getConnection();
		
		ArrayList<String> type = new ArrayList<>();
		
		Statement stmt;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select AccountType from accounts where customers_Username='" + username + "'");
			while (rs.next()) {
				type.add(rs.getString("AccountType"));
			}
			System.out.println(type.size() + "--");
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return type;
	}

	/* ======================================== */
	public static String getAccountNumber(String username, String type) {
		con = ConnectionManager.getConnection();
		Statement stmt;
		String AccountNumber = "";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from accounts where customers_Username='" + username
					+ "' AND AccountType='" + type + "'");

			while (rs.next()) {
				AccountNumber = rs.getString(1);
				System.out.println("--------->Ac no" + AccountNumber);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return AccountNumber;
	}

	/* ======================================== */
	public static void depositMoney(String AccountNumber, Double Amount, String message) {
		con = ConnectionManager.getConnection();
		if (message.equals("")) {
			doTransactionLog(AccountNumber, Amount, "Deposit");
		} else {
			doTransactionLog(AccountNumber, Amount, message);
		}
		Amount = Amount + getBalance(AccountNumber);
		String sql = "UPDATE accounts SET Balance= ? WHERE AccountNumber=?";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setDouble(1, Amount);
			preparedStatement.setString(2, AccountNumber);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
				con = null;
			}
		}
	}

	/* ======================================== */
	public static void withdrawMoney(String AccountNumber, Double Amount, String message) {

		con = ConnectionManager.getConnection();
		if (message.equals("")) {
			doTransactionLog(AccountNumber, Amount, "Withdraw");
		} else {
			doTransactionLog(AccountNumber, Amount, message);
		}
		Amount = getBalance(AccountNumber) - Amount;
		String sql = "UPDATE accounts SET Balance= ? WHERE AccountNumber=?";
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setDouble(1, Amount);
			preparedStatement.setString(2, AccountNumber);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
				con = null;
			}
		}
	}

	/* ======================================== */
	public static double getBalance(String AccountNumber) {
		con = ConnectionManager.getConnection();
		Statement stmt;
		double bal = 0.0;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select Balance from accounts where AccountNumber='" + AccountNumber + "'");

			while (rs.next()) {
				bal = Double.parseDouble(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bal;
	}

	/* ======================================== */
	public static void doTransactionLog(String AccountNumber, Double Amount, String Description) {
		String sql = "INSERT INTO transactions (Transaction_ID, accounts_AccountNumber, Amount, Description)"
				+ "VALUES (?,?,?,?)";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			long Transaction_ID = (long) (Math.random() * Math.pow(10, 10));
			preparedStatement.setDouble(1, Transaction_ID);
			preparedStatement.setString(2, AccountNumber);
			preparedStatement.setString(3, "" + Amount);
			preparedStatement.setString(4, Description);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void transferBetweenAccounts(String FromAccountNum, String ToAccountNum, Double Amount,
			String message) {
		withdrawMoney(FromAccountNum, Amount, message);
		depositMoney(ToAccountNum, Amount, message);
	}

	public static void etransfer(String FromAccountNum, String ToUsername, Double Amount, String message) {
		withdrawMoney(FromAccountNum, Amount, message);
		depositMoney(getAccountNumber(ToUsername, "Chequing"), Amount, message);
	}

	public static Double getMyBalance(String Username) {
		con = ConnectionManager.getConnection();
		Statement stmt;
		Double MyBal = 0.0;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select sum(Balance) from accounts where customers_Username='" + Username
					+ "' AND AccountType in ('Savings', 'Chequing')");

			while (rs.next()) {
				MyBal = rs.getDouble(1);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return MyBal;
	}

	public static Double getIOwe(String Username) {
		con = ConnectionManager.getConnection();
		Statement stmt;
		Double IOwe = 0.0;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select Balance from accounts where customers_Username='" + Username
					+ "' AND AccountType='Credit'");

			while (rs.next()) {
				IOwe = rs.getDouble(1);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return IOwe;
	}
}
