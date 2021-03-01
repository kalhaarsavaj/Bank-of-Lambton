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
.withdraw_form .row {
	margin-bottom: 0px !important;
}

.withdraw_form .row .col {
	margin-bottom: 0px !important;
}

.tabs .indicator {
	background-color: #ffffff;
}

.tabs .tab a:hover, .tabs .tab a.active {
	background-color: rgb(216 216 216/ 20%);
}

.tabs .tab a:focus, .tabs .tab a:focus.active {
	background-color: rgb(216 216 216/ 20%);
}

h4 {
	text-align: center;
	color: white;
	padding: 10px;
}
</style>
</head>
<body>

	<!-- Modal Structure -->

	<div id="eta" class="col s12">
		<%
			ArrayList<String> type = new ArrayList<>();
		type = BankingDao.getAccType(session.getAttribute("Username").toString());
		%>
		<h4 style="text-align: center" class="black lighten-3">WITHDRAW</h4>
		
		<form action="WithdrawServlet" method="post"
			class="col s12 withdraw_form" style="text-align: center">
			<div class="row">
				<div class="input-field col s12">
					<select id="withdraw_acc" name="withdraw_acc">
						<option value="" disabled selected>Choose your option</option>
						<%
							for (int i = 0; i < type.size(); i++) {
							String data[] = new String[2];
							data[0] = type.get(i);
						%>
						<option value=<%=data[0]%>><%=data[0]%> Account</option>
						<%
							}
						%>

					</select> <label>From: </label>
				</div>

			</div>
			<div class="row">
				<div class="input-field col s12">
					<input placeholder="$0.00" id="withdraw_amount"
						name="withdraw_amount" type="number" min="1" class="validate" required>
					<label for="withdraw_amount">Amount:</label>
				</div>

			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="date_eta" value="23 August 2020" type="text" disabled
						class="validate"> <label for="withdraw_date">Date:</label>
				</div>
			</div>

			<button class="waves-effect waves-light btn-large black"
				style="color: white; margin: 5px" type="submit">
				Withdraw <i class="material-icons right">send</i>
			</button>
		</form>
	</div>


</body>
</html>