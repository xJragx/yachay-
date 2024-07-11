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
      : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final token = await authRepository.login(email, password);
      _setLoggedUser(token);
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

  Future<void> registerUser(
      String email, String password, String name, String rol) async {
    try {
      final token =
          await authRepository.register(email, password, name, rol);
      print(token);
      return;
    } on WrongCredentials {
      // logout('Credenciales no son correctas');
    } on ConnectionTimeout {
      // logout('Timeout de conexión');
    } catch (e) {
      // logout('Error desconocido');
    }
  }

  void checkAuthStatus() async {
    final token =
        await keyValueStorageService.getValue<String>('token');
    if (token == null) return logout();

    try {
      final token1 = await authRepository.checkAuthStatus('token');
      _setLoggedUser(token1);
    } catch (e) {
      logout();
    }
  }

  void _setLoggedUser(Token token) async {
    await keyValueStorageService.setKeyValue('token', token.token);
    state = state.copyWith(
      authStatus: AuthStatus.authenticated,
      token: token,
      errorMessage: '',
    );
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      token: null,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final Token? token;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.token,
      this.errorMessage = ''});
  AuthState copyWith(
      {AuthStatus? authStatus, Token? token, String? errorMessage}) {
    return AuthState(
        authStatus: authStatus ?? this.authStatus,
        token: token ?? this.token,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
