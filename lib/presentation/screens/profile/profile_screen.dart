import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_design_system.dart';
import '../../../core/utils/bottom_sheet_util.dart';
import '../../bloc/auth/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final user = state.maybeWhen(
            authenticated: (u) => u,
            orElse: () => null,
          );

          if (user == null) {
            return const Center(child: Text('Not signed in.'));
          }

          final displayName = user.userMetadata?['full_name'] ?? 'Streamer';
          final email = user.email ?? 'No Email';
          final avatarUrl = user.userMetadata?['avatar_url'];

          return ListView(
            padding: AppDesignSystem.paddingLg,
            children: [
              // User Info Card
              Card(
                child: Padding(
                  padding: AppDesignSystem.paddingLg,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
                        child: avatarUrl == null ? const Icon(Icons.person, size: 40) : null,
                      ),
                      const SizedBox(width: AppDesignSystem.spacingLg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              displayName,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: AppDesignSystem.spacingXs),
                            Text(
                              email,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppDesignSystem.spacingLg),

              // Channel Settings
              const Text('Channel Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: AppDesignSystem.spacingMd),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Channel Info'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Open bottom sheet for editing
                },
              ),
              ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text('Stream Analytics'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              
              const Divider(height: AppDesignSystem.spacingXl * 2),

              // Sign out
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
                onTap: () {
                  BottomSheetUtil.showConfirmation(
                    context: context,
                    title: 'Sign Out',
                    message: 'Are you sure you want to sign out?',
                    confirmText: 'Sign Out',
                    isDestructive: true,
                  ).then((confirmed) {
                    if (confirmed == true) {
                      context.read<AuthBloc>().add(const AuthEvent.signOut());
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
