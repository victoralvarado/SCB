package modelo;

/*
 * @Nombre de Clase: Herramienta.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class Herramienta {

    private int idHerramienta;
    private String nombre;
    private int idCategoria;
    private String uso;
    private String estado;
    private String nombreC;

    public Herramienta() {
    }

    public Herramienta(int idHerramienta, String nombre, int idCategoria, String uso, String estado, String nombreC) {
        this.idHerramienta = idHerramienta;
        this.nombre = nombre;
        this.idCategoria = idCategoria;
        this.uso = uso;
        this.estado = estado;
        this.nombreC = nombreC;
    }

    public int getIdHerramienta() {
        return idHerramienta;
    }

    public void setIdHerramienta(int idHerramienta) {
        this.idHerramienta = idHerramienta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getUso() {
        return uso;
    }

    public void setUso(String uso) {
        this.uso = uso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNombreC() {
        return nombreC;
    }

    public void setNombreC(String nombreC) {
        this.nombreC = nombreC;
    }

    

}
