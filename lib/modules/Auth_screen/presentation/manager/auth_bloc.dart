import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/Auth_screen/presentation/manager/auth_event.dart';
import 'package:movie_app/modules/Auth_screen/presentation/manager/auth_state.dart';

import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState> {

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
      : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(
          email: event.email, password: event.password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async
  {
    emit(AuthLoading());
    try {
      final user = await registerUseCase(
        name: event.name,
        email: event.email,
        password: event.password,
        phone: event.phone,
        avatarIndex: event.avatarIndex,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}