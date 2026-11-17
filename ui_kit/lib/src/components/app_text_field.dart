import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';


/// Универсальное текстовое поле приложения
class AppTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: AppTextStyles.bodyRegular16,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.bodyRegular16.copyWith(
          color: AppColors.subTextLight, // Цвет плейсхолдера
        ),
        filled: true,
        fillColor: AppColors.background, // Светло-серый фон из макета
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        // Убираем стандартные рамки и делаем скругления
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent, width: 1),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}