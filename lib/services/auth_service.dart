import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// AuthService backed by FirebaseAuth.
/// Notifies listeners on auth state changes.
class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthService() {
    // Forward Firebase auth changes to listeners
    var first = true;
    _auth.authStateChanges().listen((user) {
      // Complete the ready future on first emission so callers know initial state is loaded
      if (first) {
        first = false;
        _readyCompleter.complete();
      }
      notifyListeners();
    });
  }

  final _readyCompleter = Completer<void>();

  /// Completes when the first auth state has been received from Firebase.
  /// Use this to await initial auth resolution on app startup.
  Future<void> get ready => _readyCompleter.future;

  // User? get currentUser => _auth.currentUser;

  // bool get isAuthenticated => currentUser != null;

  bool get isAuthenticated => FirebaseAuth.instance.currentUser != null;
  User? get currentUser => FirebaseAuth.instance.currentUser;

  /// Sign in with email and password. Returns true on success.
  Future<bool> loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException.login: ${e.code} ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('AuthService.login error: $e');
      rethrow;
    }
  }

  /// Create a new user.
  Future<bool> registerWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException.register: ${e.code} ${e.message}');
      rethrow;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
