import 'package:cineflix/modules/home/screens/home_screen.dart';
import 'package:cineflix/modules/movie_detail/screens/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter goRouter;

  AppRouter() : goRouter = router;

  static final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/movie_detail',
      builder: (context, state) => const MovieDetailScreen(),
    ),
  ]);
}
