
package db;

/**
 *
 * @author Johne
 */
public class EmployeesException extends Exception {
    
    public EmployeesException(String msg) {
        super(msg);
    }

    public EmployeesException(String message, Throwable cause) {
        super(message, cause);
    }
}
