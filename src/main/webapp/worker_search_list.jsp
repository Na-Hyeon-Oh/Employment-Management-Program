<%@ page  contentType="text/html;charset=utf-8" 
		import="java.sql.*,myBean.DB.*, javax.naming.*"  %>
<head>
<title>Search for Employee Information</title>
</head>
<!-- TO DO. If you want to add css for pagination, add it here -->


<a href="mainpage.html">Main</a>&nbsp;&nbsp;&nbsp;
<a href="worker_show_retired.jsp">List of Retirees</a><br/><br/>

<form action="worker_search_list.jsp" method="post">
	Employee Number<input type="radio" name="choice" checked="checked" value="workernum">
	Name<input type="radio" name="choice" value="name">
	<input type="search" name="search" >
	<input type="submit" value="Search" >
</form>
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.cj.jdbc.Driver"); 
String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false";
String DB_USER = "root";
String DB_PASSWORD= "1234";

Connection con= null;
PreparedStatement pstmt = null;
ResultSet rs   = null;

String choice=request.getParameter("choice");
String search=request.getParameter("search");

int cnt = 0; // for paging
int paginationLimit = 5;

// TO DO Receive the search value from the user, extract the result from the db, and display it as a table.

try {

	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    Statement stmt = con.createStatement(); 
    //List<Worker> lst = new ArrayList<Worker>();
    String sql = "";
    if(search != null && !search.equals("")){
    	sql = "SELECT * FROM worker WHERE "+choice;
    	sql+=" LIKE '%"+search.trim()+"%'";
    	
    }
    else { //initial
    	sql = "SELECT * FROM worker";
    }
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
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
<!-- TO DO -->
<!--  receive info from division table and show division list -->
<%
int workernum = 0;
while(rs.next()){
	cnt ++;
	workernum=rs.getInt("workernum");
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
	<%
	tmp = rs.getString("entrydate");
	if(tmp == null){%>
		<td></td>
	<%}
	else{%>
		<td><%= tmp %></td>
	<% }%>
	<%
	tmp = rs.getString("retiredate");
	if(tmp == null){%>
		<td></td>
	<%}
	else{%>
		<td><%= tmp %></td>
	<% }%>
	<td><%= rs.getString("bankaccount") %></td>
	<td><%= rs.getString("email") %></td>
	</tr>
	
<%
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
<br/>
<%
int currentPage = 1;
if(currentPage == 1){%>
	<a href = "worker_search_list.jsp?pageNumber=<%=currentPage %>">Previous</a>&nbsp;&nbsp;&nbsp;
<%}
else{
%>
	<a href = "worker_search_list.jsp?pageNumber=<%=currentPage -1 %>">Previous</a>&nbsp;&nbsp;&nbsp;
<%} %>
<%
int pageNo = (int) (cnt/paginationLimit + 1);
for(int i = 1; i<=pageNo; i++){
%>
<a href="worker_search_list.jsp?pageNumber=<%=i %>"><%=i %></a>&nbsp;&nbsp;&nbsp;
<%
}
if(currentPage == pageNo){%>
	<a href = "worker_search_list.jsp?pageNumber=<%=currentPage %>">Next</a>&nbsp;&nbsp;&nbsp;
<%}
else{
%>
<a href = "worker_search_list.jsp?pageNumber=<%=currentPage +1 %>">Next</a>&nbsp;&nbsp;&nbsp;
<%} %>