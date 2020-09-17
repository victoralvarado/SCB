package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/*
 * @Nombre de Clase: ProcesoHerramientas.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class ProcesoHerramientas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Herramienta he = new Herramienta();
        DaoHerramienta daoHe = new DaoHerramienta();
        String msj = null;
        RequestDispatcher rd = null;
        try {

            if (request.getParameter("btnGuardar") != null) {
                he.setNombre(request.getParameter("txtNombre"));
                he.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoria")));
                he.setUso(request.getParameter("txtUso"));
                he.setEstado(request.getParameter("txtEstado"));
                daoHe.insertarHerramienta(he);
                msj = "Datos insertados correctamente";
            }
            if (request.getParameter("btnModificar") != null) {
                he.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));
                he.setNombre(request.getParameter("txtNombre"));
                he.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoria")));
                he.setUso(request.getParameter("txtUso"));
                he.setEstado(request.getParameter("txtEstado"));

                daoHe.modificarHerramienta(he);
                msj = "Datos modificados correctamente";
                
            }
            if (request.getParameter("btnEliminar") != null) {
               he.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));

                daoHe.eliminarHerramienta(he);
                msj = "Datos eliminados correctamente";
            }
            rd = request.getRequestDispatcher("jsp/manteHerramienta.jsp");
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
