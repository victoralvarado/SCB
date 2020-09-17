package modelo;

/*
 * @Nombre de Clase: Conexion.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
import java.sql.*;

public class Conexion {
    private Connection con;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    public void conectar() throws Exception
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3307/bodega?user=root&password=");
        }
        catch (ClassNotFoundException | SQLException e)
        {
            throw e;
        }
    }
    
    public void desconectar() throws Exception
    {
        try
        {
            if(con!=null)
            {
                if(con.isClosed()==false)
                {
                    con.close();
                }
            }
        }
        catch (SQLException e)
        {
            throw e;
        }
    }
}
