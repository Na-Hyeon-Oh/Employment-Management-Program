<%@ page contentType="text/html;charset=utf-8" import="java.sql.*,myBean.DB.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Employee Info</title>
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
	<a href="mainpage.html">Main</a><br/>
	<form action="worker_modify.jsp?workernum=<%=w.getWorkernum()%>" enctype="multipart/form-data" method="post">
		Worker Num : <%=w.getWorkernum()%>&nbsp;&nbsp;
		Name : <%=w.getName()%>&nbsp;&nbsp;
		Nick Name :<%=w.getNickname()%><br/>
		Birth : <%=w.getBirth()%>&nbsp;&nbsp;&nbsp;
		Gender : <%=w.getGender()%><br/>
		Entry Date:<%=w.getEntrydate()%>
		Entry Section:<%=w.getEntrysection()%><br/>
		Rank:<%=w.getRank()%>
		Division:<%=w.getDivision()%><br/>
		Retire Date:<%=w.getRetiredate()%><br/>
		Retire Reason:<br/>
			<%=w.getRetirereason()%><br/>
		Phone Number:<%=w.getPhonenum()%>&nbsp;&nbsp;
		Cell Phone Number:<%=w.getCellphonenum()%><br/>
		e-mail:<%=w.getEmail()%><br/>
		Address:<%=w.getAddress()%><br/>
		Payroll Information<br/>
		Bank Name:<%=w.getBankname()%>&nbsp;&nbsp;
		Account Number:<%=w.getBankaccount()%>&nbsp;&nbsp;
		Account holder:<%=w.getBankown()%><br/>
		Breif<br/><%=w.getExc()%><br/>
		<!-- print image --> 
		Photo :<%=w.getPhoto()%><br/><IMG src="<%= "./upload/"+w.getPhoto() %>" 
					width="50" height="50"><br/>
		<INPUT type="submit" value="modify"/>&nbsp;&nbsp;
		<INPUT type="button" value="print" onClick=
		"location.href='print.jsp?workernum=<%=w.getWorkernum()%>'"/>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<INPUT type="button" value="Delete" onClick="alert('Deleted');
		location.href='worker_delete.jsp?workernum=<%=w.getWorkernum()%>'"/>
	</form>
</body>
</html>