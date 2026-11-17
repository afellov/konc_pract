/// в зависимости от переменных меняется экран
class AuthState {
  /// меняем видимость пароля
  final bool isPasswordVisible;
  /// показываем будем ошибку если она будет
  final String? errorMessage;
  /// успешно ли прошла проверка в "войти"
  final bool isSuccess;

  AuthState({
    this.isPasswordVisible = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  //! метод для удобного обновления состояния
  AuthState copyWith({
    bool? isPasswordVisible,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AuthState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}