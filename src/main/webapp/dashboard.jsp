<%@page import="com.bankapp.pkg.dao.BankingDao"%>
<%@page import="com.bankapp.pkg.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="utilites.common_constants"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BOL | Dashboard</title>
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

a.btn-large {
	width: 100%;
	padding: 0 10px;
	font-size: 1vw;
}

a i.right {
	margin-left: 10px
}
</style>
</head>
<body>
	<jsp:include page="loggedInHeader.jsp" />
	<main>
		<div style="margin: 40px 80px">
			<div class="row">
				<div class="col s6">
					<%
						String name = request.getParameter("name");
					String username = request.getParameter("username");
					%>
					<h3>
						Welcome
						<%
						out.println(name);
					%>
					</h3>
				</div>
				<div class="col s2">
					<a class="waves-effect waves-light btn-large modal-trigger"
						href="#tansfer_modal"
						style="margin-top: 30px; background-color: #f79212"><i
						class="material-icons right">autorenew</i>Transfer</a>
				</div>
				<div class="col s2">
					<a class="waves-effect waves-light btn-large modal-trigger"
						href="#withdraw_modal"
						style="margin-top: 30px; background-color: #f79212"><i
						class="material-icons right">remove_circle_outline</i>Withdraw</a>
				</div>
				<div class="col s2">
					<a class="waves-effect waves-light btn-large modal-trigger"
						href="#deposit_modal"
						style="margin-top: 30px; background-color: #f79212;"><i
						class="material-icons right">control_point</i>Deposit</a>
				</div>

			</div>
			<!-- Modal Structure -->
			<div id="tansfer_modal" class="modal">
				<div class="modal-content">
					<jsp:include page="transfer.jsp" />
				</div>
			</div>
			<div id="withdraw_modal" class="modal">
				<div class="modal-content">
					<jsp:include page="withdraw.jsp" />
				</div>
			</div>
			<div id="deposit_modal" class="modal">
				<div class="modal-content">
					<jsp:include page="deposit.jsp" />
				</div>
			</div>
			<div class="row">
				<div class="col s4 m4">
					<div class="card black darken-1">
						<div class="row">
							<div class="col S6 card-content white-text">
								<span class="card-title">My Balance:</span>
								<p>
									<%=BankingDao.getMyBalance(username)%>$
								</p>
							</div>
							<div class="col S6 card-content white-text">
								<span class="card-title">You Owe:</span>
								<p>
									<%=BankingDao.getIOwe(username)%>$
								</p>
							</div>
						</div>

						<div class="card-action">
							<a href="#" class="modal-trigger"></a>
						</div>
					</div>
				</div>
				<div class="col s4 m4">
					<div class="card black darken-1">
						<div class="card-content white-text">
							<span class="card-title">Chequing:</span>
							<p style="color: grey; font-size: 12px">
								(<%=BankingDao.getAccountNumber(username, common_constants.CHQ)%>)
							</p>
							<p>
								<%=BankingDao.getBalance(BankingDao.getAccountNumber(username, common_constants.CHQ))%>$
							</p>
						</div>
						<div class="card-action">
							<a href="#chequing_transaction_history_modal"
								class="modal-trigger">View History</a>
						</div>
					</div>
				</div>
				<%
					if (!BankingDao.getAccountNumber(username, common_constants.SAV).contentEquals("")) {
				%>
				<div class="col s4 m4">
					<div class="card black darken-1">
						<div class="card-content white-text">
							<span class="card-title">Savings Account:</span>
							<p style="color: grey; font-size: 12px">
								(<%=BankingDao.getAccountNumber(username, common_constants.SAV)%>)
							</p>
							<p>
								<%=BankingDao.getBalance(BankingDao.getAccountNumber(username, common_constants.SAV))%>$










							
						</div>
						<div class="card-action">
							<a href="#savings_transaction_history_modal"
								class="modal-trigger">View History</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
			<%
				if (!BankingDao.getAccountNumber(username, common_constants.CRD).contentEquals("")) {
			%>
			<div class="row">
				<div class="col s4 m4">
					<div class="card black darken-1">
						<div class="card-content white-text">
							<span class="card-title">Credit Account:</span>
							<p style="color: grey; font-size: 12px">
								(<%=BankingDao.getAccountNumber(username, common_constants.CRD)%>)







							
							<p>
								Available Limit:
								<%=1000 + BankingDao.getBalance(BankingDao.getAccountNumber(username, common_constants.CRD))%>$
							</p>

							<p>
								You owe:
								<%=BankingDao.getBalance(BankingDao.getAccountNumber(username, common_constants.CRD))%>$
							</p>
						</div>
						<div class="card-action">
							<a href="#credit_transaction_history_modal" class="modal-trigger">View
								History</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
			<jsp:include page="trans_history.jsp" /></div>
	</main>
	<jsp:include page="footer.html" />
	<script>
		$(document).ready(function() {
			$('.modal').modal();
		});
		$(document).ready(function() {
			$('select').formSelect();
		});
		$(document).ready(function() {
			$('.tabs').tabs();

		});
	</script>

</body>
</html>