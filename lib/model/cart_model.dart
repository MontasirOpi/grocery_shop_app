import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sell
  final List _shopItems = [
    //[itemName,itemPrice,imagePath,color]
    ['Avocado', '4.00', 'assets/images/chicken.png', Colors.green],
    ['Orange', '2.00', 'assets/images/orange.png', Colors.yellow],
    ['Mango', '3.00', 'assets/images/mango.png', Colors.red],
    ['Beef', '4.00', 'assets/images/beef.png', Colors.brown],
  ];
  //list of cart items
  List _cartItems = [];
  get shopItem => _shopItems;
  get cartItems => _cartItems;
  //add items to the cart
  void addItemsToTheCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //removing items from cart
  void removeItemsFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index); // Use removeAt to remove by index
      notifyListeners(); // Notify listeners about the change
    }
  }

  //calcluted total price
  String calclutedTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
