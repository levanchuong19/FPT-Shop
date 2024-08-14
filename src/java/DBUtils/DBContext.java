/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBUtils;

import Models.Account;
import Models.Cart;
import Models.CartItem;
import Models.Category;
import Models.Product;
import Models.Role;
import Models.Sell;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DBContext {

    public Connection getConnection() {
        Connection c = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost;encrypt=false;user=sa;password=12345;databaseName=Assignment_PRJ301";
            c = DriverManager.getConnection(url);
        } catch (Exception e) {
        }
        return c;
    }

    public ArrayList<Product> getProduct() {
        ArrayList<Product> products = new ArrayList<>();
        String query = "  select t.id, t.name, t.image, t.price, t.title, t.description, c.cateName, s.sellName\n"
                + "from technology t\n"
                + "left join category c on c.cateID = t.cateID\n"
                + "left join sell s on s.sellID = t.sellID";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String title = rs.getString(5);
                String descrip = rs.getString(6);
                String cateName = rs.getString(7);
                String sellName = rs.getString(8);

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                products.add(product);

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return products;
    }
    
    public Cart getCartByUserId(int userId) {
        Cart cart = new Cart();
        try {
            Connection conn = getConnection();
            String sql = "SELECT p.id,p.image, p.name, p.price FROM Account ci JOIN technology p ON ci.uID = p.id WHERE ci.uID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("id"),rs.getString("image"), rs.getString("name"), rs.getDouble("price"));
                CartItem cartItem = new CartItem(product, rs.getInt("quantity"));
                cart.addItem(cartItem);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> categorys = new ArrayList<>();
        String query = " select * from category";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cID = rs.getInt(1);
                String cName = rs.getString(2);

                Category category = new Category(cID, cName);

                categorys.add(category);

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return categorys;
    }

    public Product getLast() {
        String query = "select top 1 *\n"
                + "from technology t\n"
                + "order by t.id desc";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String title = rs.getString(5);
                String descrip = rs.getString(6);
                String cateName = rs.getString(7);
                String sellName = rs.getString(8);

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                return product;
            }
        } catch (Exception e) {
        }

        return null;
    }

    public ArrayList<Product> getProductByCID(String cid) {
        ArrayList<Product> products = new ArrayList<>();
        String query = " select t.id, t.name, t.image, t.price, t.title, t.description, c.cateName, s.sellName\n"
                + "from technology t\n"
                + "left join category c on c.cateID = t.cateID\n"
                + "left join sell s on s.sellID = t.sellID\n"
                + "where t.cateID = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String title = rs.getString(5);
                String descrip = rs.getString(6);
                String cateName = rs.getString(7);
                String sellName = rs.getString(8);

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                products.add(product);

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return products;
    }

    public Product getProductByID(String pid) {
        String query = "select t.id, t.name, t.image, t.price, t.title, t.description, c.cateName, s.sellName\n"
                + "from technology t\n"
                + "left join category c on c.cateID = t.cateID\n"
                + "left join sell s on s.sellID = t.sellID\n"
                + "where t.id = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String title = rs.getString(5);
                String descrip = rs.getString(6);
                String cateName = rs.getString(7);
                String sellName = rs.getString(8);

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                return product;

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return null;
    }

    public ArrayList<Product> searchByName(String txtSearch) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "  select t.id, t.name, t.image, t.price, t.title, t.description, c.cateName, s.sellName\n"
                + "from technology t\n"
                + "left join category c on c.cateID = t.cateID\n"
                + "left join sell s on s.sellID = t.sellID\n"
                + "where t.name like ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String title = rs.getString(5);
                String descrip = rs.getString(6);
                String cateName = rs.getString(7);
                String sellName = rs.getString(8);

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                products.add(product);

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return products;
    }

    public Account login(String user, String pass) {
        String query = "  select a.uID, a.[user], a.pass, a.roleID from Account a\n"
                + "  left join Role r on a.roleID = r.roleID\n"
                + "  where [user] = ?\n"
                + "  and pass = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);
                int roleName = rs.getInt(4);

                Account account = new Account(id, userName, password, roleName);

                return account;
            }
        } catch (Exception e) {
        }

        return null;
    }

    public Account checkAccountExist(String user) {
        String query = "    select * from Account\n"
                + "  where [user] = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);
                int roleName = rs.getInt(4);

                Account account = new Account(id, userName, password, roleName);

                return account;
            }
        } catch (Exception e) {
        }

        return null;
    }

    public void signUp(String user, String pass) {
        String query = "  insert into Account\n"
                + "  values (?, ?,0)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Product> getProductBySellID(int sid) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT t.id, t.name, t.image, t.price, t.title, t.description, c.cateName, s.sellName \n "
                + "FROM technology t\n "
                + "JOIN connectAcc ca ON t.sellID = ca.sellID\n "
                + "JOIN sell s ON t.sellID = s.sellID\n "
                + "JOIN category c ON t.cateID = c.cateID\n "
                + "WHERE ca.uID = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, sid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String title = rs.getString(5);
                String descrip = rs.getString(6);
                String cateName = rs.getString(7);
                String sellName = rs.getString(8);

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                products.add(product);

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return products;
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM technology";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                String title = rs.getString("title");
                String descrip = rs.getString("description");
                String cateName = rs.getString("cateID");
                String sellName = rs.getString("sellID");

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                products.add(product);

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return products;
    }

    public void deleteProduct(String pid) {
        String query = "   delete\n"
                + "  from technology \n"
                + "  where id = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String image, String price, String title, String des, String categpry, int sid) {
        String query = "insert into technology\n"
                + "values(?,?,?,?,?,?,?)";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, des);
            ps.setString(6, categpry);
            ps.setInt(7, sid);
            ResultSet rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void editProduct(String name, String image, String price, String title, String des, String categpry, String pid) {
        String query = "update technology\n"
                + "set [name] = ?,\n"
                + "[image] = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "[description] = ?,\n"
                + "cateID = ?\n"
                + "where id = ?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, des);
            ps.setString(6, categpry);
            ps.setString(7, pid);
            ResultSet rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void addAccount(Account account) {
        String query = "INSERT INTO Account ([user], [pass], [roleID]) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, account.getUser());
            ps.setString(2, account.getPass());
            ps.setInt(3, account.getRoleID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account getAccountByEmail(String email) {
        String query = "SELECT * FROM Account WHERE [user] = ?";
        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Account(rs.getInt("uID"), rs.getString("user"), rs.getString("pass"), rs.getInt("roleID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
//        DBContext db = new DBContext();
//        Account list = db.login("123", "123");
//        System.out.println(list.toString());
//    }
    public ArrayList<Product> getProductByName() {
        ArrayList<Product> products = new ArrayList<>();
        String query = "  select t.id, t.name, t.image, t.price, t.title, t.description, c.cateName, s.sellName\n"
                + "from technology t\n"
                + "left join category c on c.cateID = t.cateID\n"
                + "left join sell s on s.sellID = t.sellID";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String title = rs.getString(5);
                String descrip = rs.getString(6);
                String cateName = rs.getString(7);
                String sellName = rs.getString(8);

                Category cate = new Category(cateName);

                Sell sell = new Sell(sellName);

                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                products.add(product);

            }
        } catch (Exception e) {
            // Xử lý các exception tại đây
            e.printStackTrace();
            throw new RuntimeException("Error retrieving humans", e);
        }
        return products;
    }

    public int updateAccount(Account acc) {
        String query = "UPDATE Account SET [user] = ?, pass = ?, roleID = ? WHERE uID = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, acc.getUser());
            ps.setString(2, acc.getPass());
            ps.setInt(3, acc.getRoleID());
            ps.setInt(4, acc.getId());
            int check = ps.executeUpdate();
            if (check > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }

    }

    public int deleteAccount(int Aid) {
        String query = "   delete from Account where uID = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, Aid);
            int check = ps.executeUpdate();
            if (check > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
    }

    public ArrayList<Account> getListUserAccount() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select a.uID, a.[user], a.pass, a.roleID from Account a where roleID != 1";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String user = rs.getString(2);
                String pass = rs.getString(3);
                int roleID = rs.getInt(4);
                // Assuming the Account class has a constructor that matches these parameters
                Account account = new Account(id, user, pass, roleID);
                list.add(account);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

      public static void main(String[] args) {
        DBContext dao = new DBContext();
        int count = dao.getTotalProducts();
        System.out.println(count);
    }
    
//    public static void main(String[] args) {
//        DBContext dbContext = new DBContext();
//        int page = 1;
//        int productsPerPage = 9;
//        
//        List<Product> products = dbContext.getProducts(page, productsPerPage);
//        
//        if (products != null) {
//            System.out.println("Products retrieved successfully:");
//            for (Product product : products) {
//                System.out.println("ID: " + product.getId());
//                System.out.println("Name: " + product.getName());
//                System.out.println("Image: " + product.getImage());
//                System.out.println("Price: " + product.getPrice());
//                System.out.println("Title: " + product.getTitle());
//                System.out.println("Description: " + product.getDescription());
//                System.out.println();
//            }
//        } else {
//            System.out.println("Failed to retrieve products.");
//        }
//    }
    
//    public int getTotalProducts() {
//        Connection con = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            String query = "SELECT COUNT(*) FROM technology";
//            con = new DBContext().getConnection();
//            stm = con.prepareStatement(query);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        return 0;
//
//    }
//
//  
//
//    public List<Product> getProducts(int page, int productsPerPage) {
//    int offset = (page - 1) * productsPerPage;
//    List<Product> products = new ArrayList<>();
//
//    try (Connection con = new DBContext().getConnection();
//            PreparedStatement ps = con.prepareStatement("SELECT * FROM technology ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY")) {
//        ps.setInt(1, productsPerPage);
//        ps.setInt(2, offset);
//        ResultSet rs = ps.executeQuery();
//
//        while (rs.next()) {
//            Product product = new Product();
//            product.setId(rs.getInt("id"));
//            product.setName(rs.getString("name"));
//            product.setImage(rs.getString("image"));
//            product.setPrice(rs.getDouble("price"));
//            product.setTitle(rs.getString("title"));
//            product.setDescription(rs.getString("description"));
//            Category category = new Category();
//            category.setCateID(rs.getInt("cateID"));
//            product.setCateID(category);
//            Sell sell = new Sell();
//            sell.setSellID(rs.getInt("sellID"));
//            product.setSellID(sell);
//
//            products.add(product);
//        }
//        return products;
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//    return null;
//}
    
     public List<Product> getProducts(int page, int productsPerPage) {
        List<Product> products = new ArrayList<>();
        int offset = (page - 1) * productsPerPage;
        
        String query = "SELECT t.id, t.name, t.image, t.price, t.title, t.description, c.cateName, s.sellName "
                     + "FROM technology t "
                     + "LEFT JOIN category c ON c.cateID = t.cateID "
                     + "LEFT JOIN sell s ON s.sellID = t.sellID "
                     + "ORDER BY t.id "
                     + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, productsPerPage);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                String title = rs.getString("title");
                String descrip = rs.getString("description");
                String cateName = rs.getString("cateName");
                String sellName = rs.getString("sellName");

                Category cate = new Category(cateName);
                Sell sell = new Sell(sellName);
                Product product = new Product(id, name, image, price, title, descrip, cate, sell);

                products.add(product);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public int getTotalProducts() {
        int totalProducts = 0;
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT COUNT(*) FROM technology")) {
            if (rs.next()) {
                totalProducts = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalProducts;
    }
    
    public static void updateProductQuantity(int productId, int quantity) throws SQLException {
        String sql = "UPDATE technology SET quantity = quantity - ? WHERE id = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, quantity);
            stmt.setInt(2, productId);
            stmt.executeUpdate();
        }catch (Exception e) {
              e.printStackTrace();
        }
    }
}
