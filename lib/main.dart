import 'package:flutter/material.dart';
import 'package:translator_app/provider/theme_provider.dart';
import 'ui/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favorite_translations');
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}
