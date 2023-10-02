/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author melan
 */
public class cn {
    private Connection con;
    
    public cn() throws ClassNotFoundException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root","");
        } catch(Exception e){
            System.err.println("Error"+e);

        }
    }
    
    public Connection getCon() { return con; }
}
