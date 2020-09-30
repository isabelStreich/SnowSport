/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Categorie;
import entities.Commande;
import entities.Produit;
import entities.Utilisateur;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ybenhail
 */
public class ConnectionDb {

    private String username = "root";

	private String password = "abc123...";
	//private String dbName = "mydb";
	private String url = "jdbc:mysql://localhost:3310/mydb?serverTimezone=UTC";
	private String driver = "com.mysql.cj.jdbc.Driver";
         HashMap<Integer,Produit> listProduit = new HashMap<>();
        HashMap<Categorie,Integer> listCat = new HashMap<>();
        ArrayList<Utilisateur> userList = new ArrayList<>();
	
	
	private Connection con;
        
        private void openCnx() {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, username, password);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
        private void closeCnx() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
        
        public HashMap<Integer,Produit> chercherProduits() throws SQLException {
		openCnx();
		String sql = "Select * from produit";
		          PreparedStatement st = con.prepareStatement(sql);
		          ResultSet rs = st.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("idProduit");
			String nom= rs.getString("nomProduit");
			int idCat= rs.getInt("idCat");
			double prix= rs.getDouble("prix");
			String photo= rs.getString("photo");
			
			Produit p = new Produit();
			p.setIdCategorie(idCat);
			p.setIdProduit(id);
			p.setImageProduit(photo);
			p.setNomProduit(nom);
			p.setPrix(prix);
			listProduit.put(id, p);
			p=null;
		}
		
		closeCnx();
		return listProduit;
	}

        public void ajouterUtilisateur(Utilisateur u) throws SQLException {
		openCnx();
		String sql = "Insert into user(nomComplet,nomUser,email,password) values(?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		//st.setInt(1, u.getIdUtilisateur());
                st.setString(1, u.getNomComplet());
		st.setString(2, u.getNomUtilisateur());
		st.setString(3, u.getEmail());
		st.setString(4, u.getPassword());
		
		
		
		st.executeUpdate();
		closeCnx();
	}
        public void save(List<Commande> cmd) throws SQLException {
             openCnx();
                    
String sql = "Insert into commande(idProduit,qte,prix,idClient) values(?,?,?,?)";
    try (

		PreparedStatement st = con.prepareStatement(sql); ) {
        int i = 0;

        for (Commande c : cmd) {
st.setInt(1, c.getIdProduit());
		st.setInt(2, c.getQte());
		st.setDouble(3, c.getPrix());
		st.setInt(4,c.getIdUtilisateur());            // ...

            st.addBatch();
            i++;

            if (i % 1000 == 0 || i == cmd.size()) {
                st.executeBatch(); // Execute every 1000 items.
            }
        }
    }
}
         public void ajouterCommande(Commande c) throws SQLException {
		openCnx();
		String sql = "Insert into commande(idProduit,qte,prix,idClient) values(?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		//st.setInt(1, u.getIdUtilisateur());
                st.setInt(1, c.getIdProduit());
		st.setInt(2, c.getQte());
		st.setDouble(3, c.getPrix());
		st.setInt(4,c.getIdUtilisateur());
		
		
		
		st.executeUpdate();
		closeCnx();
	}

       /* public void ajouterUser(Utilisateur user) throws SQLException{
             openCnx();
		//String sql = "Insert into user values(?,?,?,?)";
                
		          PreparedStatement st = con.prepareStatement("Insert into user values(?,?,?,?)");
		          st.setInt(1, user.getIdUtilisateur());
                          st.setString(2, user.getNomUtilisateur());
                          st.setString(3, user.getPassword());
                          st.setInt(4, user.getIdRole());
                          st.executeUpdate();
                          closeCnx();
        }
*/
        
       public boolean verifierUtilisateur(String username, String password) throws SQLException {
		openCnx();
		int count = 0;
		String sql = "Select * from user where nomUser = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, username);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			count = 1;
		}
		
		closeCnx();
		if(count == 0)
			return false;
		
		return true;
	} 
        public ArrayList<Utilisateur> chercherUtilisateur() throws SQLException {
		openCnx();
		String sql = "Select * from user";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			
			String user = rs.getString("nomUser");
			String email = rs.getString("email");
			String name = rs.getString("nomComplet");
			int id = rs.getInt("idUser");
			String password = rs.getString("password");
			
			Utilisateur u = new Utilisateur();
			
			u.setEmail(email);
			u.setIdUtilisateur(id);
			u.setNomComplet(name);
			u.setNomUtilisateur(user);
			u.setPassword(password);
			userList.add(u);
			u=null;
				
		}
		
		closeCnx();
		return userList;
	}
        

        public void ajouterProduit(Produit p) throws SQLException {
		openCnx();
		String sql = "Insert into produit(nomProduit,prix,idCat,photo) values(?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, p.getNomProduit());
		st.setDouble(2, p.getPrix());
		st.setInt(3, p.getIdCategorie());
		
		st.setString(4, p.getImageProduit());
		
		
		st.executeUpdate();
		closeCnx();
	}
        
        
        public Produit chercherProduitParId(int id) throws SQLException {
		openCnx();
		String sql = "select * from produit where idProduit=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		ResultSet rst = pstmt.executeQuery();
		Produit p = new Produit();
		while(rst.next()){
			
			p.setIdProduit(rst.getInt("idProduit"));
			p.setNomProduit(rst.getString("nomProduit"));
			p.setPrix(rst.getDouble("prix"));
			p.setIdCategorie(rst.getInt("idCat"));
			p.setImageProduit(rst.getString("photo"));
		}
		closeCnx();
		return p;
	}
  public void modifierproduit(Produit p) throws SQLException {
		openCnx();
		String sql = "update produit set nomProduit=?,prix=?,photo=? where idProduit=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getNomProduit());
		st.setDouble(2, p.getPrix());
		st.setString(3, p.getImageProduit());
		st.setInt(4, p.getIdProduit());
		st.executeUpdate();
		closeCnx();
	}
  
  public void supprimerproduit(int id) throws SQLException {
		
		openCnx();
		String sql = "Delete from produit where idProduit=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);
		st.executeUpdate();
		closeCnx();
		
	}



  
 

  

   



}
