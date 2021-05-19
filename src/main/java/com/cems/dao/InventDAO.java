package com.cems.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cems.model.Product;

public class InventDAO {
	
Connection con;
	
	
	public InventDAO(Connection con) {
		this.con = con;
	}
	
	 //add books information to database
    public boolean addProduct(Product product){
        boolean test = false;
        PreparedStatement pst;
        try{
            String query =  "insert into product (pname,quantity,priceperhr) values(?,?,?)";
            pst = con.prepareStatement(query);
            pst.setString(1, product.getPname());
            pst.setString(2, product.getQuantity());
            pst.setString(3, product.getPriceperhr());
            pst.executeUpdate();
            test= true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
//    retrieve the book details from database
    public List<Product> getAllProducts(){
        List<Product> pro = new ArrayList<>();
        
        try{
            
            String query = "select * from product";
            PreparedStatement pt = this.con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            
            while(rs.next()){
                int product_id = rs.getInt("Product_id");
                String pname = rs.getString("pname");
                String quantity = rs.getString("quantity");
                String priceperhr = rs.getString("priceperhr");
                 
                
                Product row = new Product(product_id,pname,quantity,priceperhr);
                pro.add(row);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return pro;
    }
    
    
//    edit book information
    public boolean editProductInfo(Product product){
        boolean status = false;
        try{
            String query = "update product set pname=?, quantity=?, priceperhr=?  where product_id=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, product.getPname());
            pt.setString(2, product.getQuantity());
            pt.setString(3, product.getPriceperhr());
            pt.setInt(4, product.getProduct_id());
            
            pt.executeUpdate();
            status = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
       return status; 
    }
    
//    get single book information in edit page
    public Product getSingleProduct(int product_id){
        Product pro = null;
        
        try{
            String query = "select * from product where product_id=? ";
            
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, product_id);
            ResultSet rs= pt.executeQuery();
            
            while(rs.next()){
                int product_id1 = rs.getInt("product_id");
                String pname = rs.getString("pname");
                String quantity = rs.getString("quantity");
                String priceperhr = rs.getString("priceperhr");
               
                pro = new Product(product_id1,pname,quantity,priceperhr);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return pro;
    }
    
    
//    delete books from database
    
    
    public void deleteProduct(int product_id){
        try{
            
           String query= "delete from product where product_id=?";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, product_id);
           pt.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
