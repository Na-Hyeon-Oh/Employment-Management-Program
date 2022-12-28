<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*,myBean.DB.*, javax.naming.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Print</title>
<style>
.a {background-color:#dddddd; text-align:center;}
.b {font-size:20pt;text-align:center}
table {width:500;height:700}
</style>
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
		Calendar calendar = Calendar.getInstance();
		int year=calendar.get(Calendar.YEAR);
		int month=calendar.get(Calendar.MONTH)+1;//Since January = 0, add 1
		int day=calendar.get(Calendar.DATE);
	
%>
	<table border="1" style="border-collapse:collapse"width="700" height="850">
		<tr height="150"  style="background-color:#dddddd;text-align:center;">
		<td colspan='4' style="font-size:30pt">Certificate of Employment</td></tr>
		<tr height="50">
			<td class="a" width="100">Name</td>
			<td width="250"><%=w.getName()%></td>
			<td class="a" width="100">Birth</td>
			<td ><%=w.getBirth()%></td>
		</tr>
		<tr height="50">
			<td class="a" width="100">Address</td>
			<td colspan='3'><%=w.getAddress()%></td>
		</tr>
		<tr height="50">
			<td class="a" width="100">Division</td>
			<td width="250"><%=w.getDivision()%></td>
			<td class="a" width="100">Rank</td>
			<td><%=w.getRank()%></td>
		</tr>
		<tr height="50">
			<td class="a" width="100">employment period</td>
			<td colspan='3'><%=w.getEntrydate()%> ~ 
				<%
					if(w.getRetiredate().equals("")){
				%><%=year+"-"+month+"-"+day %>
				<%}else{ %>
				<%=w.getRetiredate() %>	<%} %>		
			</td>
		</tr>
		<tr>
			<td class="a" width="100">purpose</td>
			<td colspan='3'></td>
		</tr>
		<tr>
			<td colspan='4'>
			<b class="b">Organization: OOO Co.,Ltd.</b><br/>
			<b class="b">Organization head name: OOO(Sign)</b>
			</td>
		</tr>

	</table>
<script >window.print();</script>
</body>
</html>