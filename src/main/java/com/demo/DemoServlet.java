package com.demo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DemoServlet")
public class DemoServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int offset = 0;
        // Check if username parameter exists
        if (request.getParameterMap().containsKey("offset")) {
            offset = Integer.parseInt(request.getParameter("offset")) * 10;
        }
        ClienteRest rest = new ClienteRest(offset,false);
        Pokemones pokemones = rest.findAll_JSON();
        request.setAttribute("pokemones", pokemones.getResults());
        request.setAttribute("offset", offset/10);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
