package modelo;

/*
 * @Nombre de Clase: Devolucion.
 * @Version: 1.0.
 * @Copyright: Sistema de Control de Bodega.
 * @Author Victor, Sarai, Jaylin, Berenice
 */
public class Devolucion {
    private int idDevolucion;
    private int idHerramienta;
    private int idPersonal;
    private String prespor;
    private String estadoEntrega;
    private String fechaHora;
    private String resividaPor;
    private String nombre;
    private String apellido;
    private String nombreHerramienta;

    public Devolucion() {
    }

    public Devolucion(int idDevolucion, int idHerramienta, int idPersonal, String prespor, String estadoEntrega, String fechaHora, String resividaPor, String nombre, String apellido, String nombreHerramienta) {
        this.idDevolucion = idDevolucion;
        this.idHerramienta = idHerramienta;
        this.idPersonal = idPersonal;
        this.prespor = prespor;
        this.estadoEntrega = estadoEntrega;
        this.fechaHora = fechaHora;
        this.resividaPor = resividaPor;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nombreHerramienta = nombreHerramienta;
    }

    public int getIdDevolucion() {
        return idDevolucion;
    }

    public void setIdDevolucion(int idDevolucion) {
        this.idDevolucion = idDevolucion;
    }

    public int getIdHerramienta() {
        return idHerramienta;
    }

    public void setIdHerramienta(int idHerramienta) {
        this.idHerramienta = idHerramienta;
    }

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
    }

    public String getPrespor() {
        return prespor;
    }

    public void setPrespor(String prespor) {
        this.prespor = prespor;
    }

    public String getEstadoEntrega() {
        return estadoEntrega;
    }

    public void setEstadoEntrega(String estadoEntrega) {
        this.estadoEntrega = estadoEntrega;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getResividaPor() {
        return resividaPor;
    }

    public void setResividaPor(String resividaPor) {
        this.resividaPor = resividaPor;
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

    public String getNombreHerramienta() {
        return nombreHerramienta;
    }

    public void setNombreHerramienta(String nombreHerramienta) {
        this.nombreHerramienta = nombreHerramienta;
    }
    
    
}
