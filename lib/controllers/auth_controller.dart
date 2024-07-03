import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/providers/auth_provider.dart';

class AuthController {
  final Ref _ref;

  AuthController(this._ref);

  Future<void> createAccountWithEmail({
    required email,
    required String password,
    required String username,
  }) async {
    await _ref
        .read(authStateProvider.notifier)
        .registerWithEmailAndPassword(email, password, username);
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await _ref
        .read(authStateProvider.notifier)
        .signInWithEmailAndPassword(email, password);
  }

  Future<void> logout() async {
    await _ref.read(authStateProvider.notifier).signOut();
  }
}

final authControllerProvider = Provider((ref) {
  return AuthController(ref);
});
