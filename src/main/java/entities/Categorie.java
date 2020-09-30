/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

public class Categorie {
    private int idCategorie;
    private String nomCategorie;
    private String photoCategorie;

    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public String getNomCategorie() {
        return nomCategorie;
    }

    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }

    public String getPhotoCategorie() {
        return photoCategorie;
    }

    public void setPhotoCategorie(String photoCategorie) {
        this.photoCategorie = photoCategorie;
    }

}
