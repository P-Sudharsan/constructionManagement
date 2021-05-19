package com.cems.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cems.model.User;

public class AdminDAO {
	
Connection con;
	
	
	public AdminDAO(Connection con) {
		this.con = con;
	}
	
public boolean saveUser(User nuser) {
    	
    	boolean status = false;
    	
    	PreparedStatement ps;
    	try {
    		String sql = "insert into admin(aname,email,password) values(?,?,?)";
    		
    		ps = con.prepareStatement(sql);
    		
    		ps.setString(3, nuser.getAname());
    		ps.setString(7, nuser.getEmail());
    		ps.setString(8, nuser.getPassword());
    		ps.executeUpdate();
    		status = true;
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return status;
    }
    public boolean validate(User login) {
    	
    	boolean status = false;
    	String sql = "select * from admin where aname = ? and password=?";
    	
    	PreparedStatement ps;
    	try {
			ps = con.prepareStatement(sql);
			ps.setString(1, login.getAname());
			ps.setString(2, login.getPassword());
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				status = true;
			}else {
				status=false;
			}
			//status = rs.next();
		   // System.out.println(status);
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
    	
    	return status;
    }
}
