
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konkyrc_practice/features/auth/presentation/bloc/auth_event.dart';
import 'package:konkyrc_practice/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    // обработка нажатия "глаз"
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    // обработка нажатия "войти"
    on<LoginSubmitted>((event, emit) {
      emit(state.copyWith(errorMessage: null, isSuccess: false));
      
      // проверяем на пустоту полей
      if (event.email.trim().isEmpty || event.password.trim().isEmpty) {
        emit(state.copyWith(errorMessage: 'заполните все поля'));
        return;
      }
      
      // проверка по паттерну
      final emailRegex = RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,}$');
      if (!emailRegex.hasMatch(event.email)) {
        emit(state.copyWith(errorMessage: 'Некорректный формат email'));
        return;
      }
      
      // если нормально обработалось
      emit(state.copyWith(isSuccess: true));
    });
  }
}