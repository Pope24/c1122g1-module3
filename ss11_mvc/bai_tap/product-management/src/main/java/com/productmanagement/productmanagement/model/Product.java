package com.productmanagement.productmanagement.model;

public class Product {
    private int id;
    private String name;
    private String desc;
    private int amount;

    public Product(int id, String name, String desc, int amount) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", desc='" + desc + '\'' +
                ", amount=" + amount +
                '}';
    }
}
