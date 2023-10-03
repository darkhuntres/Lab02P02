/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelosDAO;

import Modelos.Pedido;
import db.cn;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author magana
 */
public class PedidoDAO {
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public PedidoDAO() throws ClassNotFoundException{
        CN = new cn();
    }
    
    
    public boolean agregarPedido(Pedido pedido) {
        String sql = "INSERT INTO pedidos (idcliente, fecha, total, estado) VALUES (?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, pedido.getIdCliente());
            ps.setDate(2, (Date) pedido.getFecha());
            ps.setDouble(3, pedido.getTotal());
            ps.setString(4, pedido.getEstado());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Pedido> listarPedidos() {
        List<Pedido> listaPedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedidos";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setIdPedido(rs.getInt("idpedido"));
                pedido.setIdCliente(rs.getInt("idcliente"));
                pedido.setFecha(rs.getDate("fecha"));
                pedido.setTotal(rs.getDouble("total"));
                pedido.setEstado(rs.getString("estado"));

                listaPedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaPedidos;
    }
    
    public boolean actualizarPedido(Pedido pedido) {
    String sql = "UPDATE pedidos SET idcliente=?, fecha=?, total=?, estado=? WHERE idpedido=?";

    try {
        ps = con.prepareStatement(sql);
        ps.setInt(1, pedido.getIdCliente());
        ps.setDate(2, (Date) pedido.getFecha());
        ps.setDouble(3, pedido.getTotal());
        ps.setString(4, pedido.getEstado());
        ps.setInt(5, pedido.getIdPedido());

        int filasAfectadas = ps.executeUpdate();
        return filasAfectadas > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

public boolean eliminarPedido(int idPedido) {
    String sql = "DELETE FROM pedidos WHERE idpedido=?";

    try {
        ps = con.prepareStatement(sql);
        ps.setInt(1, idPedido);

        int filasAfectadas = ps.executeUpdate();
        return filasAfectadas > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

}
