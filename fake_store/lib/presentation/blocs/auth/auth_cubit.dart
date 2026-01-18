import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/services/auth_service.dart';
import '../../../core/storage/token_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    try {
      final response = await authService.login(username, password);
      await TokenStorage.saveToken(response.token);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError('Login failed'));
    }
  }
}
