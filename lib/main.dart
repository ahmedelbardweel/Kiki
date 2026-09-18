import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/stream_player/stream_player_bloc.dart';
import 'presentation/screens/auth/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://ujqqbgyciapjqcbjtkzz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVqcXFiZ3ljaWFwanFjYmp0a3p6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk3NTQxNTYsImV4cCI6MjEwNTMzMDE1Nn0.8eYTbmbUDjIoEJPZh9cnrA7cW0w_WZSgYLB6ppx3IdM',
  );

  // Initialize Dependency Injection
  await di.initDI();

  runApp(const KikiLiveApp());
}

class KikiLiveApp extends StatelessWidget {
  const KikiLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>()..add(const AuthEvent.checkAuthStatus()),
        ),
        BlocProvider<StreamPlayerBloc>(
          create: (_) => di.sl<StreamPlayerBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Kiki Live',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark, // Defaulting to dark mode as per streaming app standards
        home: const AuthScreen(),
      ),
    );
  }
}
