
import static DBUtils.DBContext.updateProductQuantity;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Models.Cart;
import Models.CartItem;

@WebServlet("/finalizePayment")
public class FinalizePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            List<CartItem> items = cart.getItems();

            for (CartItem item : items) {
                int productId = item.getProduct().getId();
                int quantity = item.getQuantity();

                try {
                    updateProductQuantity(productId, quantity);
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
                    return;
                }
            }

            // Clear the cart after updating the quantities
            session.removeAttribute("cart");

            // Redirect to a confirmation page or show a success message
            response.sendRedirect("finalizePayment.jsp");
        } else {
            response.sendRedirect("cart.jsp");
        }
    }
}