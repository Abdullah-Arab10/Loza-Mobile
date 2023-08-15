import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:loza_mobile/app/app.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/resources/language_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
      supportedLocales: const [arabicLocale, englishLocale],
      path: assetPathLocalisations,
      child: Phoenix(child: MyApp())));
}
