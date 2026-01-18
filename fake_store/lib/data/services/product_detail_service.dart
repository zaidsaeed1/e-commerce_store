import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../models/product_model.dart';

class ProductDetailService {
  final Dio _dio = DioClient.getDio();

  Future<ProductModel> fetchProduct(int id) async {
    final response = await _dio.get('/products/$id');
    return ProductModel.fromJson(response.data);
  }
}
