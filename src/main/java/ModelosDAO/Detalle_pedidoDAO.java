/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelosDAO;

import Modelos.DetallePedido;
import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author magana
 */
public class Detalle_pedidoDAO {
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public Detalle_pedidoDAO() throws ClassNotFoundException{
        CN = new cn();
    }
    
    
    public boolean agregarDetallePedido(DetallePedido detallePedido) {
        String sql = "INSERT INTO detallepedido (idpedido, idproducto, cantidad, subtotal) VALUES (?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, detallePedido.getIdPedido());
            ps.setInt(2, detallePedido.getIdProducto());
            ps.setInt(3, detallePedido.getCantidad());
            ps.setDouble(4, detallePedido.getSubtotal());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<DetallePedido> listarDetallesPedidoPorPedido(int idPedido) {
        List<DetallePedido> listaDetallesPedido = new ArrayList<>();
        String sql = "SELECT * FROM detallepedido WHERE idpedido = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();

            while (rs.next()) {
                DetallePedido detallePedido = new DetallePedido();
                detallePedido.setIdDetalle(rs.getInt("iddetalle"));
                detallePedido.setIdPedido(rs.getInt("idpedido"));
                detallePedido.setIdProducto(rs.getInt("idproducto"));
                detallePedido.setCantidad(rs.getInt("cantidad"));
                detallePedido.setSubtotal(rs.getDouble("subtotal"));

                listaDetallesPedido.add(detallePedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaDetallesPedido;
    }

    public boolean actualizarDetallePedido(DetallePedido detallePedido) {
    String sql = "UPDATE detallepedido SET idpedido=?, idproducto=?, cantidad=?, subtotal=? WHERE iddetalle=?";

    try {
        ps = con.prepareStatement(sql);
        ps.setInt(1, detallePedido.getIdPedido());
        ps.setInt(2, detallePedido.getIdProducto());
        ps.setInt(3, detallePedido.getCantidad());
        ps.setDouble(4, detallePedido.getSubtotal());
        ps.setInt(5, detallePedido.getIdDetalle());

        int filasAfectadas = ps.executeUpdate();
        return filasAfectadas > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

public boolean eliminarDetallePedido(int idDetalle) {
    String sql = "DELETE FROM detallepedido WHERE iddetalle=?";

    try {
        ps = con.prepareStatement(sql);
        ps.setInt(1, idDetalle);

        int filasAfectadas = ps.executeUpdate();
        return filasAfectadas > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

}
