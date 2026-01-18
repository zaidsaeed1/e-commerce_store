class CartItem {
  final int productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(productId: json['productId'], quantity: json['quantity']);
  }
}

class CartModel {
  final int id;
  final int userId;
  final List<CartItem> products;

  CartModel({required this.id, required this.userId, required this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      products: (json['products'] as List)
          .map((e) => CartItem.fromJson(e))
          .toList(),
    );
  }
}
