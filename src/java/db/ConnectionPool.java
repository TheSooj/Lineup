/*
    This is the Connection Pool - a Java singleton class.
    This makes sure that only one connection is shared by all users of the application
    and limits number of time connections are opened. 
 */
package db;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.User;

/**
 *
 * @author Johne
 */
public class ConnectionPool {
    
    /**
     * 
     * @return a list of employees
     * @throws ConnectionPoolException 
     */
    public List<User> selectAllEmployees() throws ConnectionPoolException {
        List<User> employees = new LinkedList<>();
        try(Connection conn = db.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EMPLOYEEID, FIRSTNAME, LASTNAME, POSITIONTITLE, MANAGERNAME FROM EMPLOYEES");) {
            
            while(rs.next()){
                User user = new User();
                
                user.setEmployeeID(rs.getInt("EMPLOYEEID"));
                user.setFirstName(rs.getString("FIRSTNAME"));
                user.setLastName(rs.getString("LASTNAME"));
                user.setPositionTitle(rs.getString("POSITIONTITLE"));
                user.setManagerName(rs.getString("MANAGERNAME"));
                
                employees.add(user);
            }
            // return results
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionPool.class.getName()).log(Level.SEVERE, null, ex);
            throw new ConnectionPoolException("error accessing catalog", ex);
        }
        return employees;
    }
    
    //create a Datasource object to get a connection to the data source or database
    private DataSource db;  
    
    /**
     * assign the getLineup method to db to use the JNDI to access Database
     * log any errors if there is an issue connecting to the Database
     */
    private ConnectionPool() {
        try {
            db = getLineup();
        } catch (NamingException ex) {
            Logger.getLogger(ConnectionPool.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ConnectionPool getInstance() {
        return ConnectionPoolHolder.INSTANCE;
    }
    
    private static class ConnectionPoolHolder {
        private static final ConnectionPool INSTANCE = new ConnectionPool();
    }

    /**
     * 
     * @return the Datasource to use the JNDI to access the Database
     * @throws NamingException 
     */
    private DataSource getLineup() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/Lineup");
    }
}
