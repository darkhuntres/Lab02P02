/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelosDAO;

import Modelos.Cliente;
import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author melan
 */
public class ClienteDAO {
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public ClienteDAO() throws ClassNotFoundException{
        CN = new cn();
    }
    
    public Cliente ObtenerUsuario(String user, String password){
        Cliente cliente = null;
        String sql = "SELECT * FROM clientes WHERE correo=? AND clave=?";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idcliente"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setSexo(rs.getString("sexo"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setPais(rs.getString("pais"));
                cliente.setClave(rs.getString("clave"));
                cliente.setCorreo(rs.getString("correo"));
            }
        } catch (Exception e) {

        } 
        
        return cliente;
    }
    
    public ArrayList<Cliente> listarClientes() {
        ArrayList<Cliente> lista = new ArrayList<>();
        String sql = "SELECT * FROM clientes WHERE nombres <> 'admin'";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idcliente"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setSexo(rs.getString("sexo"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setPais(rs.getString("pais"));
                cliente.setClave(rs.getString("clave"));
                cliente.setCorreo(rs.getString("correo"));
                lista.add(cliente);
            }

        } catch (Exception e) {
            
        }
        return lista;
    }

    public Cliente listarClientePorId(int id) {
        Cliente cliente = null;
        String sql = "SELECT * FROM clientes WHERE idcliente=?";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idcliente"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setSexo(rs.getString("sexo"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setPais(rs.getString("pais"));
                cliente.setClave(rs.getString("clave"));
                cliente.setCorreo(rs.getString("correo"));
            }
        } catch (Exception e) {

        } 

        return cliente;
    }

    
    public boolean agregarCliente(Cliente cliente) {
        String sql = "INSERT INTO clientes(nombres, apellidos, sexo, direccion, telefono, "
                + "pais, clave, correo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNombres());
            ps.setString(2, cliente.getApellidos());
            ps.setString(3, cliente.getSexo());
            ps.setString(4, cliente.getDireccion());
            ps.setString(5, cliente.getTelefono());
            ps.setString(6, cliente.getPais());
            ps.setString(7, cliente.getClave());
            ps.setString(8, cliente.getCorreo());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }

    public boolean actualizarCliente(Cliente cliente) {
        String sql = "UPDATE clientes SET nombres=?, apellidos=?, sexo=?, direccion=?, telefono=?, pais=?, clave=?, correo=? WHERE idcliente=?";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNombres());
            ps.setString(2, cliente.getApellidos());
            ps.setString(3, cliente.getSexo());
            ps.setString(4, cliente.getDireccion());
            ps.setString(5, cliente.getTelefono());
            ps.setString(6, cliente.getPais());
            ps.setString(7, cliente.getClave());
            ps.setString(8, cliente.getCorreo());
            ps.setInt(9, cliente.getIdCliente());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }

    public boolean eliminarCliente(int idCliente) {
        String sql = "DELETE FROM clientes WHERE idcliente=?";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (Exception e) {
            return false;
        }
    }
}
