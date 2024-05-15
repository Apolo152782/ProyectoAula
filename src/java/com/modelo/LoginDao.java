package com.modelo;

import com.conexion.Conexion1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDao {
    Connection con;
    PreparedStatement ps ;
    ResultSet rs;
    Conexion1 cn = new Conexion1();
    
    public login validar (String correo, String pass) throws ClassNotFoundException{
        login l= new login ();
        String sql = "SELECT * FROM usuarios WHERE correo =? AND pass =?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()){
                l.setId(rs.getInt("id"));
                l.setNombre(rs.getString("nombre"));
                l.setCorreo(rs.getString("correo"));
                l.setPass(rs.getString("pass"));
                l.setRol(rs.getString("rol"));
                
            }    
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return l;
    }
    
}