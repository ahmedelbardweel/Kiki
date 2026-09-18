import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_design_system.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../home/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (user) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Container(
            width: double.infinity,
            padding: AppDesignSystem.paddingLg,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface.withOpacity(0.8),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo or App Name
                Icon(
                  Icons.live_tv_rounded,
                  size: 100,
                  color: AppDesignSystem.primarySeed,
                ),
                const SizedBox(height: AppDesignSystem.spacingLg),
                Text(
                  'Kiki Live',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppDesignSystem.primarySeed,
                      ),
                ),
                const SizedBox(height: AppDesignSystem.spacingXs),
                Text(
                  'Join the stream.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: AppDesignSystem.spacingXl * 2),

                // Sign in Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          )
                        : const Icon(Icons.login, color: Colors.black),
                    label: Text(
                      isLoading ? 'Signing In...' : 'Sign in with Google',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: AppDesignSystem.spacingLg),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppDesignSystem.borderRadiusFull,
                      ),
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<AuthBloc>().add(const AuthEvent.signInWithGoogle());
                          },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
