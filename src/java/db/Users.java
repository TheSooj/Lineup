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
public class Users {
    
    //create a Datasource object to get a connection to the data source or database
    private DataSource db;  
    
    /**
     * 
     * @return a list of employees
     * @throws UsersException 
     */
    public List<User> selectAllEmployees() throws UsersException {
        List<User> employees = new LinkedList<>();
        try(Connection conn = db.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EmployeeID, FirstName, LastName, PositionTitle, ManagerName FROM Employees");) {
            
            while(rs.next()){
                User user = new User();
                
                user.setEmployeeID(rs.getInt("EmployeeID"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setPositionTitle(rs.getString("PositionTitle"));
                user.setManagerName(rs.getString("ManagerName"));
                
                employees.add(user);
            }
            // return results
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            throw new UsersException("error accessing Employees", ex);
        }
        return employees;
    }
    
    /** 
     * Returns the employees with the specified id
     * employee ID, or null if either not found or if an error occurs
     * @param id
     * @return product 
     * @throws db.UsersException 
     */
    public User selectEmployee(int id) throws UsersException {
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
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            throw new UsersException("error finding employee in Employees", ex);
        }
        return null;
    }
    
    public boolean exists(int id) throws UsersException {
        boolean exists = true;
        try(Connection conn = db.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT EmployeeID FROM Employees;");)
        {
            while(rs.next()) {
                if(id != Integer.parseInt("EmployeeID"))
                    exists = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            throw new UsersException("error accessing employees", ex);
        }
        return exists;
    }
    
    /**
     * Add a new user to the database
     * @param user
     * @throws UsersException 
     */
    public void addUser(User user) throws UsersException{
        String psql = "INSERT INTO Employees "
                + "(FirstName, LastName, PositionTitle, ManagerName) VALUES "
                + "(?, ?, ?, ?);";
        
        try(Connection con = db.getConnection();
                PreparedStatement ps = prepStmtEmployee(con, psql, user);)
        {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getPositionTitle());
            ps.setString(4, user.getManagerName());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            throw new UsersException("error finding user in Employees", ex);
        } 
    }
    
    /** 
     * Removes user from Employees if present, otherwise no action taken. 
     * @param user
     * @throws db.UsersException
     */
    public void deleteUser(User user) throws UsersException{
        String psql = "DELETE FROM Employees WHERE EmployeeID = ?";
        try(Connection conn = db.getConnection();
                PreparedStatement ps = prepStmtEmployee(conn, psql, user);)
        {
            ps.setInt(1, user.getEmployeeID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            throw new UsersException("error accessing Employees", ex);
        }
    }
    
    /** 
     * Updates the user in Employees. 
     * @param user
     * @throws db.UsersException
     */
    public void updateUser(User user) throws UsersException {
        String psql = "UPDATE Employees SET "
                + "FirstName = ?, "
                + "LastName = ?, "
                + "PositionTitle = ?, "
                + "ManagerName = ? "
                + "WHERE EmployeeID = ?;";
        try(Connection conn = db.getConnection();
                PreparedStatement ps = prepStmtEmployee(conn, psql, user);) 
        {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getPositionTitle());
            ps.setString(4, user.getManagerName());
            ps.setInt(5, user.getEmployeeID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            throw new UsersException("Error accessing Employees", ex);
        }
    }
    
    /**
     * assign the getLineup method to db to use the JNDI to access Database
     * log any errors if there is an issue connecting to the Database
     */
    private Users() {
        try {
            db = getLineup();
        } catch (NamingException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Users getInstance() {
        return EmployeesHolder.INSTANCE;
    }
    
    private static class EmployeesHolder {
        private static final Users INSTANCE = new Users();
    }

    
    private PreparedStatement prepStmtEmployee(Connection conn, String psql, User user) throws SQLException {
        PreparedStatement pStmt = conn.prepareCall(psql);
        pStmt.setObject(1, user);
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
