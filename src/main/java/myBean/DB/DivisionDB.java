package myBean.DB;

import java.sql.*;
import javax.naming.NamingException;
import myBean.DB.DsCon;

public class DivisionDB {//This class has methods to manage division.
	private Connection con;	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DivisionDB() throws SQLException, NamingException {
		con = DsCon.getConnection();
	}
	
	public void addDivision(Division d) throws SQLException {//A method to add a division.
		String sql = "INSERT INTO employee.division(code, dname, used) VALUES(?, ?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, d.getCode());
		pstmt.setString(2, d.getDname());
		pstmt.setString(3, d.getUsed());
		pstmt.executeUpdate(); 
		pstmt.close();
		con.close();
	}	
	
	public void motifyDivision(Division d)throws SQLException {//This method is used to save the modified division.
		String sql = "UPDATE employee.division SET code=?, dname=?, used=? WHERE idx=?"; 
	    pstmt = con.prepareStatement(sql); 
	    pstmt.setString(1, d.getCode());
		pstmt.setString(2, d.getDname());
		pstmt.setString(3, d.getUsed());
		pstmt.setInt(4,d.getIdx());
		pstmt.executeUpdate();
	    pstmt.close();    
	    con.close(); 	
	}
	
	public ResultSet getResultSet()throws SQLException//This method brings only divisions whose use is yes.
	{
		String sql = "SELECT * FROM employee.division where used='yes'"; 
	    pstmt = con.prepareStatement(sql); 
		rs=pstmt.executeQuery();
		return rs;
	}
	public void close() throws SQLException {//This method returns the used resource.
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
	
	

}
