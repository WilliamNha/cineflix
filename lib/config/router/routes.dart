import 'package:cineflix/modules/home/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
]);
