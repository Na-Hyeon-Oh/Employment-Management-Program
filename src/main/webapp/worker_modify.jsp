<%@ page contentType="text/html;charset=utf-8" import="java.sql.*,myBean.DB.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Employee Modify</title>
<script >
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
			alert("modified");
			return true;

		}
	</script>
</head>
<body>
<%
	Worker w=new Worker();
		try {
				WorkerDB db = new WorkerDB();
				w=db.returnFind(request.getParameter("workernum"));
			}catch(NamingException e) {
				out.print(e);
				return;
			}catch(SQLException e) {
				out.print(e);
				return;
			}
	
	
%>
<form action="worker_modify_do.jsp" method="post" enctype="multipart/form-data">
	<!-- The employee number cannot be changed. --> 
	Worker Num : <input id = "workernum" type="text" name="workernum" value=<%=w.getWorkernum()%> readOnly/>&nbsp;&nbsp;
	<!-- TO DO. Use the getter and setter functions of the Worker class. -->
	Name : <input type="text" size="10" name="name" id="name" value= <%=w.getName() %>>&nbsp;&nbsp;
		Nick Name : 
		<input type="text" size="10" name="nickname" id="nickname" value= <%=w.getNickname() %>>
		<br />
		Birth : 
		<%
		String birth = w.getBirth();
		if(birth == null || birth.equals("")) {%>
			<input type="date" name="birth" id="birth" >&nbsp;&nbsp;&nbsp;
		<%}
		else {%>
			<input type="date" name="birth" id="birth" value= <%=birth %>>&nbsp;&nbsp;&nbsp;
		<%}%>
		<% String gender= w.getGender(); %>
		Gender :
		<%
		if(gender == null || gender.equals("")) {%>
			<input type="radio" value="Man" name="gender">Man
			<input type="radio" value="Woman" name="gender">Woman
		<%}
		else if(gender.equals("Man") || gender.equals("man")){ %>
			<input type="radio" checked="checked" value="Man" name="gender" >Man
			<input type="radio" value="Woman" name="gender">Woman
		<%}
		else if(gender.equals("Woman") || gender.equals("woman")){%>
			<input type="radio" value="Man" name="gender">Man
			<input type="radio" value="Woman" name="gender" checked = "checked">Woman
		<%} 
		else {%>
			<input type="radio" value="Man" name="gender">Man
			<input type="radio" value="Woman" name="gender">Woman
		<%} %>
		<br />
		Entry Date:
		<%
		String entryDate = w.getEntrydate();
		if(entryDate == null || entryDate.equals("")) {%>
			<input type="date" name="entrydate" id="entrydate">
		<%}
		else {%>
			<input type="date" name="entrydate" id="entrydate"  value= <%=entryDate %>>
		<%}%>
		
		<% String entrySection= w.getEntrysection(); %>
		Entry section:
		<% 
		if(entrySection == null || entrySection.equals("")) {%>
		<input type="radio" value="Regular" name="entrysection" >Regular
		<input type="radio" value="Occasional" name="entrysection">Occasional
		<input type="radio" value="Contract" name="entrysection">Contract
		<input type="radio" value="Daily" name="entrysection">Daily
		<%}
		else if(entrySection.equals("Regular")){%>
			<input checked = "checked" type="radio" value="Regular" name="entrysection" >Regular
			<input type="radio" value="Occasional" name="entrysection">Occasional
			<input type="radio" value="Contract" name="entrysection">Contract
			<input type="radio" value="Daily" name="entrysection">Daily
		<%}
		else if(entrySection.equals("Occasional")){%>
			<input type="radio" value="Regular" name="entrysection" >Regular
			<input checked = "checked" type="radio" value="Occasional" name="entrysection">Occasional
			<input type="radio" value="Contract" name="entrysection">Contract
			<input type="radio" value="Daily" name="entrysection">Daily
		<%}
		else if(entrySection.equals("Contract")){%>
			<input type="radio" value="Regular" name="entrysection" >Regular
			<input type="radio" value="Occasional" name="entrysection">Occasional
			<input checked = "checked" type="radio" value="Contract" name="entrysection">Contract
			<input type="radio" value="Daily" name="entrysection">Daily
		<%}
		else if(entrySection.equals("Daily")){%>
			<input type="radio" value="Regular" name="entrysection" >Regular
			<input type="radio" value="Occasional" name="entrysection">Occasional
			<input type="radio" value="Contract" name="entrysection">Contract
			<input checked = "checked" type="radio" value="Daily" name="entrysection">Daily
		<%}
		else {%>
			<input type="radio" value="Regular" name="entrysection" >Regular
			<input type="radio" value="Occasional" name="entrysection">Occasional
			<input type="radio" value="Contract" name="entrysection">Contract
			<input type="radio" value="Daily" name="entrysection">Daily
		<%}
		%>
		<br />
		Rank:
		<select name="rank">
			<%
			String selectedRank = w.getRank();
			try {//According to the information of the stored ranks, only the ones with Used as Yes are output and selectable.
				RankDB db = new RankDB();
				ResultSet rs1 = db.getResultSet();
				
				while(rs1.next()){
					if(rs1.getString("used").equals("yes")){
						if(rs1.getString("code").equals(selectedRank)){%>
					<!-- TO DO -->
							<option selected value = <%= rs1.getString("code")%> ><%= rs1.getString("rname")%></option>
						<%}
						else {%>
							<option value = <%= rs1.getString("code")%> ><%= rs1.getString("rname")%></option>
						<%}
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
			String selectedDivision = w.getDivision();
			try {//According to the stored information of divisions, only the ones with Used as Yes are output and selectable.
				DivisionDB db = new DivisionDB();
				ResultSet rs2 = db.getResultSet();
				
				while(rs2.next()){
					if(rs2.getString("used").equals("yes")){
						if(rs2.getString("code").equals(selectedDivision)) {%>
	
			<!-- TO DO -->
							<option selected value = <%= rs2.getString("code")%> ><%= rs2.getString("dname")%></option>
						<%}
						else {%>
							<option value = <%= rs2.getString("code")%> ><%= rs2.getString("dname")%></option>
						<%}
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
		<%
		String retireDate = w.getRetiredate();
		if(retireDate == null || retireDate.equals("")) {%>
			<input type="date" name="retiredate" id="retiredate"><br />
		<%}
		else {%>
			<input type="date" name="retiredate" id="retiredate" value = <%=retireDate %>><br />
		<%}%>
		
		Retire Reason:<br />
		<textarea rows="3" cols="50" name="retirereason" id="retirereason" value = <%=w.getRetirereason() %>></textarea>
		<br />
		Phone Number:<input type="tel" name="phonenum" id="phonenum" value = <%=w.getPhonenum() %>>&nbsp;&nbsp;
		Cell Phone Number:<input type="tel" name="cellphonenum" id="cellphonenum" value = <%=w.getCellphonenum() %>><br />
		e-mail:<input type="email" size="30" name="email" id="email" value = <%=w.getEmail() %>><br />
		Address:<input type="text" size="50" name="address" id="address" value = <%=w.getAddress() %>><br />
		<br />
		Payroll Information<br />
		Bank Name:<input type="text" size="5" name="bankname" id="bankname" value = <%=w.getBankname() %>>&nbsp;&nbsp;
		Account Number:<input type="text" size="5" name="bankaccount" id="bankaccount" value = <%=w.getBankaccount() %>>&nbsp;&nbsp;
		Account Holder:<input type="text" size="5" name="bankown" id="bankown" value = <%=w.getBankown() %>><br />
		Brief<br />
		<textarea rows="5" cols="50" name="exc" id="exc" value = <%=w.getExc() %>></textarea>
		<br /> photo : <input type="file" name="photo" id="photo" value = <%=w.getPhoto() %>><br />
		
		<input type="submit" value="modify" onclick="var ret = chk(); if(ret == false) return false;">&nbsp;&nbsp;&nbsp;
</form>
</body>
</html>