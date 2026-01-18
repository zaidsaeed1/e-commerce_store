import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../models/product_model.dart';

class ProductService {
  final Dio _dio = DioClient.getDio();

  Future<List<ProductModel>> fetchProducts() async {
    final response = await _dio.get('/products');

    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
