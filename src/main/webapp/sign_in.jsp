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
<style type="text/css">
input {
	color: white;
}
</style>
</head>
<body>
	<form action="LoginServlet" class="col s12">
		<div class="input-field col s12">
			<input id="login_email" name="login_email" type="email"
				class="validate" required="required"> <label for="login_email">Email</label>
		</div>
		<div class="input-field col s12">
			<input id="login_password" name="login_password" type="password"
				class="validate" required="required"> <label for="login_password">Password</label>
		</div>
		<button class="btn waves-effect waves-light white"
			style="color: black; margin: 5px" type="submit" name="action">
			Login <i class="material-icons right">send</i>
		</button>
	</form>
</body>
</html>