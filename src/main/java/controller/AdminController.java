/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Produit;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.ConnectionDb;

/**
 *
 * @author ybenhail
 */
@WebServlet(name = "AdminController", urlPatterns = {"/adminController"})
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
		if(page == null) {
			request.getRequestDispatcher("admin/login.jsp").forward(request, response);;
		}else {
			doPost(request, response);
		}
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
		if(page.equals("admin-login-form")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			
			if(username.equals("admin") && password.equals("admin@1234")) {
				request.getRequestDispatcher("admin/index.jsp").forward(request, response);

			}
			else {
				request.setAttribute("msg", "Mot de passe ou  nom d utilisateur  est incorecte");
				request.setAttribute("username", username);
				request.getRequestDispatcher("admin/login.jsp").forward(request, response);

			}
		}
                if(page.equals("addproduct")) {
			request.getRequestDispatcher("admin/ajouterproduit.jsp").forward(request, response);
		}
                if(page.equals("index")) {
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
                
                if(page.equals("add_product")){
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String featured = request.getParameter("featured");
			String image = request.getParameter("image");
			Produit p = new Produit();
			p.setNomProduit(name);
			p.setPrix(Double.parseDouble(price));
                        switch(category){
                        case "Ski":
                        p.setIdCategorie(2);
                        p.setImageProduit("img/ski/"+image);
                        break;
                         case "SnowBoard":
                        p.setIdCategorie(1);
                        p.setImageProduit("img/snowboard/"+image);
                        break;
                        case "SplitBoard":
                        p.setIdCategorie(3);
                        p.setImageProduit("img/splitboard/"+image);
                        break;
                        case "Accessoires":
                        p.setIdCategorie(4);
                        p.setImageProduit("img/accesoires/"+image);
                        break;
                        
                        }
			
			
			
			
			                 ConnectionDb db = new ConnectionDb();
			try {
				db.ajouterProduit(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Product added Successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
                
                if(page.equals("edit")) {
			String id = request.getParameter("id");
			ConnectionDb db = new ConnectionDb();
			Produit p = null;
			try {
				 p = db.chercherProduitParId(Integer.parseInt(id));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("admin/modifierproduit.jsp").forward(request, response);
		}
                
                if(page.equals("edit_product")){
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String photo = request.getParameter("image");
			Produit p = new Produit();
			p.setIdProduit(Integer.parseInt(id));
			p.setNomProduit(name);
			p.setPrix(Double.parseDouble(price));
			
			p.setImageProduit("img/ski/"+photo);
			
			ConnectionDb db = new ConnectionDb();
			try {
				db.modifierproduit(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Produit Bien modifie", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
                if(page.equals("delete")) {
			String id = request.getParameter("id");
			ConnectionDb db = new ConnectionDb();
			try {
				db.supprimerproduit(Integer.parseInt(id));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Produit bien supprime", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);

		}
       
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
