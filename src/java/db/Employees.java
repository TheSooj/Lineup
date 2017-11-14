/*
    This is the Connection Pool - a Java singleton class.
    This makes sure that only one connection is shared by all users of the application
    and limits number of time connections are opened. 
 */
package db;


import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class Employees {
    
    //create a Datasource object to get a connection to the data source or database
    private DataSource db;  
    
    /**
     * 
     * @return a list of employees
     * @throws EmployeesException 
     */
    public List<User> selectAllEmployees() throws EmployeesException {
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
            Logger.getLogger(Employees.class.getName()).log(Level.SEVERE, null, ex);
            throw new EmployeesException("error accessing catalog", ex);
        }
        return employees;
    }
    
    /** 
     * Returns the employees with the specified 
     * employee ID, or null if either not found or if an error occurs
     * @param id
     * @return product 
     * @throws db.EmployeesException 
     */
    public User selectEmployee(int id) throws EmployeesException {
        String psql  = "SELECT EmployeeID, FirstName, LastName, ManagerName, PositionTitle FROM Employees WHERE EmployeeID = ?;";
        try(Connection conn = db.getConnection();
                PreparedStatement ps = prepStmtEmpID(conn, psql, id);
                ResultSet rs = ps.executeQuery();)
        {
            if(rs.next()){
                User u = new User();
                u.setEmployeeID(rs.getInt("EmployeeID"));
                u.setFirstName(rs.getString("FirstName"));
                u.setLastName(rs.getString("LastName"));
                u.setPositionTitle(rs.getString("PositionTitle"));
                u.setManagerName(rs.getString("ManagerName"));
                return u;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Employees.class.getName()).log(Level.SEVERE, null, ex);
            throw new EmployeesException("error finding product in catalog", ex);
        }
        return null;
    }
    
    
    
    /**
     * assign the getLineup method to db to use the JNDI to access Database
     * log any errors if there is an issue connecting to the Database
     */
    private Employees() {
        try {
            db = getLineup();
        } catch (NamingException ex) {
            Logger.getLogger(Employees.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Employees getInstance() {
        return EmployeesHolder.INSTANCE;
    }
    
    private static class EmployeesHolder {
        private static final Employees INSTANCE = new Employees();
    }

    
    private PreparedStatement prepStmtEmployee(Connection conn, String psql, Employees employee) throws SQLException {
        PreparedStatement pStmt = conn.prepareCall(psql);
        pStmt.setObject(1, employee);
        return pStmt;
    }
    
    private PreparedStatement prepStmtEmpID(Connection conn, String psql, int id) throws SQLException {
        PreparedStatement pStmt = conn.prepareCall(psql);
        pStmt.setInt(1, id);
        return pStmt;
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
