/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Sell {
    private int sellID;
    private String sellName;

    public Sell() {
    }

    public Sell(String sellName) {
        this.sellName = sellName;
    }
    
    

    public Sell(int sellID, String sellName) {
        this.sellID = sellID;
        this.sellName = sellName;
    }

    public int getSellID() {
        return sellID;
    }

    public void setSellID(int sellID) {
        this.sellID = sellID;
    }

    public String getSellName() {
        return sellName;
    }

    public void setSellName(String sellName) {
        this.sellName = sellName;
    }
    
    
}
