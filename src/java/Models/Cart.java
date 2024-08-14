/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Models;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author sangv
 */
import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {
        for (CartItem cartItem : items) {
            if (cartItem.getProduct().getId() == item.getProduct().getId()) {
                cartItem.setQuantity(cartItem.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(int productId) {
        items.removeIf(item -> item.getProduct().getId() == productId);
    }

    public double getTotalPrice() {
        return items.stream().mapToDouble(CartItem::getTotalPrice).sum();
    }
    
      public int getTotalQuantity() {
        int totalQuantity = 0;
        for (CartItem item : items) {
            totalQuantity += item.getQuantity();
        }
        return totalQuantity;
    }
      
     public void removeItem(int productId, int quantityToRemove) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == productId) {
                if (item.getQuantity() <= quantityToRemove) {
                    items.remove(item);
                } else {
                    item.setQuantity(item.getQuantity() - quantityToRemove);
                }
                break;
            }
        }
    }
     
     
     public void updateItemQuantity(int productId, int newQuantity) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(newQuantity);
                break;
            }
        }
    }
}
