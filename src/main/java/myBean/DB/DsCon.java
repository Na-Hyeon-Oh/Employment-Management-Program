package myBean.DB;

import javax.naming.*;
import java.sql.*;
import javax.sql.DataSource;

public class DsCon {
    /**
     * Get DataSource from Connection
	 * @return Connection
	 * @throws SQLException, NamingException
	 */
	public static Connection getConnection() throws SQLException, NamingException {
        Context initContext = new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/mydbTest");

        return ds.getConnection();
    }
}
