/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package one;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
public class Home extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        Cookie ck[]=request.getCookies();
        String username = null;
        try {
            for (Cookie ck1 : ck) {
                if (ck1.getName().equals("username")) {
                    username = ck1.getValue();
                }
            }
            
            request.setAttribute("username", username);
        } catch (Exception e){
            //request.getRequestDispatcher("index.html").forward(request, response);
        }
        //check if still logged in
        if (username != null){
            String action = request.getParameter("page");
            if (action == null){
                action = "";
            } 
            switch (action) {
                case "request":
                    request.getRequestDispatcher("WEB-INF/request.jsp").forward(request, response);
                    break;
                case "schedule":
                    request.getRequestDispatcher("WEB-INF/schedule.jsp").forward(request, response);
                    break;
                case "user":
                    request.getRequestDispatcher("WEB-INF/user.jsp").forward(request, response);
                    break;
                case "logout":
                    request.getRequestDispatcher("WEB-INF/Logout").forward(request, response);
                    break;
                case "requestDaysOff":
                    request.getRequestDispatcher("WEB-INF/requestDaysOff.jsp").forward(request, response);
                    break;
                case "requestSwitchShifts":
                    request.getRequestDispatcher("WEB-INF/requestSwitchShifts.jsp").forward(request, response);
                    break;
                default:
                    request.getRequestDispatcher("WEB-INF/home.jsp").forward(request, response);
                    break;
            }
        } else {
            request.getRequestDispatcher("index.html").forward(request, response);            
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
