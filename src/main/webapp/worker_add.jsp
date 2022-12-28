<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, myBean.DB.*, javax.naming.*" %>
<!DOCTYPE html >
<html>
<head>
<title>Employee Register</title>
</head>
<body>
	<a href="mainpage.html"><b>Main<b></a>
	<br />
	<h1>Employee Information</h1>
	<br />

	<form action="worker_add_do.jsp" method="post" enctype="multipart/form-data" onSubmit="return chk();">
		Employee Number : <input type="text" size="5" name="workernum" id="workernum">&nbsp;&nbsp;
		Name : <input type="text" size="10" name="name" id="name">&nbsp;&nbsp;
		Nick Name : <input type="text" size="10" name="nickname" id="nickname">
		<br />
		Birth : <input type="date" name="birth" id="birth">&nbsp;&nbsp;&nbsp;
		Gender :
		<input type="radio" checked="checked" value="Man" name="gender">Man
		<input type="radio" value="Woman" name="gender">Woman
		<br />
		Entry Date:<input type="date" name="entrydate" id="entrydate">
		Entry section:
		<input type="radio" checked="checked" value="Regular" name="entrysection">Regular
		<input type="radio" value="Occasional" name="entrysection">Occasional
		<input type="radio" value="Contract" name="entrysection">Contract
		<input type="radio" value="Daily" name="entrysection">Daily
		<br />
		Rank:
		<select name="rank">
			<%
			try {//According to the information of the stored ranks, only the ones with Used as Yes are output and selectable.
				RankDB db = new RankDB();
				ResultSet rs1 = db.getResultSet();
				
				while(rs1.next()){
					if(rs1.getString("used").equals("yes")){
	
			%>
			<!-- TO DO -->
				<option value = <%= rs1.getString("code")%> ><%= rs1.getString("rname")%></option>
			<%
					}
				}
			rs1.close();
			db.close();
			} catch (SQLException e) {
			out.println("err:" + e.toString());
			return;
			} catch (NamingException e) {
			out.print(e);
			return;
			}
			%>
		</select>
		Division:
		<select name="division">
			<%
			try {//According to the stored information of divisions, only the ones with Used as Yes are output and selectable.
				DivisionDB db = new DivisionDB();
				ResultSet rs2 = db.getResultSet();
				
				while(rs2.next()){
					if(rs2.getString("used").equals("yes")){
	
			%>
			<!-- TO DO -->
				<option value = <%= rs2.getString("code")%> ><%= rs2.getString("dname")%></option>
			<%
					}
				}
			rs2.close();
			db.close();
			} catch (SQLException e) {
			out.println("err:" + e.toString());
			return;
			} catch (NamingException e) {
			out.print(e);
			return;
			}
			%>
		</select>
		<br />
		Retire Date:
		<input type="date" name="retiredate" id="retiredate"><br />
		Retire Reason:<br />
		<textarea rows="3" cols="50" name="retirereason" id="retirereason"></textarea>
		<br />
		Phone Number:<input type="tel" name="phonenum" id="phonenum">&nbsp;&nbsp;
		Cell Phone Number:<input type="tel" name="cellphonenum" id="cellphonenum"><br />
		e-mail:<input type="email" size="30" name="email" id="email"><br />
		Address:<input type="text" size="50" name="address" id="address"><br />
		<br />
		Payroll Information<br />
		Bank Name:<input type="text" size="5" name="bankname" id="bankname">&nbsp;&nbsp;
		Account Number:<input type="text" size="5" name="bankaccount" id="bankaccount">&nbsp;&nbsp;
		Account Holder:<input type="text" size="5" name="bankown" id="bankown"><br />
		Brief<br />
		<textarea rows="5" cols="50" name="exc" id="exc"></textarea>
		<br /> photo : <input type="file" name="photo" id="photo"><br />
		<input type="submit" value="save">&nbsp;&nbsp;&nbsp;
	</form>
	<script>
		function chk() {//When saving, this function warns if the employee number, name, phone number, cell phone number, email, address, bank name, account number, and account holder are blank, and asks for input.
			var chkworkernum = document.getElementById("workernum");
			var chkname = document.getElementById("name");
			var chknickname = document.getElementById("nickname");
			var chkcellphonenum = document.getElementById("cellphonenum");
			var chkphonenum = document.getElementById("phonenum");
			var chkemail = document.getElementById("email");
			var chkbankname = document.getElementById("bankname");
			var chkaddress = document.getElementById("address");
			var chkbankaccount = document.getElementById("bankaccount");
			var chkbankown = document.getElementById("bankown");

			if (chkworkernum.value == "") {
				alert("Please enter employee number");
				chkworkernum.focus();
				return false;
			} else if (chkname.value == "") {
				alert("Please enter name");
				chkname.focus();
				return false;
			} else if (chkphonenum.value == "") {
				alert("Please enter phone number");
				chkphonenum.focus();
				return false;
			} else if (chkcellphonenum.value == "") {
				alert("Please enter cell phone number");
				chkcellphonenum.focus();
				return false;
			} else if (chkemail.value == "") {
				alert("Please enter email");
				chkemail.focus();
				return false;
			} else if (chkaddress.value == "") {
				alert("Please enter address");
				chkaddress.focus();
				return false;
			} else if (chkbankname.value == "") {
				alert("Please enter bank name");
				chkbankname.focus();
				return false;
			} else if (chkbankaccount.value == "") {
				alert("Please enter account number");
				chkbankaccount.focus();
				return false;
			} else if (chkbankown.value == "") {
				alert("Please enter account holder");
				chkbankown.focus();
				return false;
			}
			alert("Save employee information.");
			return true;

		}
	</script>
</body>
</html>