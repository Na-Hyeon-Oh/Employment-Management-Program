<%@ page contentType="text/html;charset=utf-8" 
			import="myBean.DB.*, java.sql.*, javax.naming.NamingException"%>
<!DOCTYPE html >
<html>
<head>
<title>Rank Modify</title>
</head>
<body>


<%
String sidx = request.getParameter("idx");
int idx=Integer.parseInt(sidx);
String code = "";
String rname = "";
String used = "";

Class.forName("com.mysql.cj.jdbc.Driver"); 

String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false";

String DB_USER = "root";
String DB_PASSWORD= "1234";

Connection con= null;
//PreparedStatement pstmt = null;
ResultSet rs   = null;
try {
	//TO DO
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    Statement stmt = con.createStatement();
	String sql = "SELECT * FROM `rank` WHERE idx = " + sidx;  
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		code=rs.getString("code");
		rname =rs.getString("rname");
		used = rs.getString("used");
	}
%> 

<script>
<!-- TO DO -->
function chk(){//This is a function that warns you to enter information if it is not entered.
	var chkcode = document.getElementById("code");
	var chkrname = document.getElementById("rname");
	
	if(chkcode.value=="")
	{alert("Please enter rank code.");
	chkcode.focus(); return false;}
	else if(chkrname.value=="")
	{alert("Please enter rank name.");
	chkrname.focus(); return false;}
	return true;
	
}
</script>
<!-- TO DO. Make a Form which send some information to rank_modify_do.jsp-->
<form method='post' action='rank_modify_do.jsp'>
<input type="hidden" name="idx" value = <%= idx %> />
Rank Code: <input type = "text" name = "code" id= "code" value = <%= code %>><br/>
Rank Name: <input type = "text" name = "rname" id= "rname" value = <%= rname %>><br/>
Used: 
<% if(used.equals("yes")){ %>
Yes<input type="radio" name="used" value = "yes" checked/>
No<input type="radio" name="used" value = "no"/><br/>
<%} else if(used.equals("no")){ %>
Yes<input type="radio" name="used" value = "yes"/>
No<input type="radio" name="used" value = "no" checked/><br/>
<% } %>

<input type="submit" value="modify" onclick = "var ret = chk(); if(ret == false) return false;"/>
</form>
</body>
</html>

<%
    rs.close();
    stmt.close();
    //pstmt.close();    
    con.close(); 	

} catch (SQLException e) {
      out.println("err:"+e.toString());
      return;
} 
%>