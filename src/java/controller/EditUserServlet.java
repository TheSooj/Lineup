package controller;

import db.Users;
import db.UsersException;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Johne
 */
public class EditUserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String employeeID = request.getParameter("employeeID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String positionTitle = request.getParameter("positionTitle");
        String managerName = request.getParameter("managerName");

        String edit = request.getParameter("edit");
        String delete = request.getParameter("delete");
        
        List<String> errMsg = new LinkedList<>();
        List<String> msg = new LinkedList<>();

        if (delete != null) {
            request.getRequestDispatcher("removeUser").forward(request, response);

        } else {
            Users users = Users.getInstance();
            
            try {
                int currentEmpID = Integer.parseInt(employeeID);
                User u1 = users.selectEmployee(currentEmpID);
                
                
                if (firstName.trim().isEmpty() || lastName.trim().isEmpty() ||
                        positionTitle.trim().isEmpty() || managerName.trim().isEmpty()) {
                    errMsg.add("First name, Last Name, Position Title, and Manager's name is required");
                    request.setAttribute("errMsg", errMsg);
                } else {
                    u1.setEmployeeID(currentEmpID);
                    u1.setFirstName(firstName);
                    u1.setLastName(lastName);
                    u1.setManagerName(managerName);
                    u1.setPositionTitle(positionTitle);

                    users.updateUser(u1);
                    request.setAttribute("u", u1);
                    
                    msg.add("Employee: " + employeeID + " - \""+ firstName + " " + lastName + "\"" + " has been edited.");
                    request.setAttribute("msg", msg);
                }
            } catch (UsersException ex) {
                Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("errMsg", "Error with connection to Employees");
            }
            request.getRequestDispatcher("getUser").forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
