package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/*
 * @Nombre de Clase: ProcesoPrestamo.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class ProcesoPrestamo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Herramienta he = new Herramienta();
        Devolucion dev=new Devolucion();
        DaoDevolucion daoDev=new DaoDevolucion();
        DaoHerramienta daoHe = new DaoHerramienta();
        DaoDetallePrestamo daoDe = new DaoDetallePrestamo();
        DetallePrestamo de = new DetallePrestamo();
        Historial hi = new Historial();
        DaoHistorial daoHi =new DaoHistorial();
        String msj = null;
        RequestDispatcher rd = null;
        
        try {
            if (request.getParameter("btnGuardar") != null) {

                //Insertar DetallePrestamo
                de.setIdPersonal(Integer.parseInt(request.getParameter("txtIdPersonal")));
                de.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));
                de.setFechaHora(request.getParameter("txtFechaHora"));
                de.setPresPor(request.getParameter("txtPresPor"));
                daoDe.insertarDetallePrestamo(de);

                //Insertar Herramienta
                he.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));
                he.setNombre(request.getParameter("txtNombre"));
                he.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoria")));
                he.setUso(request.getParameter("txtUso"));
                he.setEstado(request.getParameter("txtEstado"));
                daoHe.modificarHerramienta(he);
                
                //Insertar al historial
                hi.setIdPersonal(Integer.parseInt(request.getParameter("txtIdPersonal")));
                hi.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));
                hi.setFechaHora(request.getParameter("txtFechaHora"));
                hi.setPresPor(request.getParameter("txtPresPor"));
                
                daoHi.insertarDetallePrestamoH(hi);
                

                msj = "Herramienta Prestada correctamente";

                rd = request.getRequestDispatcher("jsp/nuevoPrestamo.jsp");
            }
//            if (request.getParameter("btnModificar") != null) {
//                he.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));
//                he.setNombre(request.getParameter("txtNombre"));
//                he.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoria")));
//                he.setUso(request.getParameter("txtUso"));
//                he.setEstado(request.getParameter("txtEstado"));
//
//                daoHe.modificarHerramienta(he);
//                msj = "Datos modificados correctamente";
//
//                rd = request.getRequestDispatcher("jsp/nuevoPrestamo.jsp");
//            }
            if (request.getParameter("btnEntre") != null) {
                //Insertar Devolucion
                dev.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));
                dev.setIdPersonal(Integer.parseInt(request.getParameter("txtIdPersonal")));
                dev.setEstadoEntrega(request.getParameter("txtEstado"));
                dev.setFechaHora(request.getParameter("txtFecHora"));
                dev.setPrespor(request.getParameter("txtprepor"));
                dev.setResividaPor(request.getParameter("txtRecib"));
                daoDev.insertarDevolucion(dev);
                
                //Eliminar prestamo de Herramienta
                de.setIdPrestamo(Integer.parseInt(request.getParameter("txtIdPrestamo")));
                daoDe.eliminarDetallePrestamo(de);

                //Modificar Uso a de SI a NO
                he.setUso(request.getParameter("txtUso"));
                he.setEstado(request.getParameter("txtEstado"));
                he.setIdHerramienta(Integer.parseInt(request.getParameter("txtIdHerramienta")));

                daoHe.modificarUso(he);
                msj = "Herramienta entregada correctamente";
                rd = request.getRequestDispatcher("jsp/mantePrestamo.jsp");
            }
//            if (request.getParameter("btnFiltro")!=null) {
//                campo=request.getParameter("txtCampo");
//                criterio=request.getParameter("txtCriterio");
//                
//                filtro=daoHi.filtrarBusquedaH(campo, criterio);
//                request.setAttribute("filtro", filtro);
//                rd = request.getRequestDispatcher("jsp/historial.jsp");
//            }
//            if (request.getParameter("btnEliUno")!=null) {
//                hi.setIdPrestamo(Integer.parseInt(request.getParameter("txtIdPrestamo")));
//                daoHi.eliminarDetallePrestamoH(hi);
//                msj = "Registro eliminado correctamente";
//                rd = request.getRequestDispatcher("jsp/historial.jsp");
//            }
//            if (request.getParameter("btnEliTo")!=null) {
//                
//                daoHi.eliminarDetallePrestamoHT(hi);
//                msj = "Historial Eliminado";
//                rd = request.getRequestDispatcher("jsp/historial.jsp");
//            }
//            if (request.getParameter("btnEliDev")!=null) {
//                daoDev.eliminarDevolucionT(dev);
//                msj = "Historial Devolucion Eliminado";
//                rd = request.getRequestDispatcher("jsp/devoluciones.jsp");
//            }
//            if (request.getParameter("btnEliUnoDev")!=null) {
//                dev.setIdDevolucion(Integer.parseInt(request.getParameter("txtIdDevolucion")));
//                daoDev.eliminarDevolucionUno(dev);
//                msj = "Devolucion Eliminada";
//                rd = request.getRequestDispatcher("jsp/devoluciones.jsp");
//            }
            
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
