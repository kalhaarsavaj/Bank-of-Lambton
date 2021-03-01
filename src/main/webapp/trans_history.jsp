<%@page import="utilites.common_constants"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bankapp.pkg.dao.BankingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
	
</script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<style>
.tabs .indicator {
	background-color: #ffffff;
}

.tabs .tab a:hover, .tabs .tab a.active {
	background-color: rgb(216 216 216/ 20%);
}

.tabs .tab a:focus, .tabs .tab a:focus.active {
	background-color: rgb(216 216 216/ 20%);
}
</style>
</head>
<body>
	<%-- <% %> --%>
	<div id="savings_transaction_history_modal" class="modal">
		<div class="modal-content">
			<%
				ArrayList<String> sav_trans = new ArrayList<>();
			sav_trans = BankingDao.getTransactions(
					BankingDao.getAccountNumber(session.getAttribute("Username").toString(), common_constants.SAV));
			%>
			<h4 class="black">Transaction History</h4>
			<div class="row">
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Description</th>
							<th>Amount</th>
							<th>Date and Time</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < sav_trans.size(); i++) {
							String data[] = sav_trans.get(i).split(" ");
							
						%>

						<tr>
							<td><%=data[1]%></td>
							<td>$<%=data[0]%></td>
							<td><%=data[2]%><span> </span><%=data[3] %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="chequing_transaction_history_modal" class="modal">
		<div class="modal-content">
			<%
				ArrayList<String> chq_trans = new ArrayList<>();
			chq_trans = BankingDao.getTransactions(
					BankingDao.getAccountNumber(session.getAttribute("Username").toString(), common_constants.CHQ));
			%>
			<h4 class="black">Transaction History</h4>
			<div class="row">
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Description</th>
							<th>Amount</th>
							<th>Date and Time</th>
						</tr>
					</thead>
					<tbody>
					<%
							for (int i = 0; i < sav_trans.size(); i++) {
							String data[] = sav_trans.get(i).split(" ");
							
						%>

						<tr>
							<td><%=data[1]%></td>
							<td>$<%=data[0]%></td>
							<td><%=data[2]%><span> </span><%=data[3] %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="credit_transaction_history_modal" class="modal">
		<div class="modal-content">
			<%
				ArrayList<String> cred_trans = new ArrayList<>();
			cred_trans = BankingDao.getTransactions(
					BankingDao.getAccountNumber(session.getAttribute("Username").toString(), common_constants.CRD));
			%>
			<h4 class="black">Transaction History</h4>
			<div class="row">
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Description</th>
							<th>Amount</th>
							<th>Date and Time</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < sav_trans.size(); i++) {
							String data[] = sav_trans.get(i).split(" ");
							
						%>

						<tr>
							<td><%=data[1]%></td>
							<td>$<%=data[0]%></td>
							<td><%=data[2]%><span> </span><%=data[3] %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>