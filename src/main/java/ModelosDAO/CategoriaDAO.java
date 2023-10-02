/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelosDAO;

import Modelos.Categoria;
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
public class CategoriaDAO {
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public CategoriaDAO() throws ClassNotFoundException{
        CN = new cn();
    }
    
    public List listar(){
        ArrayList<Categoria> lista = new ArrayList<>();
        String sql = "select * from categorias";
        
        try{
            con = CN.getCon();
            ps = con.prepareStatement(sql); 
            rs = ps.executeQuery();
            
            while(rs.next()){
                Categoria cat = new Categoria();
                cat.setIdCategoria(rs.getInt("idcategoria"));
                cat.setNombreCategoria(rs.getString("nombre_categoria"));
                lista.add(cat);
            }
            
        }catch(Exception e){
            
        }
        return lista;
    }
    
    public List listarNombreCategoria(){
        ArrayList<Categoria> lista = new ArrayList<>();
        String sql = "select nombre_categoria from categorias";
        
        try{
            con = CN.getCon();
            ps = con.prepareStatement(sql); 
            rs = ps.executeQuery();
            
            while(rs.next()){
                Categoria cat = new Categoria();
                cat.setNombreCategoria(rs.getString("nombre_categoria"));
                lista.add(cat);
            }
            
        }catch(Exception e){
            
        }
        return lista;
    }
    
    public int ObtenerId(String nombre){
        int id = 0;
        String sql = "select idcategoria from categorias where nombre_categoria=?";
        
        try{
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            rs = ps.executeQuery();
            
            if(rs.next()){
                id = rs.getInt("idcategoria");
              
            }
        }catch(Exception e){
            
        }
        
        return id;
    }
    
    public Categoria ListarById(int id){
        Categoria cat = new Categoria();
        String sql = "select * from categorias where idcategoria=?";
        
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if(rs.next()){
                cat.setIdCategoria(rs.getInt("idcategoria"));
                cat.setNombreCategoria(rs.getString("nombre_categoria"));
              
            }
        } catch (Exception e) {
        }
        
        return cat;
    }
    
    public boolean agregarCategoria(Categoria categoria) {
    String sql = "INSERT INTO categorias(nombre_categoria) VALUES (?)";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, categoria.getNombreCategoria());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean actualizarCategoria(Categoria categoria, int id) {
    String sql = "UPDATE categorias SET nombre_categoria=? WHERE idcategoria=?";
    
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, categoria.getNombreCategoria());
            ps.setInt(2, id);

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }

    public boolean eliminar(int id){
        String sql = "delete from categorias where idcategoria=?";
        
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
