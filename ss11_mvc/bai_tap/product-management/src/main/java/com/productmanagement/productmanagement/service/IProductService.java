package com.productmanagement.productmanagement.service;

import com.productmanagement.productmanagement.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getProductList();
    void addNewProduct(Product product);
    void updateProduct(int index, Product product);
    void deleteProduct(int id);
    Product findProductByName(String name);
    Product getProductById(int id);
}
