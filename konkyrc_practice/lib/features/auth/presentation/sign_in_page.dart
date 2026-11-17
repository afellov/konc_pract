import 'package:flutter/material.dart';
import 'package:konkyrc_practice/core/localization/l10n/app_localizations.dart';
import 'package:ui_kit/ui_kit.dart'; 

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;


    return Scaffold(
      backgroundColor: AppColors.block, // Белый фон
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Растягиваем элементы по ширине
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
                style: AppTextStyles.subtitleMedium16.copyWith(color: AppColors.text),
              ),

              const SizedBox(height: 8),

              AppTextField(
                hintText: l10n.email_hint,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // Поле Пароля
              Text(
                l10n.password, 
                style: AppTextStyles.subtitleMedium16.copyWith(color: AppColors.text),
              ),
              const SizedBox(height: 8),
              
              // ТВОЙ BLOC ЗДЕСЬ: Оберни AppTextField в BlocBuilder, чтобы менять obscureText и иконку
              // Примерно так:
              // BlocBuilder<YourBloc, YourState>(
              //   builder: (context, state) {
              //     return AppTextField(
              //       hintText: '********',
              //       obscureText: !state.isPasswordVisible,
              //       suffixIcon: IconButton(
              //         icon: Icon(state.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              //         onPressed: () => context.read<YourBloc>().add(YourToggleEvent()),
              //       ),
              //     );
              //   }
              // )
              
              // Пока просто заглушка для верстки:
              AppTextField(
                hintText: '********',
                obscureText: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off, color: AppColors.subTextDark),
                  onPressed: () {
                    // Сюда ты добавишь вызов события BLoC
                  },
                ),
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
                    // Логика входа
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
    );
  }
}