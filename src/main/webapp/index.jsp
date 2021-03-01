<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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


<title>Banking App | Home</title>
<style>
.login_form .row {
	margin-bottom: 0px !important;
}

.login_form .row .col {
	margin-bottom: 0px !important;
}

.tabs .tab a:hover, .tabs .tab a.active {
	background-color: rgb(216 216 216/ 20%);
}

.tabs .tab a:focus, .tabs .tab a:focus.active {
	background-color: rgb(216 216 216/ 20%);
}

.parallax_custom {
	height: auto !important;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<div class="parallax-container parallax_custom">
			<div class="parallax">
				<img src="./assets/images/background1.jpg"
					style="transform: translate3d(-50%, 312.664px, 0px); opacity: 1;">
			</div>
			<div class="row"
				style="background-color: black; margin-top: 2%; margin-left: 55%; margin-right: 10%; padding: 10px">
				<div class="col s12">
					<ul class="tabs black" style="color: white;">
						<li class="tab col s12"><a class="active" href="#test1"
							style="color: white">Sign In</a></li>
						
					</ul>
				</div>
				<div id="test1" class="col s12">
					<jsp:include page="sign_in.jsp" />

				</div>
			
			</div>
		</div>

		<div class="section white">
			<div class="row container">
				<div class="col s12 m10 offset-m1">
					<h3 class="header">Temporary Branch Closures - COVID-19.</h3>
					<p class="grey-text text-darken-3 lighten-3">Supporting you and your 
					family through this uneasy time as the COVID-19 situation evolves is 
					important to us, so we are doing everything we can.</p> 
					<p>Stay up to date with information about Bank Of Lambton branches that are temporarily closed. Our 
					online banking facilities remain available 24/7.</p>

				</div>
			</div>
		</div>
	</main>
	<jsp:include page="footer.html" />
	<script>
		$(document).ready(function() {
			$('.tabs').tabs()
		});
	</script>
</body>
</html>