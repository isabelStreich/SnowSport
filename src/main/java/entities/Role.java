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
public class Role {
    private int idRole;
    private String typeRole;

    public Role() {
    }

    public Role(int idRole, String nomRole) {
        this.idRole = idRole;
        this.typeRole = nomRole;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public String getTypeRole() {
        return typeRole;
    }

    public void setTypeRole(String typeRole) {
        this.typeRole = typeRole;
    }
    
}
