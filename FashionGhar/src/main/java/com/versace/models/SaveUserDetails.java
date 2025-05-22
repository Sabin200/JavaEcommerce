package com.versace.models;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.versace.EncryptDecrypt.EncryptionDecryption;
import com.versace.databaseConnection.DatabaseConnection;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SaveUserDetails {
	private DatabaseConnection dc;
    private Connection con;

    public SaveUserDetails() {
        this.dc = new DatabaseConnection();
        this.con = this.dc.getConnect();
    }

    public int saveDetails(UserDetails ud) {
        int result =0;

        String query = "insert into users(first_name,last_name,address,contact,email,username,password,user_role,user_image) "
                + "values(?,?,?,?,?,?,?,?,?)";


        try {
              EncryptionDecryption AED = new  EncryptionDecryption ();
                String pass = ud.getPassword();
                String encrypted_data =AED.encrypt(pass);

            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, ud.getFirstName());
            ps.setString(2, ud.getLastName());
            ps.setString(3, ud.getAddress());
            ps.setInt(4, ud.getContact());
            ps.setString(5, ud.getEmail());
            ps.setString(6, ud.getUsername());
            ps.setString(7, encrypted_data);
            ps.setString(8, "customer");
            ps.setString(9, ud.getUserImage());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }
    
    public int updateUser(ChangedUserDetails ud, HttpServletRequest request) {
    	HttpSession session =request.getSession();
        int result = 0;
        String update_query = "update users set first_name = ?, last_name= ?, address = ?, contact = ?, "
                 + "email = ?, username = ? where user_id = ?";
        try {
            PreparedStatement ps = this.con.prepareStatement(update_query);
            ps.setString(1, ud.getFirstName());
            ps.setString(2, ud.getLastName());
            ps.setString(3, ud.getAddress());
            ps.setInt(4, ud.getContact());
            ps.setString(5, ud.getEmail());
            ps.setString(6, ud.getUsername());
            ps.setInt(7, ud.getUserId());
            result = ps.executeUpdate();
            session.invalidate();
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

}
