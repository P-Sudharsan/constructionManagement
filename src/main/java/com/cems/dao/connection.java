package com.cems.dao;

import java.sql.*;
import java.sql.Connection;

public class connection {
	
	private static Connection con;
    
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cemsdb","root","senthosa");
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
