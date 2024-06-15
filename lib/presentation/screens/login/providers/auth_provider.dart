import 'dart:async';

import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/infrastructure/infrastructure.dart';
import 'package:aprendiendoflutter/infrastructure/shared/services/key_value_storage_service.dart';
import 'package:aprendiendoflutter/infrastructure/shared/services/key_value_storage_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  return AuthNotifier(
    authRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier(
      {required this.keyValueStorageService,
      required this.authRepository})
      : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WrongCredentials {
      logout('Credenciales no son correctas');
    } on ConnectionTimeout {
      logout('Timeout de conexión');
    } catch (e) {
      logout('Error desconocido');
    }

    // final user = await authRepository.login(email, password);
    // state = state.copyWith(
    //     authStatus: AuthStatus.authenticated, user: user);
  }

  void registerUser(String email, String password) async {}
  void checkAuthUser() async {}

  void _setLoggedUser(User user) {
    state = state.copyWith(
      authStatus: AuthStatus.authenticated,
      user: user,
      errorMessage: '',
    );
  }

  Future<void> logout(String? errorMessage) async {
    state = state.copyWith(
      authStatus: AuthStatus.noAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, noAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});
  AuthState copyWith(
      {AuthStatus? authStatus, User? user, String? errorMessage}) {
    return AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
