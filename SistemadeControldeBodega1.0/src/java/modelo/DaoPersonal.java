package modelo;

import java.util.*;
import java.sql.*;

/*
 * @Nombre de Clase: DaoPersonal.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class DaoPersonal extends Conexion {

    public ArrayList<Personal> mostarPersonal() throws Exception {
        ArrayList<Personal> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select * from personal;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Personal per = new Personal();
                per.setIdPersonal(rs.getInt(1));
                per.setNombre(rs.getString(2));
                per.setApellido(rs.getString(3));
                per.setEdad(rs.getInt(4));
                list.add(per);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }

        return list;
    }

    public void insertarPersonal(Personal per) throws Exception {
        try {
            this.conectar();
            String sql = "insert into personal (nombre, apellido, edad) values(?,?,?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);

            ps.setString(1, per.getNombre());
            ps.setString(2, per.getApellido());
            ps.setInt(3, per.getEdad());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    public void modifcarPersonal(Personal per) throws Exception {
        try {
            this.conectar();
            String sql = "update personal set nombre=?, apellido=?, edad=? where id=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, per.getNombre());
            ps.setString(2, per.getApellido());
            ps.setInt(3, per.getEdad());
            ps.setInt(4, per.getIdPersonal());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    public void eliminarPersonal(Personal per) throws Exception {
        try {
            this.conectar();
            String sql = "delete from personal where id=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, per.getIdPersonal());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

}
