
package model;


import java.io.Serializable;

/**
 *
 * @author Johne
 */
public class User implements Serializable{
    
    private int employeeID;
    private String firstName;
    private String lastName;
    private String positionTitle;
    private String managerName;
    private long phoneNumber;
    private int phoneNum;
    
    /**
     * Get the value of employeeID
     *
     * @return the value of employeeID
     */
    public int getEmployeeID() {
        return employeeID;
    }
    /**
     * Set the value of employeeID
     *
     * @param employeeID new value of employeeID
     */
    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    /**
     * Get the value of phoneNumber
     *
     * @return the value of phoneNumber
     */
    public long getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Set the value of phoneNumber
     *
     * @param phoneNumber new value of phoneNumber
     */
    public void setPhoneNumber(long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }


    /**
     * Get the value of managerName
     *
     * @return the value of managerName
     */
    public String getManagerName() {
        return managerName;
    }

    /**
     * Set the value of managerName
     *
     * @param managerName new value of managerName
     */
    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }



    /**
     * Get the value of phoneNum
     *
     * @return the value of phoneNum
     */
    public int getPhoneNum() {
        return phoneNum;
    }

    /**
     * Set the value of phoneNum
     *
     * @param phoneNum new value of phoneNum
     */
    public void setPhoneNum(int phoneNum) {
        this.phoneNum = phoneNum;
    }


    /**
     * Get the value of position
     *
     * @return the value of position
     */
    public String getPositionTitle() {
        return positionTitle;
    }

    /**
     * Set the value of position
     *
     * @param position new value of position
     */
    public void setPositionTitle(String position) {
        this.positionTitle = position;
    }

    /**
     * Get the value of lastName
     *
     * @return the value of lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Set the value of lastName
     *
     * @param lastName new value of lastName
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    /**
     * Get the value of firstName
     *
     * @return the value of firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Set the value of firstName
     *
     * @param firstName new value of firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    /**
     * 
     * @param obj
     * @return true if same objects are equal, otherwise returns false
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (this.employeeID != other.employeeID) {
            return false;
        }
        return true;
    }

    
}
