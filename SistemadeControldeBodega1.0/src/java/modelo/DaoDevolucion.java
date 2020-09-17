package modelo;

import java.sql.*;
import java.util.*;

/*
 * @Nombre de Clase: DaoDevolucion.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class DaoDevolucion extends Conexion {

    public ArrayList<Devolucion> mostrarDevolucion() throws Exception {
        ArrayList<Devolucion> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select de.idDevolucion,p.id,p.nombre,p.apellido,h.idHerramienta,h.nombreHerramienta,"
                    + "de.estadoEntre,de.prespor, de.recibidaPor,de.fechaHora from devolucion de inner join personal p "
                    + "on de.idPersonal=p.id inner join herramienta h on de.idHerramienta=h.idHerramienta "
                    + "order by de.fechaHora desc;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Devolucion de = new Devolucion();
                de.setIdDevolucion(rs.getInt(1));
                de.setIdPersonal(rs.getInt(2));
                de.setNombre(rs.getString(3));
                de.setApellido(rs.getString(4));
                de.setIdHerramienta(rs.getInt(5));
                de.setNombreHerramienta(rs.getString(6));
                de.setEstadoEntrega(rs.getString(7));
                de.setPrespor(rs.getString(8));
                de.setResividaPor(rs.getString(9));
                de.setFechaHora(rs.getString(10));
                list.add(de);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    public void insertarDevolucion(Devolucion de) throws Exception {
        try {
            this.conectar();
            String sql = "insert into devolucion (idHerramienta, idPersonal, estadoEntre,"
                    + " fechaHora, prespor, recibidaPor) values(?,?,?,?,?,?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, de.getIdHerramienta());
            ps.setInt(2, de.getIdPersonal());
            ps.setString(3, de.getEstadoEntrega());
            ps.setString(4, de.getFechaHora());
            ps.setString(5, de.getPrespor());
            ps.setString(6, de.getResividaPor());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    
//    public void eliminarDevolucionT(Devolucion de)throws Exception{
//        try {
//            this.conectar();
//            String sql = "truncate table devolucion";
//            PreparedStatement ps = this.getCon().prepareStatement(sql);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            throw e;
//        } finally {
//            this.desconectar();
//        }
//    }
//    public void eliminarDevolucionUno(Devolucion de) throws Exception {
//        try {
//            this.conectar();
//            String sql = "delete from devolucion where idDevolucion=?";
//            PreparedStatement ps = this.getCon().prepareStatement(sql);
//            ps.setInt(1, de.getIdDevolucion());
//            ps.executeUpdate();
//        } catch (Exception e) {
//            throw e;
//        } finally {
//            this.desconectar();
//        }
//    }
    
    //FILTRAR BUSQUEDA HISTORIAL DEVOLUCIONES
    public ArrayList<Devolucion> mostrarDevolucionF(String campo, String criterio) throws Exception {
        ArrayList<Devolucion> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select de.idDevolucion,p.id,p.nombre,p.apellido,h.idHerramienta,"
                    + "h.nombreHerramienta,de.estadoEntre,de.prespor, de.recibidaPor,de.fechaHora "
                    + "from devolucion de inner join personal p on de.idPersonal=p.id "
                    + "inner join herramienta h on de.idHerramienta=h.idHerramienta "
                    + "where "+campo+" like '%"+criterio+"%' order by de.fechaHora desc;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Devolucion de = new Devolucion();
                de.setIdDevolucion(rs.getInt(1));
                de.setIdPersonal(rs.getInt(2));
                de.setNombre(rs.getString(3));
                de.setApellido(rs.getString(4));
                de.setIdHerramienta(rs.getInt(5));
                de.setNombreHerramienta(rs.getString(6));
                de.setEstadoEntrega(rs.getString(7));
                de.setPrespor(rs.getString(8));
                de.setResividaPor(rs.getString(9));
                de.setFechaHora(rs.getString(10));
                list.add(de);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }
}
