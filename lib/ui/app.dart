import 'package:flutter/material.dart';
import 'package:translator_app/routes/router.dart';
import 'package:translator_app/theme/view.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = themeProvider.isLightTheme ? lightTheme : darkTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Translator App',
      theme: appTheme,
    );
  }
}
