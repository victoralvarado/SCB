package controlador;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.IngresarUsuario;

/*
 * @Nombre de Clase: ProcesoIngresarUsuario.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class ProcesoIngresarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion=request.getSession();
        
        if (request.getParameter("btnIngresar") != null) {
            IngresarUsuario login = new IngresarUsuario();
            String userName = request.getParameter("txtUserName");
            String password = request.getParameter("txtPassword");
            try {
                switch (login.login(userName, password)) {
                    case 1:
                        sesion.setAttribute("usuario", userName);
                        sesion.setAttribute("nivel", "1");
                        response.sendRedirect("jsp/");
                        break;
                    case 2:
                        sesion.setAttribute("usuario", userName);
                        sesion.setAttribute("nivel", "2");
                        response.sendRedirect("jsp/");
                        break;
                    
                    default:
                        response.sendRedirect("jsp/error.jsp");
                    break;
                }
            } catch (Exception e) {
                Logger.getLogger(IngresarUsuario.class.getName()).log(Level.SEVERE, null, e);
            }
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
