/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Product {

    private int id;
    private String name;
    private String image;
    private double price;
    private String title;
    private String description;
    private Category cateID;
    private Sell sellID;

    public Product() {
    }
    public Product(int id,String image, String name, double price) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.price = price;
        
    }

    public Product(int id, String name, String image, double price, String title, String description, Category cateID, Sell sellID) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.sellID = sellID;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCateID() {
        return cateID;
    }

    public void setCateID(Category cateID) {
        this.cateID = cateID;
    }

    public Sell getSellID() {
        return sellID;
    }

    public void setSellID(Sell sellID) {
        this.sellID = sellID;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", title=" + title + ", description=" + description + ", cateID=" + cateID + ", sellID=" + sellID + '}';
    }

    public void setCateID(int cateName) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
