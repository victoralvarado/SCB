package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DaoUsuario;
import modelo.Usuario;

/*
 * @Nombre de Clase: ProcesoUsuarios.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class ProcesoUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Usuario us = new Usuario();
        DaoUsuario daoUs = new DaoUsuario();
        String msj = null;
        String msjN = null;
        RequestDispatcher rd = null;
        try {

            if (request.getParameter("btnGuardar") != null) {
                us.setUserName(request.getParameter("txtUserName"));
                us.setPassword(request.getParameter("txtPassword"));
                us.setTipo(Integer.parseInt(request.getParameter("txtTipo")));

                daoUs.insertarUsuario(us);
                msj = "Datos insertados correctamente";
                rd = request.getRequestDispatcher("jsp/manteUsuario.jsp");
                request.setAttribute("msj", msj);
            }
            if (request.getParameter("btnGuardarN") != null) {
                us.setUserName(request.getParameter("txtUserName"));
                us.setPassword(request.getParameter("txtPassword"));
                us.setTipo(Integer.parseInt(request.getParameter("txtTipo")));

                daoUs.insertarUsuario(us);
                msjN = "Nuevo Usuario Agregado Correctamente";
                rd = request.getRequestDispatcher("jsp/admin.jsp");
                request.setAttribute("msjN", msjN);

            }
            if (request.getParameter("btnModificar") != null) {
                us.setIdUsuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
                us.setUserName(request.getParameter("txtUserName"));
                us.setPassword(request.getParameter("txtPassword"));
                us.setTipo(Integer.parseInt(request.getParameter("txtTipo")));

                daoUs.modiifcarUsuario(us);
                msj = "Datos modificados correctamente";
                rd = request.getRequestDispatcher("jsp/manteUsuario.jsp");
                request.setAttribute("msj", msj);
            }
            if (request.getParameter("btnEliminar") != null) {
                us.setIdUsuario(Integer.parseInt(request.getParameter("txtIdUsuario")));

                daoUs.eliminarUsuario(us);
                msj = "Datos eliminados correctamente";
                rd = request.getRequestDispatcher("jsp/manteUsuario.jsp");
                request.setAttribute("msj", msj);
            }

        } catch (Exception e) {
            request.setAttribute("error", e.toString());
        }
        rd.forward(request, response);
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
