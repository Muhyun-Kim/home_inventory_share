import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_inventory_share/providers/auth_provider.dart';
import 'package:home_inventory_share/views/create_account/create_account_page.dart';
import 'package:home_inventory_share/views/home/home_page.dart';
import 'package:home_inventory_share/views/login/login_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authStateProvider);

    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return authState.isAuthenticated
                ? const HomePage()
                : const LoginPage();
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/create-account',
          builder: (context, state) => const CreateAccountPage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  },
);