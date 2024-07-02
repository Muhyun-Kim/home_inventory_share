import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/models/auth_state.dart';
import 'package:home_inventory_share/models/user_model.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(ref);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final Ref _ref;

  AuthStateNotifier(this._ref) : super(AuthState(isAuthenticated: false)) {
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    final user = _ref.read(firebaseAuthProvider).currentUser;
    if (user != null) {
      DocumentSnapshot doc = await _ref
          .read(firestoreProvider)
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        state = AuthState(
          isAuthenticated: true,
          user: UserModel.fromJson(doc.data() as Map<String, dynamic>),
        );
      }
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _ref
          .read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      final uid = result.user!.uid;
      DocumentSnapshot doc =
          await _ref.read(firestoreProvider).collection('users').doc(uid).get();
      if (doc.exists) {
        state = AuthState(
          isAuthenticated: true,
          user: UserModel.fromJson(doc.data() as Map<String, dynamic>),
        );
      }
    } catch (e) {
      state = AuthState(isAuthenticated: false, errorMessage: e.toString());
    }
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential result = await _ref
          .read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        UserModel newUser =
            UserModel(username: username, userId: result.user!.uid);

        await _ref
            .read(firestoreProvider)
            .collection('users')
            .doc(newUser.userId)
            .set(newUser.toJson());
      }
    } catch (e) {
      state = AuthState(isAuthenticated: false, errorMessage: e.toString());
    }
  }

  Future<void> signOut() async {
    await _ref.read(firebaseAuthProvider).signOut();
    state = AuthState(isAuthenticated: false);
  }
}
