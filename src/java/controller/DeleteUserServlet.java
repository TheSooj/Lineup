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

/**
 *
 * @author Johne
 */
public class DeleteUserServlet extends HttpServlet {

    
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
        String delete = request.getParameter("delete");
        
        String employeeID = request.getParameter("employeeID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        
        List<String> deleteMsg = new LinkedList<>();
        Users users = Users.getInstance();
        
        if(delete != null) {
            try {
                int currentEmpID = Integer.parseInt(employeeID);
                //obtain user with specified ID
                users.deleteUser(users.selectEmployee(currentEmpID));
                request.setAttribute("u", users.selectAllEmployees());
                
                deleteMsg.add("Employee: " + employeeID + " - \""+ firstName + " " + lastName + "\"" + " has been removed from Employees");
            request.setAttribute("deleteMsg", deleteMsg);
            } catch (UsersException ex) {
                Logger.getLogger(DeleteUserServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("errMsg", "error accessing Employees");
            }
        }
            // forward control
        request.getRequestDispatcher("getUser").forward(request, response); 
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
