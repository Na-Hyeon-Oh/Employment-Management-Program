<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*, myBean.DB.*, javax.naming.*" %>

<%
request.setCharacterEncoding("utf-8");		
String code = request.getParameter("code");
String dname = request.getParameter("dname");
String used = request.getParameter("used");
Division d= new Division();
d.setCode(code);
d.setDname(dname);
d.setUsed(used);
try {
	DivisionDB db = new DivisionDB();
	db.addDivision(d);
	}catch(NamingException e) {
		out.print(e);
		return;
	}catch(SQLException e) {
		out.print(e);
		return;
	}

%>
<%
response.sendRedirect("division_list.jsp");//When finished, it moves to the division list output window.
%>
