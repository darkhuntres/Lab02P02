/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelosDAO;

import Modelos.Proveedor;
import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author melan
 */
public class ProveedorDAO {
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public ProveedorDAO() throws ClassNotFoundException{
        CN = new cn();
    }
    
    public boolean agregarProveedor(Proveedor prov) {
        String sql = "INSERT INTO proveedores(nombre_proveedor, telefono, contacto) "
                + "VALUES (?, ?, ?)";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombreProveedor());
            ps.setString(2, prov.getTelefono());
            ps.setString(3, prov.getContacto());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }
    
    public int ObtenerId(String nombre){
        int id = 0;
        String sql = "select idproveedor from proveedores where nombre_proveedor=?";
        
        try{
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            rs = ps.executeQuery();
            
            if(rs.next()){
                id = rs.getInt("idproveedor");
              
            }
        }catch(Exception e){
            
        }
        
        return id;
    }
    
    public ArrayList listarNombreProveedor(){
        ArrayList<Proveedor> lista = new ArrayList<>();
        String sql = "select nombre_proveedor from proveedores";
        
        try{
            con = CN.getCon();
            ps = con.prepareStatement(sql); 
            rs = ps.executeQuery();
            
            while(rs.next()){
                Proveedor prov = new Proveedor();
                prov.setNombreProveedor(rs.getString("nombre_proveedor"));
                lista.add(prov);
            }
            
        }catch(Exception e){
            
        }
        return lista;
    }
    
    public ArrayList<Proveedor> listarProveedores() {
        ArrayList<Proveedor> lista = new ArrayList<>();
        String sql = "SELECT * FROM proveedores";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Proveedor prov = new Proveedor();
                prov.setIdProveedor(rs.getInt("idproveedor"));
                prov.setNombreProveedor(rs.getString("nombre_proveedor"));
                prov.setTelefono(rs.getString("telefono"));
                prov.setContacto(rs.getString("contacto"));
                lista.add(prov);
            }

        } catch (Exception e) {
            
        }
        return lista;
    }
    
    public boolean eliminarProveedor(int id) {
        String sql = "DELETE FROM proveedores WHERE idproveedor=?";

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
