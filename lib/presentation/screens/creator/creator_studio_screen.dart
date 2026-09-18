import 'package:flutter/material.dart';
import '../../../core/theme/app_design_system.dart';
import '../../../core/utils/bottom_sheet_util.dart';

class CreatorStudioScreen extends StatelessWidget {
  const CreatorStudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creator Studio'),
      ),
      body: SingleChildScrollView(
        padding: AppDesignSystem.paddingLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Broadcast Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppDesignSystem.spacingMd),
            
            // Stream Key Card
            Card(
              child: Padding(
                padding: AppDesignSystem.paddingMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Stream Key (Keep this secret)'),
                    const SizedBox(height: AppDesignSystem.spacingSm),
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '••••••••••••••••',
                              border: OutlineInputBorder(),
                            ),
                            enabled: false,
                          ),
                        ),
                        const SizedBox(width: AppDesignSystem.spacingSm),
                        IconButton.filled(
                          onPressed: () {
                            // Copy to clipboard
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Stream key copied!')),
                            );
                          },
                          icon: const Icon(Icons.copy),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDesignSystem.spacingLg),

            // In-app broadcasting
            const Text(
              'Mobile Broadcasting',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppDesignSystem.spacingMd),
            Card(
              child: Padding(
                padding: AppDesignSystem.paddingMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Go live directly from your mobile device camera.'),
                    const SizedBox(height: AppDesignSystem.spacingLg),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        BottomSheetUtil.showConfirmation(
                          context: context,
                          title: 'Start Broadcast',
                          message: 'Are you ready to go live to your followers?',
                          confirmText: 'Go Live',
                        ).then((confirmed) {
                          if (confirmed == true) {
                            // Integrate WebRTC/RTMP publisher here
                          }
                        });
                      },
                      icon: const Icon(Icons.fiber_manual_record),
                      label: const Text('GO LIVE NOW'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
