<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, myBean.DB.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Division Registration</title>
</head>
<body>

<script>
function chk(){//This is a function that warns you to enter information if it is not entered.
	var chkcode = document.getElementById("code");
	var chkrname = document.getElementById("dname");
	
	if(chkcode.value==""){
		alert("Please enter division code.");
		chkcode.focus();
		return false;
	}
	else if(chkrname.value==""){
		alert("Please enter division name.");
		chkrname.focus();
		return false;
	}
	return true;
	
}
</script>
<!-- TO DO. 
Make a Form which send some information to division_add_do.jsp -->
<form method='post' action='division_add_do.jsp'>
Division Code: <input type = "text" name = "code" id= "code"><br/>
Division Name: <input type = "text" name = "dname" id= "dname"><br/>
Used: 
Yes<input type="radio" name="used" value = "yes" checked = "checked"/>
No<input type="radio" name="used" value = "no"/><br/>

<input type="submit" value="save" onclick = "var ret = chk(); if(ret == false) return false;"/>
</form>
</body>
</html>