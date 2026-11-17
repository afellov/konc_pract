/// общий класс событий для блока auth
abstract class AuthEvent {}

/// пользователь нажал на кнопку "войти"
class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  new({required this.email, required this.password});

}

/// пользователь нажал на иконку "глаз"
class TogglePasswordVisibility extends AuthEvent {}
