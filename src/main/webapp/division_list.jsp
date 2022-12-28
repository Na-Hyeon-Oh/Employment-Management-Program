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


try {
    
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    stmt = con.createStatement(); 
    String query = "SELECT * FROM employee.division ";  
    rs = stmt.executeQuery(query); 

%>


<a href="mainpage.html">Main</a><br/>
<table border="1" style="border-collapse:collapse">
<!-- This is a table that displays the division code, division name, and whether it is used. -->
<tr style="background-color:#dddddd">
	<th>Division Code</th>
	<th>Division</th>
	<th>used</th>
</tr>
<!-- TO DO -->
<!--  receive info from division table and show division list -->
<%
while(rs.next()){
%>
	<tr>
	<td><%= rs.getString("code") %></td>
	<td><%= rs.getString("dname") %></td>
	<td><%= rs.getString("used") %></td>
	<td><button onclick = "location = 'division_modify.jsp?idx='+<%= rs.getInt("idx")%>">modify</button></td>
	</tr>
	
<%
}
%>
</table>
<br/>
<button onclick = "location='division_add.jsp'">add</button>
<%

	rs.close();   
    stmt.close();    
    con.close(); 

} catch (SQLException e) {
      out.println("err:"+e.toString());
      return;
}
%>