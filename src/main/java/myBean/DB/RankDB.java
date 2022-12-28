package myBean.DB;
import java.sql.*;
import javax.naming.NamingException;
import myBean.DB.DsCon;

public class RankDB {//This is a class that has methods to manage positions.
	private Connection con;	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RankDB() throws SQLException, NamingException {
		con = DsCon.getConnection();
	}
	
	public void addRank(Rank r) throws SQLException {//This is a method to add a rank.
		String sql = "INSERT INTO employee.rank(code, rname, used) VALUES(?, ?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, r.getCode());
		pstmt.setString(2, r.getRname());
		pstmt.setString(3, r.getUsed());
		pstmt.executeUpdate(); 
		pstmt.close();
		con.close();
	}	
	
	public void motifyRank(Rank r)throws SQLException {//This method is used to save the modified rank.
		String sql = "UPDATE employee.rank SET code=?, rname=?, used=? WHERE idx=?"; 
	    pstmt = con.prepareStatement(sql); 
	    pstmt.setString(1, r.getCode());
		pstmt.setString(2, r.getRname());
		pstmt.setString(3, r.getUsed());
		pstmt.setInt(4,r.getIdx());
		pstmt.executeUpdate();
	    pstmt.close();    
	    con.close(); 	
	}
	public ResultSet getResultSet()throws SQLException//This is a method that only brings in ranks for which Used is yes.
	{
		String sql = "SELECT * FROM employee.rank where used='yes'"; 
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
