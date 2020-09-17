
package modelo;

import java.util.*;
import java.sql.*;

/*
 * @Nombre de Clase: DaoCategoria.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class DaoCategoria extends Conexion{
    
    public ArrayList<Categoria> mostrarCategoria() throws Exception{
        ArrayList<Categoria> list = new ArrayList<Categoria>();
        ResultSet rs;
        try 
        {
            this.conectar();
            String sql = "select * from categoria";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next())
            {
                Categoria ca = new Categoria();
                ca.setIdCategoria(rs.getInt(1));
                ca.setNombreCategoria(rs.getString(2));
                list.add(ca);
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return list;
    }
    
    public void insertarCategoria(Categoria ca) throws Exception{
        try 
        {
            this.conectar();
            String sql = "insert into categoria(nombreCategoria) values (?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, ca.getNombreCategoria());
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
    
    public void modificarCategoria(Categoria ca) throws Exception{
        try 
        {
            this.conectar();
            String sql = "update categoria set nombreCategoria=? where idCategoria=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, ca.getNombreCategoria());
            ps.setInt(2, ca.getIdCategoria());
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
    
    public void eliminarCategoria(Categoria ca) throws Exception{
        try 
        {
            this.conectar();
            String sql = "delete from categoria where idCategoria=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, ca.getIdCategoria());
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
