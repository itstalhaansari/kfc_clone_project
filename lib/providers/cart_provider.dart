import 'package:flutter/widgets.dart';

// when we change data anywhere, notify the listener
// if we are reading the data just, no notify
class cartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  void addItem(Map<String, dynamic> item) {
    if (_cartItems.contains(item)) {
      int oldItemIndex = _cartItems.indexOf(item);
      Map<String, dynamic> oldItem = _cartItems[oldItemIndex];
      oldItem["quantity"]++;
      _cartItems[oldItemIndex] = oldItem;
    } else {
      item["quantity"] = 1;
      _cartItems.add(item);
    }
    notifyListeners();
  }

  int getCartCount() {
    int cartCount = 0;
    for (Map<String, dynamic> item in _cartItems) {
      cartCount = cartCount + item["quantity"] as int;
    }
    return cartCount;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getCartItems() {
    return _cartItems; // Return a copy to ensure immutability
  }

  void increment(int index) {
    var item = _cartItems[index];

    if (item["quantity"] < 8) {
      item["quantity"]++;

      _cartItems[index] = item;
      notifyListeners();
    }
  }

  void decrement(int index) {
    var item = _cartItems[index];

    if (item["quantity"] <= 1) {
      _cartItems.removeAt(index);
    } else {
      item["quantity"]--;
    }
    _cartItems[index] = item;
    notifyListeners();
  }

  int getCartTotalAmount() {
    int total = 0;
    for (var item in _cartItems) {
      // Remove non-numeric characters from the price string
      String priceString =
          item["price"].toString().replaceAll(RegExp(r'[^0-9]'), '');
      String quantityString =
          item["quantity"].toString().replaceAll(RegExp(r'[^0-9]'), '');

      // Convert cleaned strings to integers
      int price =
          int.tryParse(priceString) ?? 0; // Default to 0 if parsing fails
      int quantity =
          int.tryParse(quantityString) ?? 0; // Default to 0 if parsing fails

      total += price * quantity;
    }
    return total;
  }
}
