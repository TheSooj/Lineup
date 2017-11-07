
package db;

/**
 *
 * @author Johne
 */
public class ConnectionPoolException extends Exception {
    
    public ConnectionPoolException(String msg) {
        super(msg);
    }

    public ConnectionPoolException(String message, Throwable cause) {
        super(message, cause);
    }
}
