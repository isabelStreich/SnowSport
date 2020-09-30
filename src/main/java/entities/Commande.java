/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;


/**
 *
 * @author ybenhail
 */
public class Commande {
    private int idCommande;
    private int idUtilisateur;
    private int idProduit;
    private double prix;
    private int qte;

    public Commande(int idCommande, int idUtilisateur, int idProduit, double prix, int qte) {
        this.idCommande = idCommande;
        this.idUtilisateur = idUtilisateur;
        this.idProduit = idProduit;
        this.prix = prix;
        this.qte = qte;
    }

    public int getIdCommande() {
        return idCommande;
    }

    public Commande() {
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }

    public int getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(int idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

  
}
