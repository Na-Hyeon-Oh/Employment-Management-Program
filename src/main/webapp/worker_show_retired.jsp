<%@ page  contentType="text/html;charset=utf-8" 
		import="java.sql.*" %>
		
<a href="mainpage.html">Main</a>&nbsp;&nbsp;&nbsp;
<a href="worker_search_list.jsp">Search for Employee Information</a><br/>	
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.cj.jdbc.Driver"); 
String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false";
String DB_USER = "root";
String DB_PASSWORD= "1234";

Connection con= null;
//PreparedStatement pstmt = null;
ResultSet rs   = null;

//TO DO
try {
	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    Statement stmt = con.createStatement(); 
    String query = "SELECT * FROM employee.worker";  
    rs = stmt.executeQuery(query); 
%>
<table border="1" style="border-collapse:collapse">
<tr style="background-color:#dddddd">
	<th>Worker Num</th>
	<th>Name</th>
	<th>Rank</th>
	<th>Division</th>
	<th>Entry Date</th>
	<th>Retire Date</th>
	<th>Bank Account</th>
	<th>E-Mail</th>
</tr>
<%
int workernum = 0;
while(rs.next()){
	workernum=rs.getInt("workernum");
	if(rs.getString("retiredate") != null && !rs.getString("retiredate").equals("")){
%>
	<tr>
	<td><a href="worker_show.jsp?workernum=+<%= workernum %>"> <%= workernum %> </a></td>
	<td><a href="worker_show.jsp?workernum=+<%= workernum %>"> <%= rs.getString("name") %> </a></td>

	<%
	String tmp = rs.getString("rank");
	if(tmp == null){%>
		<td></td>
	<%}
	else{%>
		<td><%= tmp %></td>
	<% }%>
	<%
	tmp = rs.getString("division");
	if(tmp == null){%>
		<td></td>
	<%}
	else{%>
		<td><%= tmp %></td>
	<% }%>
	<td><%= rs.getString("entrydate") %></td>
	<td><%=  rs.getString("retiredate") %></td>
	<td><%= rs.getString("bankaccount") %></td>
	<td><%= rs.getString("email") %></td>
	</tr>
	
<%
	}
}
	rs.close();
	stmt.close();
	con.close();
} catch (SQLException e) {
    out.println("err:"+e.toString());
    return;
}
%>
</table>