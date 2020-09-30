/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.MailManager;

/**
 *
 * @author jlidou
 */
@WebServlet(name = "EnvoieUnMail", urlPatterns = {"/envoieUnMail"})
public class EnvoieUnMail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String msg = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "    <head>\n"
                + "        <title>Start Page</title>\n"
                + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <h1 style=\"color: blue;\">Bienvenue chez SnowSport! L'inscription à notre site est terminée avec succès!</h1>\n"
                + "    </body>\n"
                + "</html>";
        MailManager.sendEmail(msg, "jlidou@isi-mtl.com", "Confirmation de Suscription SnowSport");

    }

}
