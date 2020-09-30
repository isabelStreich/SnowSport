/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.Date;

/**
 *
 * @author istreich
 */
public class CommandeItems {
    private int idCommandeItems;
    private int idItems;
    private Produit idProduit;
   private int quantite;

    public int getIdCommandeItems() {
        return idCommandeItems;
    }

    public void setIdCommandeItems(int idCommandeItems) {
        this.idCommandeItems = idCommandeItems;
    }

    public int getIdItems() {
        return idItems;
    }

    public void setIdItems(int idItems) {
        this.idItems = idItems;
    }

    public Produit getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(Produit idProduit) {
        this.idProduit = idProduit;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    
}