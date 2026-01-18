import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/user_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserService service;

  ProfileCubit(this.service) : super(ProfileLoading());

  Future<void> loadProfile(int userId) async {
    try {
      final user = await service.fetchUser(userId);
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError('Failed to load profile'));
    }
  }
}
