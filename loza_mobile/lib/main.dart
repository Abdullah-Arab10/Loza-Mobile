import 'package:flutter/material.dart';
import 'package:loza_mobile/app/app.dart';
import 'package:loza_mobile/app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp( MyApp() );
}
