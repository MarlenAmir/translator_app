import 'package:go_router/go_router.dart';
import 'package:translator_app/ui/screens/view.dart';
import 'package:translator_app/ui/widgets/bottom_nav_bar.dart';

GoRouter router =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) =>  BottomNavBar(), routes: [
    GoRoute(
      path: 'home',
      builder: (context, state) =>  HomeScreen(),
    ),
    GoRoute(
      path: 'favorites',
      builder: (context, state) =>  FavoritesScreen(),
    ),
    GoRoute(
      path: 'settings',
      builder: (context, state) =>  SettingsScreen(),
    )
  ])
]);
