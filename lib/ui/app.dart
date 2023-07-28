import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:translator_app/generated/l10n.dart';
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
      // локаль для приложения (русский язык)
      locale: const Locale("ru"),
      // локализация для поддержки многоязычности
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Translator App',
      theme: appTheme,
    );
  }
}
