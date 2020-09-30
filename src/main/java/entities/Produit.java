/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.ArrayList;


public class Produit {

    private int idProduit;
    private String nomProduit;
    private String description;
    private Double prix;
    //private boolean selected;
    private String imageProduit;
    private int idCategorie;

    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public Produit(int idProduit, String nomProduit, String description, Double prix, String photo, int idCategorie) {
        this.idProduit = idProduit;
        this.nomProduit = nomProduit;
        this.description = description;
        this.prix = prix;
        //this.selected = selected;
        this.imageProduit = photo;
        this.idCategorie = idCategorie;
    }

    public Produit() {
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public String getNomProduit() {
        return nomProduit;
    }

    public void setNomProduit(String nomProduit) {
        this.nomProduit = nomProduit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public String getImageProduit() {
        return imageProduit;
    }

    public void setImageProduit(String imageProduit) {
        this.imageProduit = imageProduit;
    }
public boolean verifierArticle(ArrayList<String> cartlist, String id2) {
		for(String id : cartlist) {
			if(id.equals(id2))
				return true;
		}
		return false;
	}

public ArrayList<String> remove(ArrayList<String> panier, String id) {
		for(String cid : panier) {
			if(cid.equals(id)) {
				panier.remove(cid);
				break;
			}
				
		}
		
		return panier;
	}
}
