/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author melan
 */
public class Producto {
    private int idProducto;
    private int idCategoria;
    private String nombre_cat;
    private int idProveedor;
    private String nombre_prov;

    public String getNombre_cat() {
        return nombre_cat;
    }

    public void setNombre_cat(String nombre_cat) {
        this.nombre_cat = nombre_cat;
    }

    public String getNombre_prov() {
        return nombre_prov;
    }

    public void setNombre_prov(String nombre_prov) {
        this.nombre_prov = nombre_prov;
    }
    private String nombreProducto;
    private double precioNormal;
    private int ofertado;
    private double precioOferta;
    private int existencias;
    private String descripcion;
    private String imagen;

    // Constructor vacío
    public Producto() {
    }

    // Constructor con parámetros
    public Producto(int idProducto, int idCategoria, int idProveedor, String nombreProducto, double precioNormal,
                    int ofertado, double precioOferta, int existencias, String descripcion, String imagen) {
        this.idProducto = idProducto;
        this.idCategoria = idCategoria;
        this.idProveedor = idProveedor;
        this.nombreProducto = nombreProducto;
        this.precioNormal = precioNormal;
        this.ofertado = ofertado;
        this.precioOferta = precioOferta;
        this.existencias = existencias;
        this.descripcion = descripcion;
        this.imagen = imagen;
    }

    // Getters y setters
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public double getPrecioNormal() {
        return precioNormal;
    }

    public void setPrecioNormal(double precioNormal) {
        this.precioNormal = precioNormal;
    }

    public int getOfertado() {
        return ofertado;
    }

    public void setOfertado(int ofertado) {
        this.ofertado = ofertado;
    }

    public double getPrecioOferta() {
        return precioOferta;
    }

    public void setPrecioOferta(double precioOferta) {
        this.precioOferta = precioOferta;
    }

    public int getExistencias() {
        return existencias;
    }

    public void setExistencias(int existencias) {
        this.existencias = existencias;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}

