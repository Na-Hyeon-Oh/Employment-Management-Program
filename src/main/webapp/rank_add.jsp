<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, myBean.DB.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<script>
//TO DO.
function chk(){//This is a function that warns you to enter information if it is not entered.
	var chkcode = document.getElementById("code");
	var chkrname = document.getElementById("rname");
	
	if(chkcode.value==""){
		alert("Please enter rank code.");
		chkcode.focus();
		return false;
	}
	else if(chkrname.value==""){
		alert("Please enter rank name.");
		chkrname.focus();
		return false;
	}
	return true;
	
}
</script>
<!-- TO DO. Make a Form which send some information to rank_add_do.jsp -->
<form method='post' action='rank_add_do.jsp'>
Rank Code: <input type = "text" name = "code" id= "code"><br/>
Rank Name: <input type = "text" name = "rname" id= "rname"><br/>
Used: 
Yes<input type="radio" name="used" value = "yes" checked = "checked"/>
No<input type="radio" name="used" value = "no"/><br/>

<input type="submit" value="save" onclick = "var ret = chk(); if(ret == false) return false;"/>
</form>
</body>
</html>