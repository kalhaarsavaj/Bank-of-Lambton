package com.bankapp.pkg.dao;

import com.bankapp.pkg.models.UserBean;

import utilites.ConnectionManager;
import utilites.common_constants;

import java.sql.*;

public class UserDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;

	public static UserBean login(UserBean bean) {

		// preparing some objects for connection
		Statement stmt = null;

		String username = bean.getUsername();
		String password = bean.getPassword();

		String searchQuery = "select * from customers where Username='" + username + "' AND password='" + password
				+ "'";
		String AdminQuery = "SELECT * FROM `admin_user` WHERE username='" + username + "' AND password='" + password
				+ "'";

		// "System.out.println" prints in the console; Normally used to trace the
		// process
		System.out.println("Your user name is " + username);
		System.out.println("Your password is " + password);
		System.out.println("Query: " + AdminQuery);

		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(AdminQuery);
			boolean checkadmin = rs.next();
//			System.out.println(rs.getString(0)+"0kkkkkkkkkkkkkkkk");
			if (!checkadmin) {
				rs= null;
				rs = stmt.executeQuery(searchQuery);
				boolean more = rs.next();
//				currentCon.close();
				// if user does not exist set the isValid variable to false
				if (!more) {
					System.out.println("Sorry, you are not a registered user! Please sign up first");
					bean.setValid(false);
				}

				// if user exists set the isValid variable to true
				else if (more) {

					String firstName = rs.getString("FirstName");
					String lastName = rs.getString("LastName");

					System.out.println("Welcome " + firstName);
					bean.setFirstName(firstName);
					bean.setLastName(lastName);
					bean.setUserName(rs.getString("Username"));
					bean.setValid(true);
				}
			} else {
				bean.setUserName(rs.getString("username"));
			}

		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
//			System.out.println(rs.getString(0)+"0kkkkkkkkkkkkkkkk");
		}

		// some exception handling
		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
				}
				stmt = null;
			}

			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}

				currentCon = null;
			}
		}

		return bean;

	}

	public static Boolean signup(UserBean bean) {

		// preparing some objects for connection
		Statement stmt = null;
		int result = 0;
		Boolean response_flag = false;

//	      String searchQuery =
//	            "select * from account_details where username='"
//	                     + username
//	                     + "' AND password='"
//	                     + password
//	                     + "'";
		String INSERT_USERS_SQL = "INSERT INTO customers"
				+ "  ( Username, Password, FirstName, LastName, Phone, SIN, Passport, Address, ZipCode,  DOB) "
				+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		// "System.out.println" prints in the console; Normally used to trace the
		// process
		System.out.println("Your user name is ======>" + bean.getAddress());
//	   System.out.println("Your password is " + password);
//	   System.out.println("Query: "+searchQuery);
//		    
		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
//	      stmt.executeUpdate(INSERT_USERS_SQL);	        
//	      boolean more = rs.next();
//	      currentCon.close();
			PreparedStatement preparedStatement = currentCon.prepareStatement(INSERT_USERS_SQL);
//	            preparedStatement.setInt(1, 1);
			preparedStatement.setString(1, bean.getUsername());
			preparedStatement.setString(2, bean.getPassword());
			preparedStatement.setString(3, bean.getFirstName());
			preparedStatement.setString(4, bean.getLastName());
			preparedStatement.setString(5, bean.getPhoneNo());
			preparedStatement.setString(6, bean.getSin());
			preparedStatement.setString(7, bean.getPassportNo());
			preparedStatement.setString(8, bean.getAddress());
			preparedStatement.setString(9, bean.getZipCode());
//	            preparedStatement.setTimestamp(10, null);
			preparedStatement.setString(10, bean.getDOB());

//	            preparedStatement.setBoolean(13, bean.isSav_acc());
//	            preparedStatement.setBoolean(14, bean.isCredit_acc());

			result = preparedStatement.executeUpdate();
			if (result > 0) {
				String[] accounts_selected = new String[3];
				accounts_selected[0] = bean.isChq_acc() == true ? common_constants.CHQ : null;
				accounts_selected[1] = bean.isSav_acc() == true ? common_constants.SAV : null;
				accounts_selected[2] = bean.isCredit_acc() == true ? common_constants.CRD : null;
				String INSERT_ACC_SQL = "INSERT INTO accounts" + "  ( customers_Username, AccountType, Balance) "
						+ " values ( ?, ?, ?)";
				System.out.println("///////////" + accounts_selected[1]);
				try {

					for (int i = 0; i < 3; i++) {
						if (accounts_selected[i] != null) {

							stmt = currentCon.createStatement();
							PreparedStatement preparedSmt = currentCon.prepareStatement(INSERT_ACC_SQL);
							preparedSmt.setString(1, bean.getUsername());
							preparedSmt.setString(2, accounts_selected[i]);
							preparedSmt.setDouble(3, 0);
							result = preparedSmt.executeUpdate();
						}
					}

				} catch (Exception ex) {
					response_flag = false;
					System.out.println("Log In failed: An Exception has occurred! " + ex);
				}
			}
			response_flag = true;
		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
		}

		// some exception handling
		finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				currentCon.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return response_flag;

	}
}
