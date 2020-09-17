
package modelo;

import java.sql.*;
import java.util.*;

/*
 * @Nombre de Clase: DaoHerramienta.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class DaoHerramienta extends Conexion {
    
    public ArrayList<Herramienta> mostrarHerramienta() throws Exception{
        ArrayList<Herramienta> list = new ArrayList<>();
        ResultSet rs;
        try 
        {
            this.conectar();
            String sql = "select h.*,c.nombreCategoria from herramienta h "
                    + "inner join categoria c on h.idCategoria=c.idCategoria "
                    + "order by nombreHerramienta;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Herramienta he = new Herramienta();
                he.setIdHerramienta(rs.getInt(1));
                he.setNombre(rs.getString(2));
                he.setIdCategoria(rs.getInt(3));
                he.setUso(rs.getString(4));
                he.setEstado(rs.getString(5));
                he.setNombreC(rs.getString(6));
                list.add(he);
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
    
    public void insertarHerramienta(Herramienta he) throws Exception{
        try 
        {
            this.conectar();
            String sql = "insert into herramienta(nombreHerramienta, idCategoria, uso, estado) values (?,?,?,?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, he.getNombre());
            ps.setInt(2, he.getIdCategoria());
            ps.setString(3, he.getUso());
            ps.setString(4, he.getEstado());
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
    
    public void modificarHerramienta(Herramienta he) throws Exception{
        try 
        {
            this.conectar();
            String sql = "update herramienta set nombreHerramienta=?, idCategoria=?, uso=?, "
                    + "estado=? where idHerramienta=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, he.getNombre());
            ps.setInt(2, he.getIdCategoria());
            ps.setString(3, he.getUso());
            ps.setString(4, he.getEstado());
            ps.setInt(5, he.getIdHerramienta());
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
    public void modificarUso(Herramienta he) throws Exception{
        try 
        {
            this.conectar();
            String sql = "update herramienta set uso=?, estado=? where idHerramienta=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, he.getUso());
            ps.setString(2, he.getEstado());
            ps.setInt(3, he.getIdHerramienta());
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
    
    
    public void eliminarHerramienta(Herramienta he) throws Exception{
        try 
        {
            this.conectar();
            String sql = "delete from herramienta where idHerramienta=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, he.getIdHerramienta());
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
    
    public ArrayList<Herramienta> mostrarHerramientaUso() throws Exception{
        ArrayList<Herramienta> list = new ArrayList<>();
        ResultSet rs;
        try 
        {
            this.conectar();
            String sql = "select * from herramienta where uso='Si';";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Herramienta he = new Herramienta();
                he.setUso(rs.getString(1));
                list.add(he);
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
}
