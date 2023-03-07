package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/result-operator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Calculator calculator = new Calculator();
        float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
        char operator = request.getParameter("operator").charAt(0);
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        try {
            float result = calculator.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("result", result);
        } catch (RuntimeException e) {
            request.setAttribute("result", e.getMessage());
        } finally {
            dispatcher.forward(request, response);
        }
    }
}
