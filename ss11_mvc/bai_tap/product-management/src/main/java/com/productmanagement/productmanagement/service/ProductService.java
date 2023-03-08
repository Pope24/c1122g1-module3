package com.productmanagement.productmanagement.service;

import com.productmanagement.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Iphone", "public in 2014", 1000));
        productList.add(new Product(2, "Samsung", "public in 2009", 850));
        productList.add(new Product(3, "Xiaomi", "public in 2013", 450));
        productList.add(new Product(4, "Redmi", "public in 2018", 900));
        productList.add(new Product(5, "Nokia", "public in 1998", 150));
    }

    @Override
    public List<Product> getProductList() {
        return productList;
    }

    @Override
    public void addNewProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.set(i, product);
            }
        }
    }

    @Override
    public void deleteProduct(int id) {
        for (Product product: productList) {
            if (product.getId() == id) {
                productList.remove(product);
            }
        }
    }

    @Override
    public Product findProductByName(String name) {
        for (Product product : productList) {
            if (product.getName().equals(name)) return product;
        }
        return null;
    }

    @Override
    public Product getProductById(int id) {
        for (Product product : productList) {
            if (product.getId() == id) return product;
        }
        return null;
    }
}
