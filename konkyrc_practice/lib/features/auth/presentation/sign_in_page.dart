import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konkyrc_practice/core/localization/l10n/app_localizations.dart';
import 'package:konkyrc_practice/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:konkyrc_practice/features/auth/presentation/bloc/auth_event.dart';
import 'package:konkyrc_practice/features/auth/presentation/bloc/auth_state.dart';
import 'package:konkyrc_practice/features/home/presentation/home_screen.dart';
import 'package:ui_kit/ui_kit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // создаем контроллеры для полей ввода(чтоб забирать инфу которую пользователь написал туда)
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // добавляем локализацию
    final l10n = AppLocalizations.of(context)!;

    // bloclistener - для действий которые должны произойти один раз, в зависимости от ивента, который придет с bloc
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // если ошибка, то показываем диалоговое окно
        if (state.errorMessage != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(l10n.title_error),
              content: Text(state.errorMessage!),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ok bro'),
                ),
              ],
            ),
          );
        }

        // если все успешно, тогда переходим на страницу "home"(без возможности вернуться обратно!)
        if (state.isSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.block, // Белый фон
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Растягиваем элементы по ширине
              children: [
                const SizedBox(height: 40),

                // Заголовок "Привет!"
                Text(
                  l10n.hello,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headingExtraBold36.copyWith(
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 12),

                // Подзаголовок
                Text(
                  l10n.fill_data,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitleMedium16.copyWith(
                    color: AppColors.subTextDark,
                  ),
                ),
                const SizedBox(height: 40),

                // Поле Email
                Text(
                  l10n.email,
                  style: AppTextStyles.subtitleMedium16.copyWith(
                    color: AppColors.text,
                  ),
                ),

                const SizedBox(height: 8),

                AppTextField(
                  controller: emailController,
                  hintText: l10n.email_hint,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                // Поле Пароля
                Text(
                  l10n.password,
                  style: AppTextStyles.subtitleMedium16.copyWith(
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 8),

                // поле для пароля
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return AppTextField(
                      controller: passwordController,
                      hintText: '********',
                      obscureText: !state.isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: state.isPasswordVisible
                            ? Icon(
                                Icons.visibility_off,
                                color: AppColors.subTextDark,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: AppColors.subTextDark,
                              ),
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            TogglePasswordVisibility(),
                          );
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),

                // Кнопка "Восстановить"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.recover,
                      style: AppTextStyles.bodyMedium14.copyWith(
                        color: AppColors.subTextDark,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Кнопка "Войти" (используем ElevatedButton, если AppButton еще нет)
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginSubmitted(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child: Text(
                      l10n.sign_in_btn,
                      style: AppTextStyles.subtitleBold16.copyWith(
                        color: AppColors.block,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Низ: "Вы впервые? Создать пользователя"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.first_time,
                      style: AppTextStyles.bodyRegular14.copyWith(
                        color: AppColors.subTextDark,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Переход на экран регистрации
                      },
                      child: Text(
                        l10n.create_user,
                        style: AppTextStyles.bodyRegular14.copyWith(
                          color: AppColors.text,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
