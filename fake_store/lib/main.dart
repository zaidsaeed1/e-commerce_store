import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/auth_service.dart';
import 'presentation/blocs/auth/auth_cubit.dart';
import 'presentation/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthService()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginView()),
    );
  }
}
