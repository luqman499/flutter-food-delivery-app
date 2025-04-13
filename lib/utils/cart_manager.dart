class CartManager {
  static List<Map<String, dynamic>> cartItems = [];

  static void addToCart(Map<String, dynamic> item) {
    final existingItemIndex = cartItems.indexWhere(
      (i) => i['title'] == item['title'],
    );
    if (existingItemIndex != -1) {
      cartItems[existingItemIndex]['quantity'] += item['quantity'];
    } else {
      cartItems.add(item);
    }
  }

  static void clearCart() {
    cartItems.clear();
  }
}
