import 'package:go_router/go_router.dart';
import 'package:translator_app/ui/screens/view.dart';
import 'package:translator_app/ui/widgets/bottom_nav_bar.dart';

GoRouter router =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) =>  const BottomNavBar(), routes: [
    GoRoute(
      path: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: 'favorites',
      builder: (context, state) =>  const FavoritesScreen(),
    ),
    GoRoute(
      path: 'settings',
      builder: (context, state) =>  const SettingsScreen(),
    )
  ])
]);
