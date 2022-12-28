<%@ page  contentType="text/html;charset=utf-8" 
		import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver"); 

String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false";

String DB_USER = "root";
String DB_PASSWORD= "1234";

Connection con= null;
Statement stmt = null;
ResultSet rs   = null;

// TO DO
try {
    
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    stmt = con.createStatement(); 
    String query = "SELECT * FROM employee.rank ";  
    rs = stmt.executeQuery(query); 

%>
<a href="mainpage.html">Main</a><br/>
<table border="1" style="border-collapse:collapse">
<!-- This is a table that displays the rank code, rank name, and whether it is used. -->
<tr style="background-color:#dddddd">
	<th>Rank Code</th>
	<th>Rank Name</th>
	<th>Used</th>
</tr>
<!-- TO DO -->
<!--  receive info from rank table and show rank list -->
<%
while(rs.next()){
%>
	<tr>
	<td><%= rs.getString("code") %></td>
	<td><%= rs.getString("rname") %></td>
	<td><%= rs.getString("used") %></td>
	<td><button onclick = "location = 'rank_modify.jsp?idx='+<%= rs.getInt("idx")%>">modify</button></td>
	</tr>
	
<%
}
%>
</table>
<br/>
<button onclick = "location='rank_add.jsp'">add</button>
<%

	rs.close();   
    stmt.close();    
    con.close(); 

} catch (SQLException e) {
      out.println("err:"+e.toString());
      return;
}
%>