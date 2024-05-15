package com.conexion;

import java.sql.Connection;
import java.sql.DriverManager;



public class Conexion1 {
    Connection con;
    String url;
    String user="root";
    String pass= "";

    public Conexion1() {
        this.url = "jdbc:mysql://localhost:3306/heladeria2";
    }
    
    public Connection Conexion() throws ClassNotFoundException{
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection( url,user,pass);
            return con;
        }catch (Exception e){
            System.out.println(e.toString());
        }    
            return con;
        
    }
}

    

