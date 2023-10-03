/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelosDAO;

import Modelos.Producto;
import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author melan
 */
public class ProductoDAO {
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductoDAO() throws ClassNotFoundException {
        CN = new cn();
    }

    public ArrayList<Producto> listarProductos() {
        ArrayList<Producto> lista = new ArrayList<>();
        String sql = "SELECT p.idproducto, c.nombre_categoria, pr.nombre_proveedor, p.nombre_producto, p.precio_normal,"
                + "p.ofertado, p.precio_oferta, p.existencias, p.descripcion, p.imagen "
                + "FROM productos p JOIN categorias c ON p.idcategoria = c.idcategoria JOIN proveedores pr ON p.idproveedor = pr.idproveedor;";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto prod = new Producto();
                prod.setIdProducto(rs.getInt("idproducto"));
                prod.setNombre_cat(rs.getString("nombre_categoria"));
                prod.setNombre_prov(rs.getString("nombre_proveedor"));
                prod.setNombreProducto(rs.getString("nombre_producto"));
                prod.setPrecioNormal(rs.getDouble("precio_normal"));
                prod.setOfertado(rs.getInt("ofertado"));
                prod.setPrecioOferta(rs.getDouble("precio_oferta"));
                prod.setExistencias(rs.getInt("existencias"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setImagen(rs.getString("imagen"));
                lista.add(prod);
            }

        } catch (Exception e) {

        }
        return lista;
    }

    public Producto listarProductoPorId(int id) {
        Producto prod = null;
        String sql = "SELECT p.idproducto, c.nombre_categoria, pr.nombre_proveedor, p.nombre_producto, p.precio_normal,"
                + "p.ofertado, p.precio_oferta, p.existencias, p.descripcion, p.imagen "
                + "FROM productos p JOIN categorias c ON p.idcategoria = c.idcategoria JOIN proveedores pr ON p.idproveedor = pr.idproveedor"
                + " where p.idproducto = ?";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                prod = new Producto();
                prod.setIdProducto(rs.getInt("idproducto"));
                prod.setNombre_cat(rs.getString("nombre_categoria"));
                prod.setNombre_prov(rs.getString("nombre_proveedor"));
                prod.setNombreProducto(rs.getString("nombre_producto"));
                prod.setPrecioNormal(rs.getDouble("precio_normal"));
                prod.setOfertado(rs.getInt("ofertado"));
                prod.setPrecioOferta(rs.getDouble("precio_oferta"));
                prod.setExistencias(rs.getInt("existencias"));
                prod.setDescripcion("descripcion");
                prod.setImagen("imagen");
            }
        } catch (Exception e) {

        }

        return prod;
    }

    public boolean agregarProducto(Producto prod) {
        String sql = "INSERT INTO productos VALUES(idcategoria, idproveedor, nombre_producto, precio_normal, "
                + "ofertado, precio_oferta, existencias, descripcion, imagen)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, prod.getIdCategoria());
            ps.setInt(2, prod.getIdProveedor());  
            ps.setString(3, prod.getNombreProducto());
            ps.setDouble(4, prod.getPrecioNormal());
            ps.setInt(5, prod.getOfertado());
            ps.setDouble(6, prod.getPrecioOferta());
            ps.setInt(7, prod.getExistencias());
            ps.setString(8, prod.getDescripcion());
            ps.setString(9, prod.getImagen());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }

    public boolean actualizarProducto(Producto prod) {
        String sql = "INSERT INTO productos (idcategoria, idproveedor, nombre_producto, precio_normal, "
            + "ofertado, precio_oferta, existencias, descripcion, imagen)"
            + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, prod.getIdCategoria());
            ps.setInt(2, prod.getIdProveedor());
            ps.setString(3, prod.getNombreProducto());
            ps.setDouble(4, prod.getPrecioNormal());
            ps.setInt(5, prod.getOfertado());
            ps.setDouble(6, prod.getPrecioOferta());
            ps.setInt(7, prod.getExistencias());
            ps.setString(8, prod.getDescripcion());
            ps.setString(9, prod.getImagen());
            ps.setInt(10, prod.getIdProducto());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }

    public boolean eliminarProducto(int id) {
        String sql = "DELETE FROM productos WHERE idproducto=?";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }
}
