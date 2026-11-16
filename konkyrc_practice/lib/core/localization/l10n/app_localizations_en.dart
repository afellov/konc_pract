// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello!';

  @override
  String get fill_data => 'Fill in your data or continue via Social Media';

  @override
  String get email => 'Email';

  @override
  String get email_hint => 'xyz@gmail.com';

  @override
  String get password => 'Password';

  @override
  String get recover => 'Recover';

  @override
  String get sign_in_btn => 'Sign In';

  @override
  String get first_time => 'Is this your first time?';

  @override
  String get create_user => 'Create user';
}
