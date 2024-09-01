// // import 'package:api_demo/model/product.dart';

// // class CartItemModel {
// //   int quantity;
// //   ProductModel product;
// //   CartItemModel({
// //     this.quantity = 1,
// //     required this.product,
// //   });
// // }
// import 'package:flutter/foundation.dart';

// class CartModel extends ChangeNotifier {
//   final List<CartItem> _items = [];

//   List<CartItem> get items => _items;

//   void addItem(CartItem item) {
//     _items.add(item);
//     notifyListeners();
//   }

//   void removeItem(int index) {
//     _items.removeAt(index);
//     notifyListeners();
//   }

//   void clearCart() {
//     _items.clear();
//     notifyListeners();
//   }

//   double get total {
//     return _items.fold(0, (sum, item) => sum + item.price);
//   }
// }

// class CartItem {
//   final String name;
//   final double price;
//   final String imageUrl;

//   CartItem({required this.name, required this.price, required this.imageUrl});
// }
