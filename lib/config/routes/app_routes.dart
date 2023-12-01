import 'package:go_router/go_router.dart';

import '../../app/features/home/presentation/screens/screens.dart';
import '../../app/features/profile/presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
 GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
 GoRoute(
    path: '/profile',
    builder: (context, state) => const ProfileScreen(),
  ),
]);
