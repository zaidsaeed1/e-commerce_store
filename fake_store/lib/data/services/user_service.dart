import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../models/user_model.dart';

class UserService {
  final Dio _dio = DioClient.getDio();

  Future<UserModel> fetchUser(int id) async {
    final response = await _dio.get('/users/$id');
    return UserModel.fromJson(response.data);
  }
}
