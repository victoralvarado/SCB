package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/*
 * @Nombre de Clase: ProcesoCategoria.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class ProcesoCategoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Categoria ca = new Categoria();
        DaoCategoria daoCa = new DaoCategoria();
        String msj = null;
        RequestDispatcher rd = null;
        try {

            if (request.getParameter("btnGuardar") != null) {
                ca.setNombreCategoria(request.getParameter("txtNombre"));
                daoCa.insertarCategoria(ca);
                msj = "Datos insertados correctamente";
            }
            if (request.getParameter("btnModificar") != null) {
                ca.setIdCategoria(Integer.parseInt(request.getParameter("txtIdCategoria")));
                ca.setNombreCategoria(request.getParameter("txtNombre"));

                daoCa.modificarCategoria(ca);
                msj = "Datos modificados correctamente";
                
            }
            if (request.getParameter("btnEliminar") != null) {
               ca.setIdCategoria(Integer.parseInt(request.getParameter("txtIdCategoria")));
               
                daoCa.eliminarCategoria(ca);
                msj = "Datos eliminados correctamente";
            }
            rd = request.getRequestDispatcher("jsp/manteCategoria.jsp");
                request.setAttribute("msj", msj);
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
