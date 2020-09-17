package modelo;

import java.util.*;
import java.sql.*;

/*
 * @Nombre de Clase: DaoDetallePrestamo.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class DaoDetallePrestamo extends Conexion {

    public ArrayList<DetallePrestamo> mostrarDetalle() throws Exception {
        ArrayList<DetallePrestamo> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select p.id,p.nombre,p.apellido,d.idPrestamo,d.idherramienta,h.nombreHerramienta,"
                    + "d.fechaHora,d.prespor from personal p inner join detallePrestamo d on p.id = d.idPersonal "
                    + "inner join herramienta h on d.idHerramienta=h.idHerramienta order by p.id asc;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetallePrestamo dp = new DetallePrestamo();
                dp.setIdPersonal(rs.getInt(1));
                dp.setNombre(rs.getString(2));
                dp.setApellido(rs.getString(3));
                dp.setIdPrestamo(rs.getInt(4));
                dp.setIdHerramienta(rs.getInt(5));
                dp.setNombreHerramienta(rs.getString(6));
                dp.setFechaHora(rs.getString(7));
                dp.setPresPor(rs.getString(8));
                list.add(dp);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    public void insertarDetallePrestamo(DetallePrestamo dp) throws Exception {
        try {
            this.conectar();
            String sql = "insert into detalleprestamo(idPersonal, idHerramienta, fechaHora,prespor) values(?,?,?,?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, dp.getIdPersonal());
            ps.setInt(2, dp.getIdHerramienta());
            ps.setString(3, dp.getFechaHora());
            ps.setString(4, dp.getPresPor());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

//    public void modificarDetallePrestamo(DetallePrestamo dp) throws Exception {
//        try {
//            this.conectar();
//            String sql = "update detalleprestamo set idPersonal=?, idHerramienta=?, fechaHora=? where idPrestamo=?";
//            PreparedStatement ps = this.getCon().prepareStatement(sql);
//            ps.setInt(1, dp.getIdPersonal());
//            ps.setInt(2, dp.getIdHerramienta());
//            ps.setString(3, dp.getFechaHora());
//            ps.executeUpdate();
//        } catch (Exception e) {
//            throw e;
//        } finally {
//            this.desconectar();
//        }
//    }

    public void eliminarDetallePrestamo(DetallePrestamo dp) throws Exception {
        try {
            this.conectar();
            String sql = "delete from detalleprestamo where idPrestamo=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, dp.getIdPrestamo());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    public ArrayList<DetallePrestamo> prestamoPersonal() throws Exception {
        ArrayList<DetallePrestamo> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select distinct p.id,p.nombre,p.apellido from personal p inner join detallePrestamo d on p.id = d.idPersonal order by p.id;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetallePrestamo dp = new DetallePrestamo();
                dp.setIdPersonal(rs.getInt(1));
                dp.setNombre(rs.getString(2));
                dp.setApellido(rs.getString(3));
                list.add(dp);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
    //FILTRAR DETALLE PRESTAMO
    public ArrayList<DetallePrestamo> mostrarDetalleF(String campo, String criterio) throws Exception {
        ArrayList<DetallePrestamo> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select p.id,p.nombre,p.apellido,d.idPrestamo,d.idherramienta,h.nombreHerramienta,"
                    + "d.fechaHora,d.prespor from personal p inner join detallePrestamo d on p.id = d.idPersonal "
                    + "inner join herramienta h on d.idHerramienta=h.idHerramienta where "+campo+" like '%"+criterio+"%' "
                    + "order by p.id asc;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetallePrestamo dp = new DetallePrestamo();
                dp.setIdPersonal(rs.getInt(1));
                dp.setNombre(rs.getString(2));
                dp.setApellido(rs.getString(3));
                dp.setIdPrestamo(rs.getInt(4));
                dp.setIdHerramienta(rs.getInt(5));
                dp.setNombreHerramienta(rs.getString(6));
                dp.setFechaHora(rs.getString(7));
                dp.setPresPor(rs.getString(8));
                list.add(dp);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

}
