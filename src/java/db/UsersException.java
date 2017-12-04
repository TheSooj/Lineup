
package db;

/**
 *
 * @author Johne
 */
public class UsersException extends Exception {
    
    public UsersException(String msg) {
        super(msg);
    }

    public UsersException(String message, Throwable cause) {
        super(message, cause);
    }
}
