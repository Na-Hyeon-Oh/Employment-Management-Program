<%@ page contentType="text/html;charset=utf-8" 
			import="myBean.DB.*, java.sql.*,java.io.*, javax.naming.NamingException"%>
<% 
	request.setCharacterEncoding("utf-8");
	String workernum = request.getParameter("workernum");   
	Class.forName("com.mysql.cj.jdbc.Driver");
	  
	String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Connection con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		 
	String sql = "SELECT photo FROM employee.worker WHERE workernum=?";//Get the file name to delete the saved photo file.
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, workernum);
	ResultSet rs = pstmt.executeQuery();		 
	rs.next();
		 
	String photo = rs.getString("photo");
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	 
	File file = new File(realFolder + "\\" + photo);
	file.delete();
	
	try {
		WorkerDB db = new WorkerDB();
		db.deleteWorker(workernum);
		}catch(NamingException e) {
			out.print(e);
			return;
		}catch(SQLException e) {
			out.print(e);
			return;
		}
%>
<%
response.sendRedirect("mainpage.html");
%>