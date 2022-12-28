<%@ page contentType="text/html;charset=utf-8" 
			import="myBean.DB.*, java.sql.*, javax.naming.NamingException"%>
<%
request.setCharacterEncoding("utf-8");
String sidx = request.getParameter("idx");
int idx=Integer.parseInt(sidx);
String code = request.getParameter("code");
String dname = request.getParameter("dname");
String used = request.getParameter("used");
Division d= new Division();
d.setIdx(idx);
d.setCode(code);
d.setDname(dname);
d.setUsed(used);
try {
	DivisionDB db = new DivisionDB();
	db.motifyDivision(d);
}catch(NamingException e) {
	out.print(e);
	return;
}catch(SQLException e) {
	out.print(e);
	return;
}
 
%>
<%response.sendRedirect("division_list.jsp"); //When finished, it moves to the division list output window.
%>
