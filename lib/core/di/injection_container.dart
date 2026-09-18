import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/datasources/supabase_auth_datasource.dart';
import '../../data/datasources/supabase_chat_datasource.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/stream_player/stream_player_bloc.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  // External
  final supabase = Supabase.instance.client;
  final googleSignIn = GoogleSignIn(
    serverClientId: '638779791094-np42vq80lks1pk7nrg5iq10inktd1th7.apps.googleusercontent.com',
  );

  sl.registerLazySingleton(() => supabase);
  sl.registerLazySingleton(() => googleSignIn);

  // Data Sources
  sl.registerLazySingleton(
    () => SupabaseAuthDatasource(
      supabaseClient: sl(),
      googleSignIn: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => SupabaseChatDatasource(
      supabaseClient: sl(),
    ),
  );

  // Repositories
  // (To be added)

  // Use Cases
  // (To be added)

  // BLoCs
  sl.registerFactory(
    () => AuthBloc(
      authDatasource: sl(),
    ),
  );

  sl.registerFactory(
    () => StreamPlayerBloc(),
  );
}
