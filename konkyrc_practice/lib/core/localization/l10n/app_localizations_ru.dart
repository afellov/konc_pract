// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get hello => 'Привет!';

  @override
  String get fill_data =>
      'Заполните Свои Данные Или Продолжите Через Социальные Медиа';

  @override
  String get email => 'Email';

  @override
  String get email_hint => 'xyz@gmail.com';

  @override
  String get password => 'Пароль';

  @override
  String get recover => 'Восстановить';

  @override
  String get sign_in_btn => 'Войти';

  @override
  String get first_time => 'Вы впервые?';

  @override
  String get create_user => 'Создать пользователя';

  @override
  String get title_error => 'что то пошло не так';
}
