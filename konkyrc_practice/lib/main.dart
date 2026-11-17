import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konkyrc_practice/core/localization/l10n/app_localizations.dart';
import 'package:konkyrc_practice/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:konkyrc_practice/features/auth/presentation/sign_in_page.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => AuthBloc(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // будет работать со своими переводами (localDelegates)
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // список возможных перерводов
      supportedLocales: AppLocalizations.supportedLocales,

      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const SignInPage(),
    );
  }
}
