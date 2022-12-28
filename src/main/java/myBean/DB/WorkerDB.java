package myBean.DB;

import java.sql.*;
import javax.naming.NamingException;
import myBean.DB.DsCon;

public class WorkerDB {//This is a class that has methods that do things about employee information.
	private Connection con;	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public WorkerDB() throws SQLException, NamingException {
		con = DsCon.getConnection();
	}
	
	public void addWorker(Worker w) throws SQLException {//This is a method to add employee information.
		String sql = "INSERT INTO employee.worker(workernum,name,nickname, birth,gender,entrydate,entrysection,`rank`,"
				+ "division,retiredate,retirereason,phonenum,cellphonenum,email,address,bankname,"
				+ "bankaccount,bankown,exc,photo) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, w.getWorkernum());
		pstmt.setString(2, w.getName());
		pstmt.setString(3, w.getNickname());
		pstmt.setString(4, w.getBirth());
		pstmt.setString(5, w.getGender());
		pstmt.setString(6, w.getEntrydate());
		pstmt.setString(7, w.getEntrysection());
		pstmt.setString(8, w.getRank());
		pstmt.setString(9, w.getDivision());
		pstmt.setString(10, w.getRetiredate());
		pstmt.setString(11, w.getRetirereason());
		pstmt.setString(12, w.getPhonenum());
		pstmt.setString(13, w.getCellphonenum());
		pstmt.setString(14, w.getEmail());
		pstmt.setString(15, w.getAddress());
		pstmt.setString(16, w.getBankname());
		pstmt.setString(17, w.getBankaccount());
		pstmt.setString(18, w.getBankown());
		pstmt.setString(19, w.getExc());
		pstmt.setString(20, w.getPhoto());
		pstmt.executeUpdate(); 
		pstmt.close();
		con.close();
	}	
	
	public void motifyWorker(Worker w)throws SQLException {//This method is used to save the modified employee information.
		String sql = "UPDATE employee.worker SET name=?,nickname=?, birth=?,gender=?,entrydate=?,entrysection=?"
				+ ",`rank`=?, division=?,retiredate=?,retirereason=?,phonenum=?,cellphonenum=?,email=?,"
				+ "address=?,bankname=?,bankaccount=?,bankown=?,exc=?,photo=? WHERE workernum=?"; 
	    pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, w.getName());
		pstmt.setString(2, w.getNickname());
		pstmt.setString(3, w.getBirth());
		pstmt.setString(4, w.getGender());
		pstmt.setString(5, w.getEntrydate());
		pstmt.setString(6, w.getEntrysection());
		pstmt.setString(7, w.getRank());
		pstmt.setString(8, w.getDivision());
		pstmt.setString(9, w.getRetiredate());
		pstmt.setString(10, w.getRetirereason());
		pstmt.setString(11, w.getPhonenum());
		pstmt.setString(12, w.getCellphonenum());
		pstmt.setString(13, w.getEmail());
		pstmt.setString(14, w.getAddress());
		pstmt.setString(15, w.getBankname());
		pstmt.setString(16, w.getBankaccount());
		pstmt.setString(17, w.getBankown());
		pstmt.setString(18, w.getExc());
		pstmt.setString(19, w.getPhoto());
		pstmt.setString(20, w.getWorkernum());
		pstmt.executeUpdate();
	    pstmt.close();    
	    con.close(); 	
	}
	
	public void deleteWorker(String workernum)throws SQLException {//This method deletes employee information.
		String sql = "DELETE FROM employee.worker WHERE workernum=?"; 
	    pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, workernum);
		pstmt.executeUpdate();
	    pstmt.close();    
	    con.close(); 	
	}
	
	public Worker returnFind (String workernum)throws SQLException//Stores the searched employee information and returns it in the form of a worker
	{
		Worker w= new Worker();
		String sql = "SELECT*FROM employee.worker WHERE workernum=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, workernum);
		rs=pstmt.executeQuery();
		rs.next();
		w.setWorkernum(workernum);
		w.setName(rs.getString("name"));
		w.setNickname(rs.getString("nickname"));
		w.setBirth(rs.getString("birth"));
		w.setGender(rs.getString("gender"));
		w.setEntrydate(rs.getString("entrydate"));
		w.setEntersection(rs.getString("entrysection"));
		w.setRank(rs.getString("rank"));
		w.setDivision(rs.getString("division"));
		w.setRetiredate(rs.getString("retiredate"));
		w.setRetirereason(rs.getString("retirereason"));
		w.setPhonenum(rs.getString("phonenum"));
		w.setCellphonenum(rs.getString("cellphonenum"));
		w.setEmail(rs.getString("email"));
		w.setAddress(rs.getString("address"));
		w.setBankname(rs.getString("bankname"));
		w.setBankaccount(rs.getString("bankaccount"));
		w.setBankown(rs.getString("bankown"));
		w.setExc(rs.getString("exc"));
		w.setPhoto(rs.getString("photo"));
		rs.close();
		pstmt.close();    
	    con.close();
		return w;
	}
	
	public void close() throws SQLException {//This method returns the used resource.
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}

}
