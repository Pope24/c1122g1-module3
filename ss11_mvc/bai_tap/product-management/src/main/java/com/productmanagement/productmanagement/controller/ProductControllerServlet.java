package com.productmanagement.productmanagement.controller;

import com.productmanagement.productmanagement.model.Product;
import com.productmanagement.productmanagement.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductControllerServlet", value = "/products")
public class ProductControllerServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override

//    ------------------------------------RENDER--------------------------------------------
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormAdd(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            case "delete":
                showDeleteProduct(request, response);
                break;
            default:
                showProductList(request, response);
                break;
        }
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/form-add.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProductById(id);
        System.out.println(product.toString());
            request.setAttribute("product", product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/form-edit.jsp");
            dispatcher.forward(request, response);
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProductById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/detail.jsp");
        dispatcher.forward(request, response);
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getProductList();
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/view.jsp");
        request.setAttribute("productList", productList);
        dispatcher.forward(request, response);
    }
    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProductById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/delete.jsp");
        request.setAttribute("product", product);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                renderSearchList(request, response);
                break;
            default:
                showProductList(request, response);
                break;
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        int amount = Integer.parseInt(request.getParameter("amount"));
        Product newProduct = new Product(id, name, desc, amount);
        productService.addNewProduct(newProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/form-add.jsp");
        dispatcher.forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        int amount = Integer.parseInt(request.getParameter("amount"));
        Product newProduct = new Product(id, name, desc, amount);
        productService.updateProduct(id, newProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/form-edit.jsp");
        dispatcher.forward(request, response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.productService.deleteProduct(id);
//        List<Product> productList = productService.getProductList();
//        RequestDispatcher dispatcher = request.getRequestDispatcher("product/view.jsp");
//        request.setAttribute("productList", productList);
//        dispatcher.forward(request, response);
        response.sendRedirect("/products");
    }
    private void renderSearchList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = new ArrayList<>();
        String name = request.getParameter("nameSearch");
        for (Product product: productService.findProductByName(name)) {
            productList.add(product);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/view.jsp");
        request.setAttribute("productList", productList);
        dispatcher.forward(request, response);
    }
}
