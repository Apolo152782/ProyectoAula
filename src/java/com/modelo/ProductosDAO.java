package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


    public class ProductosDAO extends Conexion {
    public int insertarProductos(Productos c){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO productos ( codigo, nombre, proveedores, stock, precio)Values(?, ?, ?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getCodigo());
            pre.setString(2, c.getNombre());
            pre.setString(3, c.getProveedores());
            pre.setInt(4, c.getStock());
            pre.setDouble(5, c.getPrecio());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Productos> mostrarProductos(){
        ArrayList<Productos> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM productos";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Productos c = new Productos();
                c.setId(rs.getInt(1));
                c.setCodigo(rs.getInt(2));
                c.setNombre(rs.getString(3));
                c.setProveedores(rs.getString(4));
                c.setStock(rs.getInt(5));
                c.setPrecio(rs.getDouble(6));
                
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarProdcutos (Productos c){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE productos SET codigo=?, nombre=?, proveedores=?, stock=?, precio=? WHERE id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1,c.getCodigo());
            pre.setString(2,c.getNombre());
            pre.setString(3, c.getProveedores());
            pre.setInt(4,c.getStock());
            pre.setDouble(5,c.getPrecio());
            pre.setInt(6, c.getId());
            
            res = pre.executeUpdate();            
        } catch (SQLException e) {
            System.out.println("Error al modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }    
    
    public int eliminarProductos(Productos c){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM productos WHERE id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getId());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public Productos ListarCodigo(String codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

    

