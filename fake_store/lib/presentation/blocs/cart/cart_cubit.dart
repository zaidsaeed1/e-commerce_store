import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/cart_model.dart';
import '../../../data/services/cart_service.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartService service;

  CartCubit(this.service) : super(CartLoading());

  Future<void> loadCart(int userId) async {
    try {
      final cart = await service.fetchCart(userId);
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError('Failed to load cart'));
    }
  }

  void removeItem(int productId) {
    if (state is CartLoaded) {
      final current = (state as CartLoaded).cart;
      final updatedProducts = current.products
          .where((p) => p.productId != productId)
          .toList();

      emit(
        CartLoaded(
          CartModel(
            id: current.id,
            userId: current.userId,
            products: updatedProducts,
          ),
        ),
      );
    }
  }

  double calculateTotal(Map<int, double> prices) {
    if (state is CartLoaded) {
      final cart = (state as CartLoaded).cart;
      double total = 0;

      for (var item in cart.products) {
        final price = prices[item.productId] ?? 0;
        total += price * item.quantity;
      }
      return total;
    }
    return 0;
  }
}
