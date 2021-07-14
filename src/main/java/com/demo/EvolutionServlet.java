package com.demo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/EvolutionServlet")
public class EvolutionServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num = 0;
        // Check if username parameter exists
        if (request.getParameterMap().containsKey("num")) {
            num = Integer.parseInt(request.getParameter("num"));
        }
        ClienteRest rest = new ClienteRest(num,true);
        String evo = rest.findEvolution();
        request.setAttribute("evolution", evo);
        request.getRequestDispatcher("evolution.jsp").forward(request, response);
    }
}
