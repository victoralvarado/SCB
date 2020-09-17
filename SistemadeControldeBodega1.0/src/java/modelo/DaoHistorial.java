package modelo;

import java.util.*;
import java.sql.*;

/*
 * @Nombre de Clase: DaoHistorial.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class DaoHistorial extends Conexion {

    public ArrayList<Historial> mostrarDetalleH() throws Exception {
        ArrayList<Historial> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select p.id,p.nombre,p.apellido,hi.idPrestamoH,hi.idherramienta,"
                    + "h.nombreHerramienta,hi.fechaHora,hi.prespor from personal p "
                    + "inner join historial hi on p.id = hi.idPersonal inner join herramienta h "
                    + "on hi.idHerramienta=h.idHerramienta order by hi.fechaHora desc;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Historial h = new Historial();
                h.setIdPersonal(rs.getInt(1));
                h.setNombre(rs.getString(2));
                h.setApellido(rs.getString(3));
                h.setIdPrestamo(rs.getInt(4));
                h.setIdHerramienta(rs.getInt(5));
                h.setNombreHerramienta(rs.getString(6));
                h.setFechaHora(rs.getString(7));
                h.setPresPor(rs.getString(8));
                list.add(h);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    public void insertarDetallePrestamoH(Historial h) throws Exception {
        try {
            this.conectar();
            String sql = "insert into historial(idPersonal, idHerramienta, fechaHora, prespor) values(?,?,?,?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, h.getIdPersonal());
            ps.setInt(2, h.getIdHerramienta());
            ps.setString(3, h.getFechaHora());
            ps.setString(4, h.getPresPor());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
//    public void eliminarDetallePrestamoHT(Historial h) throws Exception {
//        try {
//            this.conectar();
//            String sql = "truncate table historial";
//            PreparedStatement ps = this.getCon().prepareStatement(sql);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            throw e;
//        } finally {
//            this.desconectar();
//        }
//    }
//
//    public void eliminarDetallePrestamoH(Historial h) throws Exception {
//        try {
//            this.conectar();
//            String sql = "delete from historial where idPrestamoH=?";
//            PreparedStatement ps = this.getCon().prepareStatement(sql);
//            ps.setInt(1, h.getIdPrestamo());
//            ps.executeUpdate();
//        } catch (Exception e) {
//            throw e;
//        } finally {
//            this.desconectar();
//        }
//    }
    
    public ArrayList<Historial> filtrarBusquedaH(String campo, String criterio)throws Exception{
        ArrayList<Historial> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select p.id,p.nombre,p.apellido,hi.idPrestamoH,hi.idherramienta,h.nombreHerramienta,hi.fechaHora,hi.prespor from personal p inner join historial hi on p.id = hi.idPersonal inner join herramienta h on hi.idHerramienta=h.idHerramienta where "+campo+" like '%"+criterio+"%' order by hi.fechaHora desc;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Historial h = new Historial();
                h.setIdPersonal(rs.getInt(1));
                h.setNombre(rs.getString(2));
                h.setApellido(rs.getString(3));
                h.setIdPrestamo(rs.getInt(4));
                h.setIdHerramienta(rs.getInt(5));
                h.setNombreHerramienta(rs.getString(6));
                h.setFechaHora(rs.getString(7));
                h.setPresPor(rs.getString(8));
                list.add(h);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

}
