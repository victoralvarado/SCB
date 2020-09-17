package modelo;

import java.sql.*;
import java.util.*;

/*
 * @Nombre de Clase: DaoUsuario.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class DaoUsuario extends Conexion {

    public ArrayList<Usuario> mostarUsuario() throws Exception {
        ArrayList<Usuario> list = new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select * from usuario;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setIdUsuario(rs.getInt(1));
                us.setUserName(rs.getString(2));
                us.setPassword(rs.getString(3));
                us.setTipo(rs.getInt(4));
                list.add(us);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return list;
    }

    public void insertarUsuario(Usuario us) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into usuario(userName,password,tipo) values(?,?,?)";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            ps.setString(1, us.getUserName());
            ps.setString(2, us.getPassword());
            ps.setInt(3, us.getTipo());
            ps.executeUpdate();
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void modiifcarUsuario(Usuario us) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update usuario set userName=?, password=?, tipo=? where idUsuario=?";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            ps.setString(1, us.getUserName());
            ps.setString(2, us.getPassword());
            ps.setInt(3, us.getTipo());
            ps.setInt(4, us.getIdUsuario());
            ps.executeUpdate();
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminarUsuario(Usuario us) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from usuario where idUsuario=?";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            ps.setInt(1, us.getIdUsuario());
            ps.executeUpdate();
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
}

