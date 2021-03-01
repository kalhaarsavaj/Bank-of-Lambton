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
.transfer_form .row {
	margin-bottom: 0px !important;
}

.transfer_form .row .col {
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

input:invalid {
	border: 2px 0px 0px 0px dashed red;
}

input:valid {
	border: 2px 0px 0px 0px solid black;
}
</style>
</head>
<body>

	<!-- Modal Structure -->

	<div class="modal-content">
		<div class="row">
			<div class="col s12">
				<ul class="tabs black">
					<li class="tab col s6"><a class="active" href="#tba"
						style="color: white">Trasnfer Between Accounts</a></li>
					<li class="tab col s6"><a href="#eta" style="color: white">E-Transfer</a></li>
				</ul>
			</div>
			<div id="tba" class="col s12">
				<%
					ArrayList<String> type = new ArrayList<>();
				type = BankingDao.getAccType(session.getAttribute("Username").toString());
				String selected_from = "";
				%>
				<form action="TBA_TransferServlet" method="post"
					class="col s12 transfer_form">
					<div class="row">
						<div class="input-field col s6">
							<select id="from_tba" name="tba_From" required>
								<option value="" disabled selected>Choose your option</option>
								<%
									for (int i = 0; i < type.size(); i++) {
									String data[] = new String[2];
									data[0] = type.get(i);
								%>
								<option value=<%=data[0]%>><%=data[0]%> Account
								</option>
								<%
									}
								%>
							</select> <label>From: </label>
						</div>
						<div class="input-field col s6">
							<select id="to_tba" name="tba_To" required>
								<option value="" disabled selected>Choose your option</option>
								<%
									for (int i = 0; i < type.size(); i++) {
									String data[] = new String[2];
									data[0] = type.get(i);
								%>
								<option value=<%=data[0]%>><%=data[0]%> Account
								</option>
								<%
									}
								%>
							</select> <label>To: </label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<input id="amount_tba" name="amount_tba" placeholder="$0.00"
								type="number" class="validate" required min="1"> <label
								for="amount_tba">Amount:</label>
						</div>
						<div class="input-field col s6">
							<input id="date_tba" name="date_tba" value="23 August 2020"
								type="text" disabled class="validate" required> <label
								for="date_tba">Date:</label>
						</div>
					</div>
					<button class="waves-effect waves-light btn-large black"
						style="color: white; margin: 5px" type="submit" name="submit_tba">
						Transfer <i class="material-icons right">send</i>
					</button>
				</form>
			</div>
			<div id="eta" class="col s12">
				<form action="ETA_TransferServlet" method="post"
					class="col s12 transfer_form">
					<div class="row">
						<div class="input-field col s6">
							<select id="from_eta" name="eta_From">
								<option value="" disabled selected>Choose your option</option>

								<%
									for (int i = 0; i < type.size(); i++) {
									String data[] = new String[2];
									data[0] = type.get(i);
								%>
								<option value=<%=data[0]%>><%=data[0]%> Account
								</option>
								<%
									}
								%>
							</select> <label>From: </label>
						</div>
						<div class="input-field col s6">
							<input id="to_email_eta" name="to_email_eta" type="email"
								class="validate" required> <label for="to_email_eta">To
								Email:</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<input id="amount_eta" name="amount_eta" placeholder="$0.00"
								type="number" class="validate" required min="1"> <label
								for="amount_eta">Amount:</label>
						</div>
						<div class="input-field col s6">
							<input id="date_eta" name="date_eta" value="23 August 2020"
								type="text" disabled class="validate" required> <label
								for="date_eta">Date:</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="eta_message" name="eta_message" type="text"
								class="validate" required> <label for="eta_message">Message:</label>
						</div>
					</div>
					<button class="waves-effect waves-light btn-large black"
						style="color: white; margin: 5px" type="submit">
						Transfer <i class="material-icons right">send</i>
					</button>
				</form>
			</div>
		</div>
	</div>
	<!-- <script type="text/javascript">
		$(document).ready(
				function() {
					$("select.from_tba").change(
							function() {
								var selectedCountry = $(this).children(
										"option:selected").val();
								alert("You have selected the country - "
										+ selectedCountry);
							});
				});
	</script> -->

</body>
</html>