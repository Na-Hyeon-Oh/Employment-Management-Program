<%@ page contentType="text/html;charset=utf-8" 
			import="myBean.DB.*, java.sql.*, javax.naming.NamingException"
			import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
			import= "java.io.*"  %>
<% 
	request.setCharacterEncoding("utf-8");
	Worker w=new Worker();
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");		
	
	int maxsize = 5*1024*1024;
	
	try {
			MultipartRequest multi = 
			new MultipartRequest(request, realFolder, maxsize, "utf-8",new DefaultFileRenamePolicy());
			String workernum = multi.getParameter("workernum");    
			String name = multi.getParameter("name");         
			String ename = multi.getParameter("nickname");        
			String birth = multi.getParameter("birth");        
			String gender = multi.getParameter("gender");       
			String entrydate = multi.getParameter("entrydate");    
			String entrysection = multi.getParameter("entrysection"); 
			String rank = multi.getParameter("rank");         
			String division = multi.getParameter("division");     
			String retiredate = multi.getParameter("retiredate");   
			String retirereason = multi.getParameter("retirereason"); 
			String phonenum = multi.getParameter("phonenum");     
			String cellphonenum = multi.getParameter("cellphonenum"); 
			String email = multi.getParameter("email");        
			String address = multi.getParameter("address");      
			String bankname = multi.getParameter("bankname");     
			String bankaccount = multi.getParameter("bankaccount");     
			String bankown = multi.getParameter("bankown");      
			String exc = multi.getParameter("exc");          
			String photo = multi.getFilesystemName("photo");
			w.setWorkernum(workernum);
			w.setName(name);
			w.setNickname(ename);
			w.setBirth(birth);
			w.setGender(gender);
			w.setEntrydate(entrydate);
			w.setEntersection(entrysection);
			w.setRank(rank);
			w.setDivision(division);
			w.setRetiredate(retiredate);
			w.setRetirereason(retirereason);
			w.setPhonenum(phonenum);
			w.setCellphonenum(cellphonenum);
			w.setEmail(email);
			w.setAddress(address);
			w.setBankname(bankname);
			w.setBankaccount(bankaccount);
			w.setBankown(bankown);
			w.setExc(exc);
			w.setPhoto(photo);
		WorkerDB db = new WorkerDB();
		db.motifyWorker(w);
		}catch(NamingException e) {
			out.print(e);
			return;
		}catch(SQLException e) {
			out.print(e);
			return;
		}catch(Exception e) { 
			out.println(e);
			return;
		}
%>
<%
response.sendRedirect("mainpage.html");
%>
