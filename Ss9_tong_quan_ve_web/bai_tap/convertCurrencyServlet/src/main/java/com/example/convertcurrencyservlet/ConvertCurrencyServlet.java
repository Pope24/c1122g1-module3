package com.example.convertcurrencyservlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ConvertCurrencyServlet", value = "/display-discount")
public class ConvertCurrencyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        int listPrice = Integer.parseInt(request.getParameter("ListPrice"));
        int discountPercent = Integer.parseInt(request.getParameter("DiscountPercent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        int discountPrice = (int) (listPrice - discountAmount);
        writer.println("<html><body>");
        writer.println("<h1>Discount Amount: " + discountAmount + "</h1>");
        writer.println("<h1>Discount Price: " + discountPrice + "</h1>");
        writer.println("</body></html>");
    }
}
