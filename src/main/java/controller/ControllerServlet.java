/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Commande;
import model.ConnectionDb;
import entities.Produit;
import entities.Utilisateur;
import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


/**
 *
 * @author ybenhail
 */
@WebServlet(name = "ControllerServlet", urlPatterns = {"/controllerServlet"})
public class ControllerServlet extends HttpServlet {

 HashMap<Integer,Produit> listProduit = new HashMap<>();
    static ArrayList<String> panierList = new ArrayList<>();
	ArrayList<Utilisateur> userList = new ArrayList<>();
	HttpSession session;






    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
        if (page == null || page.equals("index")) {

            ConnectionDb db = new ConnectionDb();
            try {
                listProduit = db.chercherProduits();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            session = request.getSession();
            session.setAttribute("panierList", panierList);
            session.setAttribute("listProduit", listProduit);

            request.getRequestDispatcher("produits.jsp").forward(request, response);
            
        } 
        else if (page.equals("finalisercmd")) {
           String idPr = request.getParameter("idProduit");
          int qte = Integer.parseInt(request.getParameter("quantite"));
            double prix = Double.parseDouble(request.getParameter("prix"));
           Commande cmd= new Commande();
            cmd.setIdProduit(Integer.parseInt(idPr));
            cmd.setIdUtilisateur(1);
           cmd.setQte(qte);
            cmd.setPrix(prix*qte);
            ConnectionDb db= new ConnectionDb();
           try {
             db.ajouterCommande(cmd);
         } catch (SQLException ex) {
               Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
           }
           // String id = request.getParameter("id");
			Produit p = new Produit();
			panierList = p.remove(panierList,idPr);
			
			session = request.getSession();
			session.setAttribute("panierList", panierList);
			//request.getRequestDispatcher("panier.jsp").forward(request, response);
          
           request.getRequestDispatcher("passercmd.jsp").forward(request, response);
        }        
        
        else {
            doPost(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         String page = request.getParameter("page");
         if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
         if(page.equals("sign-up")) {
			request.getRequestDispatcher("sinscrire.jsp").forward(request, response);
		}
         
         if(page.equals("remove")) {
			String id = request.getParameter("id");
			Produit p = new Produit();
			panierList = p.remove(panierList,id);
			
			session = request.getSession();
			session.setAttribute("panierList", panierList);
			request.getRequestDispatcher("panier.jsp").forward(request, response);
		}
        if(page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");
			
			if(password_1.equals(password_2)) {
				
                                Utilisateur user = new Utilisateur();

				user.setEmail(email);
				user.setNomComplet(name);
				user.setNomUtilisateur(username);
				user.setPassword(password_1);
				ConnectionDb db = new ConnectionDb();
				try {
					db.ajouterUtilisateur(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.setAttribute("username", username);
				request.setAttribute("msg", "Le compte a ete bien cree!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "Les deux mots de passes sont pas identiques");
				request.setAttribute("name", name);
				
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.getRequestDispatcher("sinscrire.jsp").forward(request, response);
			}
			
		}
        if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 panierList.clear();
			 session.setAttribute("panierList", panierList);
			 session.setAttribute("listProduit", listProduit);
			
			request.getRequestDispatcher("produits.jsp").forward(request, response);
		}
        if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			ConnectionDb db = new ConnectionDb();
			Utilisateur user = new Utilisateur();
			boolean status = false;
			try {
				status = db.verifierUtilisateur(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.chercherUtilisateur();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				session.setAttribute("email", user.chercherEmail(userList,username));
				session.setAttribute("name", user.chercherNom(userList,username));
				session.setAttribute("username", username);
				request.getRequestDispatcher("produits.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Information incorrecte");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
        
        
        
       
		if(page.equals("ski")) {
			request.getRequestDispatcher("skies.jsp").forward(request, response);
		}
                else if(page.equals("snowBoards")) {
			request.getRequestDispatcher("snowboard.jsp").forward(request, response);
		}
                else if(page.equals("splitBoards")) {
			request.getRequestDispatcher("splitboard.jsp").forward(request, response);
		}
                else if(page.equals("accessoires")) {

			request.getRequestDispatcher("accesories.jsp").forward(request, response);

			

		}
                if(page.equals("showcart")) {
			request.getRequestDispatcher("panier.jsp").forward(request, response);
		}
                if(page.equals("addtocart")) {
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			Produit p = new Produit();
			boolean check = p.verifierArticle(panierList,id);
			
			if(check)
				JOptionPane.showMessageDialog(null, "Le produit est deja dans votre panier", "Info", JOptionPane.INFORMATION_MESSAGE);
			else {
			panierList.add(id);
			JOptionPane.showMessageDialog(null, "Produit est bien ajouter dans votre panier", "Info", JOptionPane.INFORMATION_MESSAGE);
			}
                        
                       if(action.equals("allproducts"))
				request.getRequestDispatcher("produits.jsp").forward(request, response); 

        if (page.equals("sign-up-form")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");

            String password_1 = request.getParameter("password_1");
            String password_2 = request.getParameter("password_2");

            if (password_1.equals(password_2)) {

                Utilisateur user = new Utilisateur();

                user.setEmail(email);
                user.setNomComplet(name);
                user.setNomUtilisateur(username);
                user.setPassword(password_1);
                ConnectionDb db = new ConnectionDb();
                try {
                    db.ajouterUtilisateur(user);
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

                request.setAttribute("username", username);
                request.setAttribute("msg", "Le compte a ete bien cree!");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {
                request.setAttribute("msg", "Les deux mots de passes sont pas identiques");
                request.setAttribute("name", name);

                request.setAttribute("email", email);
                request.setAttribute("username", username);
                request.getRequestDispatcher("sinscrire.jsp").forward(request, response);
            }

        }
        
        if (page.equals("login-form")) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            ConnectionDb db = new ConnectionDb();
            Utilisateur user = new Utilisateur();
            boolean status = false;
            try {
                status = db.verifierUtilisateur(username, password);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if (status) {
                session = request.getSession();
                session.setAttribute("session", session);

                try {
                    userList = db.chercherUtilisateur();
                } catch (SQLException e) {
                    e.printStackTrace();

                }
                //session.setAttribute("address", user.fetchadd(userList,username));
                session.setAttribute("email", user.chercherEmail(userList, username));
                session.setAttribute("name", user.chercherNom(userList, username));
                session.setAttribute("username", username);
                request.getRequestDispatcher("produits.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Information incorrecte");
                request.setAttribute("username", username);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        }

        if (page.equals("ski")) {
            request.getRequestDispatcher("skies.jsp").forward(request, response);
        } else if (page.equals("snowBoards")) {
            request.getRequestDispatcher("snowboard.jsp").forward(request, response);
        } else if (page.equals("splitBoards")) {
            request.getRequestDispatcher("splitboard.jsp").forward(request, response);
        } else if (page.equals("accessoires")) {

            request.getRequestDispatcher("accesories.jsp").forward(request, response);

        }
        if (page.equals("showcart")) {
            request.getRequestDispatcher("panier.jsp").forward(request, response);
        }
        

    
        if (page.equals("sign-up-form")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");

            String password_1 = request.getParameter("password_1");
            String password_2 = request.getParameter("password_2");

            if (password_1.equals(password_2)) {

                Utilisateur user = new Utilisateur();

                user.setEmail(email);
                user.setNomComplet(name);
                user.setNomUtilisateur(username);
                user.setPassword(password_1);
                ConnectionDb db = new ConnectionDb();
                try {
                    db.ajouterUtilisateur(user);
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

                request.setAttribute("username", username);
                request.setAttribute("msg", "Account created successfully, Please Login!");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {
                request.setAttribute("msg", "The two passwords do not match");
                request.setAttribute("name", name);

                request.setAttribute("email", email);
                request.setAttribute("username", username);
                request.getRequestDispatcher("sinscrire.jsp").forward(request, response);
            }

        }
      
        if (page.equals("login-form")) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            ConnectionDb db = new ConnectionDb();
            Utilisateur user = new Utilisateur();
            boolean status = false;
            try {
                status = db.verifierUtilisateur(username, password);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if (status) {
                session = request.getSession();
                session.setAttribute("session", session);

                try {
                    userList = db.chercherUtilisateur();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                //session.setAttribute("address", user.fetchadd(userList,username));
                session.setAttribute("email", user.chercherEmail(userList, username));
                session.setAttribute("name", user.chercherNom(userList, username));
                session.setAttribute("username", username);
                request.getRequestDispatcher("produits.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Invalid Crediantials");
                request.setAttribute("username", username);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        }

        if (page.equals("ski")) {
            request.getRequestDispatcher("skies.jsp").forward(request, response);
        } else if (page.equals("snowBoards")) {
            request.getRequestDispatcher("snowboard.jsp").forward(request, response);
        } else if (page.equals("splitBoards")) {
            request.getRequestDispatcher("splitboard.jsp").forward(request, response);
        } else if (page.equals("accessoires")) {

            request.getRequestDispatcher("accesories.jsp").forward(request, response);

            request.getRequestDispatcher("accesories.jsp").forward(request, response);

        }
        if (page.equals("showcart")) {
            request.getRequestDispatcher("panier.jsp").forward(request, response);
        }
       

        if (page.equals("ski")) {
            request.getRequestDispatcher("skies.jsp").forward(request, response);
        } else if (page.equals("snowBoards")) {
            request.getRequestDispatcher("snowboard.jsp").forward(request, response);
        } else if (page.equals("splitBoards")) {
            request.getRequestDispatcher("splitboard.jsp").forward(request, response);
        } else if (page.equals("accessoires")) {

            request.getRequestDispatcher("accesories.jsp").forward(request, response);

            request.getRequestDispatcher("accesories.jsp").forward(request, response);

        }
        if (page.equals("showcart")) {
            request.getRequestDispatcher("panier.jsp").forward(request, response);
        }

       
       

    }

             
        }
        }


