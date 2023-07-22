import 'package:go_router/go_router.dart';
import 'package:translator_app/ui/screens/history_screen.dart';
import 'package:translator_app/ui/screens/homescreen.dart';
import 'package:translator_app/ui/screens/settings_screen.dart';
import 'package:translator_app/ui/widgets/bottom_nav_bar.dart';

GoRouter router =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) =>  BottomNavBar(), routes: [
    GoRoute(
      path: 'home',
      builder: (context, state) =>  HomeScreen(),
    ),
    GoRoute(
      path: 'history',
      builder: (context, state) =>  HistoryScreen(),
    ),
    GoRoute(
      path: 'settings',
      builder: (context, state) =>  SettingsScreen(),
    )
  ])
]);
