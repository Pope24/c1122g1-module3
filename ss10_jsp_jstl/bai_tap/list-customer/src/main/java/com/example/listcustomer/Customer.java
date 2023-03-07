package com.example.listcustomer;

import java.time.LocalDate;

public class Customer {
    private String name;
    private LocalDate dateOfBirth;
    private String address;
    private String linkImage;

    public Customer(String name, LocalDate dateOfBirth, String address, String linkImage) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.linkImage = linkImage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "name='" + name + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", address='" + address + '\'' +
                ", linkImage='" + linkImage + '\'' +
                '}';
    }
}
