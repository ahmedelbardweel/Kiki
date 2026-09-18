import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../data/datasources/supabase_auth_datasource.dart';

part 'auth_bloc.freezed.dart';

// --- Events ---
@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthEvent.signOut() = _SignOut;
}

// --- States ---
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;
}

// --- BLoC ---
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SupabaseAuthDatasource _authDatasource;

  AuthBloc({required SupabaseAuthDatasource authDatasource})
      : _authDatasource = authDatasource,
        super(const AuthState.initial()) {
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_SignInWithGoogle>(_onSignInWithGoogle);
    on<_SignOut>(_onSignOut);
    
    // Automatically listen to auth state changes from Supabase
    _authDatasource.authStateChanges.listen((data) {
      add(const AuthEvent.checkAuthStatus());
    });
  }

  Future<void> _onCheckAuthStatus(_CheckAuthStatus event, Emitter<AuthState> emit) async {
    final user = _authDatasource.currentUser;
    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onSignInWithGoogle(_SignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await _authDatasource.signInWithGoogle();
      // State change stream will pick up the success and fire CheckAuthStatus
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onSignOut(_SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await _authDatasource.signOut();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
