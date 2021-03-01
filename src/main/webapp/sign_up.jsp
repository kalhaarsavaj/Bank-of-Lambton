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

input:invalid {
	border: 2px 0px 0px 0px dashed red;
}

input:valid {
	border: 2px 0px 0px 0px solid black;
}

.account_selection_modal {
	width: 100%;
	font-size: 0.85vw;
}

.checkbox_s {
	padding: 10px 0;
}

.datepicker-date-display {
	background-color: black;
}

.datepicker-modal {
	top: 25% !important;
}
</style>
</head>
<body>
	<form action="RegisterSevlet" class="col s12 login_form">
		<div class="row">
			<div class="input-field col s6">
				<input id="fname" name="fname" type="text" class="validate"
					required="required"> <label for="fname">First Name</label>
			</div>
			<div class="input-field col s6">
				<input id="lname" name="lname" type="text" class="validate"
					> <label for="lname">Last Name</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="signup_email" name="signup_email" type="email"
					class="validate" required="required"> <label
					for="signup_email">Email</label>
			</div>
			<div class="input-field col s6">
				<input id="phno" name="phno" type="text" class="validate"
					required="required"> <label for="phno">Phone Number</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="sin_no" name="sin_no" type="text" class="validate"
					required="required"> <label for="sin_no">SIN Number</label>
			</div>
			<div class="input-field col s6">
				<input id="passport_no" name="passport_no" type="text"
					class="validate" required="required"> <label
					for="passport_no">Passport Number</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<input id="address" name="address" type="text" class="validate"
					required="required"> <label for="address">Address</label>
			</div>

		</div>
		<div class=row>
			<div class="input-field col s6">
				<input id="zip_code" name="zip_code" type="text" class="validate"
					required="required"> <label for="zip_code">Zipcode</label>
			</div>
			<div class="input-field col s6">

				<!-- <input id="dob" name="dob" type="text" class="datepicker" required>
				<label for="dob">Date of Birth (YYYY-MM-DD)</label> -->

				<input type=text name="dob" id="bdate" class="datepicker" required>
				<label for="dob">Date of Birth (YYYY-MM-DD)</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="signup_password" name="signup_password" type="password"
					class="validate" required="required"> <label
					for="signup_password">Password</label>
			</div>
			<div class="input-field col s6">
				<input id="signup_confirm_password" name="signup_confirm_password"
					type="password" class="validate" required="required"> <label
					for="signup_confirm_password">Confirm Password</label>
			</div>
		</div>
		<div class="row" style="padding: 15px 0">
			<div class="col s7">
				<a
					class="btn waves-effect waves-light white modal-trigger account_selection_modal"
					type="submit" href="#account_selection_modal"
					style="color: black; margin: 5px"> Select accounts type <i
					class="material-icons right">account_circle</i>
				</a>
			</div>
			<div class="col s5">
				<button
					class="modal-action modal-close btn waves-effect waves-light white"
					style="color: black; margin: 5px" type="submit" name="action"
					onclick="return Validate()">
					Create<i class="material-icons right">send</i>
				</button>
			</div>
		</div>


		<!-- Modal structure -->
		<div id="account_selection_modal" class="modal">
			<div class="modal-content">
				<div id="eta" class="col s12">
					<div class="black lighten-3">
						<p style="text-align: center; color: white; padding: 10px 0px;">Select
							the types of accounts you would like to open with us.</p>
					</div>
					<div class="col s12" style="text-align: center">
						<div class="row checkbox_s">
							<label> <input type="checkbox" class="filled-in "
								name="chqacc" checked="checked" disabled /> <span>Chequing
									Account</span>
							</label>
						</div>
						<div class="row checkbox_s">
							<label> <input type="checkbox" class="filled-in"
								name="savingacc" /> <span>Saving Account</span>
							</label>
						</div>
						<div class="row checkbox_s">
							<label> <input type="checkbox" name="creditacc"
								class="filled-in" /> <span>Credit Account</span>
							</label>
						</div>
						<div class="row checkbox_s">
							<button type="button" id="close_select_acc_modal"
								class=" modal-action modal-close waves-effect waves-light btn-large black">Done</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>
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

		var currYear = (new Date()).getFullYear();

		$(document).ready(function() {
			$(".datepicker").datepicker({
				defaultDate : new Date(currYear - 5, 1, 31),
				// setDefaultDate: new Date(2000,01,31),
				maxDate : new Date(currYear - 5, 12, 31),
				yearRange : [ 1928, currYear - 5 ],
				format : "yyyy-mm-dd"
			});
		});
		
	</script>
	<script type="text/javascript">
    function Validate() {    
    	boolean counter;
    	var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;        
        var phone_no = document.getElementById("phno").value;
        if(phone_no.value.match(phoneno))
	     {
		   counter = true;      
		 }
       else
	     {
		   alert("Not a valid Phone Number. Please insert XXX XXX XXXX or XXX-XXX-XXXX or XXX.XXX.XXXX.");
		   return false;
	     }
        
        var sin = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{3})$/;
        var sin_no = document.getElementById("sin_no").value;
    	if(sin_no.value.match(sin))
	     {
    		counter = true;      
		 }
     else
	     {
		   alert("Not a valid SIN Number. Please insert XXX XXX XXX or XXX-XXX-XXX or XXX.XXX.XXX");
		   return false;
	     }
    	
        var password = document.getElementById("signup_password").value;
        var confirmPassword = document.getElementById("signup_confirm_password").value;
        
        if (password != confirmPassword) {
            alert("Password and Confirm Password does not match.");
            return false;
        }
        counter = true;
        return counter;
    }
    function ValidatePhonenumber(){
    	var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;        
        var phone_no = document.getElementById("phno").value;
        if(phone_no.value.match(phoneno))
	     {
		   return true;      
		 }
       else
	     {
		   alert("Not a valid Phone Number. Please insert XXX XXX XXXX or XXX-XXX-XXXX or XXX.XXX.XXXX.");
		   return false;
	     }
    }
    function VaidateSIN(){
      	var sin = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{3})$/;
        var sin_no = document.getElementById("sin_no").value;
    	if(sin_no.value.match(sin))
	     {
		   return true;      
		 }
     else
	     {
		   alert("Not a valid SIN Number. Please insert XXX XXX XXX or XXX-XXX-XXX or XXX.XXX.XXX");
		   return false;
	     }
    }
    
</script>
</body>
</html>
