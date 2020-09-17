package modelo;

import java.sql.*;

/*
 * @Nombre de Clase: IngresarUsuario.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class IngresarUsuario extends Conexion{
    public int login(String usuario, String password) throws Exception {
        int tipo = 0;
        ResultSet rs;
        try {
            this.conectar();
            String sql = "select tipo from usuario where userName=? and password=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                tipo=rs.getInt("tipo");
            }
        } catch (Exception e) {
            throw e;
        }
        finally{
            this.desconectar();
        }
        return tipo;
    }
}
