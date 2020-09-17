package modelo;

/*
 * @Nombre de Clase: Historial.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class Historial {
    private int idPrestamo;
    private int idPersonal;
    private int idHerramienta;
    private String nombreHerramienta;
    private String fechaHora;
    private String nombre;
    private String apellido;
    private int idCategoria;
    private String uso; 
    private String estado;
    private String presPor;

    public Historial() {
    }

    public Historial(int idPrestamo, int idPersonal, int idHerramienta, String nombreHerramienta, String fechaHora, String nombre, String apellido, int idCategoria, String uso, String estado, String presPor) {
        this.idPrestamo = idPrestamo;
        this.idPersonal = idPersonal;
        this.idHerramienta = idHerramienta;
        this.nombreHerramienta = nombreHerramienta;
        this.fechaHora = fechaHora;
        this.nombre = nombre;
        this.apellido = apellido;
        this.idCategoria = idCategoria;
        this.uso = uso;
        this.estado = estado;
        this.presPor = presPor;
    }

    public int getIdPrestamo() {
        return idPrestamo;
    }

    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
    }

    public int getIdHerramienta() {
        return idHerramienta;
    }

    public void setIdHerramienta(int idHerramienta) {
        this.idHerramienta = idHerramienta;
    }

    public String getNombreHerramienta() {
        return nombreHerramienta;
    }

    public void setNombreHerramienta(String nombreHerramienta) {
        this.nombreHerramienta = nombreHerramienta;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
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

    public String getPresPor() {
        return presPor;
    }

    public void setPresPor(String presPor) {
        this.presPor = presPor;
    }

   
}
