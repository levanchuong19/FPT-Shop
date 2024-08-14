/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBUtils;

import Models.Product;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class test {
    public static void main(String[] args) {
        DBContext db = new DBContext();
        ArrayList<Product> list = db.getProduct();
        for(Product o : list){
            System.out.println(o.toString());
        }
    }
}
