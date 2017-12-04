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
public class AddUserServlet extends HttpServlet {

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

        //1. get parameters from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String positionTitle = request.getParameter("positionTitle");
        String managerName = request.getParameter("managerName");
        String addEmployee = request.getParameter("addEmployee");

        List<String> errMsg = new LinkedList<>();
        List<String> msg = new LinkedList<>();

        /*
            Validate parameters
        */
        if (firstName.trim().isEmpty() || lastName.trim().isEmpty()
                || positionTitle.trim().isEmpty() || managerName.trim().isEmpty()) {
            errMsg.add("FirstName, LastName, positionTitle, and Manager's Name are required");
            request.setAttribute("errMsg", errMsg);
            request.getRequestDispatcher("getUser").forward(request, response);
        } else {
            User u = new User();

            final Users employees = Users.getInstance();
            u.setFirstName(firstName);
            u.setLastName(lastName);
            u.setPositionTitle(positionTitle);
            u.setManagerName(managerName);

            if (addEmployee != null) {
                try {
                    //3. insert the user
                    employees.addUser((User) u);
                    request.setAttribute("u", u);
                    msg.add(firstName + " " + lastName + " is added.");
                    request.setAttribute("msg", msg);

                } catch (UsersException ex) {
                    Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
                    request.setAttribute("errMsg", "Error with connection to Employees");
                }
            }
        }
        
        //5. forward control to UserServlet
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
