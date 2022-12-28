<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*, myBean.DB.*, javax.naming.*" %>

<%
request.setCharacterEncoding("utf-8");		

String code = request.getParameter("code");
String rname = request.getParameter("rname");
String used = request.getParameter("used");
Rank r= new Rank();
r.setCode(code);
r.setRname(rname);
r.setUsed(used);
try {
	RankDB db = new RankDB();
	
	db.addRank(r);
}catch(NamingException e) {
	out.print(e);
	return;
}catch(SQLException e) {
	out.print(e);
	return;
}

%>
<%
response.sendRedirect("rank_list.jsp");//When finished, it moves to the division list output window.
%>
