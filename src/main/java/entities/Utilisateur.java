/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.ArrayList;

/**
 *
 * @author ybenhail
 */
public class Utilisateur {
    private int idUtilisateur;
    private String nomUtilisateur;
    private String email;
    private String password;

    private String nomComplet;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    private int idRole;


    public Utilisateur() {
    }


    public Utilisateur(int idUser, String nomUser, String password, int role) {
        this.idUtilisateur = idUser;
        this.nomUtilisateur = nomUser;
        this.password = password;
        this.nomComplet=nomComplet;
    }

    public String getNomComplet() {
        return nomComplet;
    }

    public void setNomComplet(String nomComplet) {
        this.nomComplet = nomComplet;
    }

    public int getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(int idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public String getNomUtilisateur() {
        return nomUtilisateur;
    }

    public void setNomUtilisateur(String nomUtilisateur) {
        this.nomUtilisateur = nomUtilisateur;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

public Object chercherEmail(ArrayList<Utilisateur> userList, String username) {
		for(Utilisateur u : userList) {
			if(u.getNomUtilisateur().equals(username))
				return u.getEmail();
		}
		return "";
	}
	
	public Object chercherNom(ArrayList<Utilisateur> userList, String username) {
		for(Utilisateur u : userList) {
			if(u.getNomUtilisateur().equals(username))
				return u.getNomComplet();
		}
		return "";
	}

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

}
