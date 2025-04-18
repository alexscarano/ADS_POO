/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.json.JSONArray;
import java.util.ArrayList;

@WebServlet(name = "ApiAlexandreScaranoServlet", urlPatterns = {"/alexandrescarano.json"})
public class ApiAlexandreScaranoServlet extends HttpServlet {
    
    private ArrayList<String> list = new ArrayList<>(); // Lista para adicionar elementos da array do JSON

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            JSONObject json = new JSONObject();
            JSONArray arr = new JSONArray();
            
            list.add("Sistemas Operacionais II");
            list.add("Programação Orientada a Objetos");
            list.add("Banco de Dados");
            list.add("Engenharia de software III");
            list.add("Metodologia da Pesquisa Científico-Tecnológica");
            list.add("Linguagem de programação IV - INTERNET");
            
            for(String e: list){
                arr.put(e);
            }
           
            json.append("RA", "1290482322031");
            json.append("nome", "Alexandre Gael Bitencourt Scarano");
            json.put("disciplinas", list);
         
            out.print(json.toString());

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
