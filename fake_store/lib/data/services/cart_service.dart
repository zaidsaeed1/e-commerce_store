import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../models/cart_model.dart';

class CartService {
  final Dio _dio = DioClient.getDio();

  Future<CartModel> fetchCart(int userId) async {
    final response = await _dio.get('/carts/user/$userId');
    return CartModel.fromJson(response.data[0]);
  }
}
