import 'package:flutter/material.dart';
import '../../../core/theme/app_design_system.dart';
import '../stream/live_stream_player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Simulate fetching
          await Future.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            // Category Chips Carousel
            SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMd),
                  children: [
                    _buildFilterChip('Just Chatting', true, context),
                    _buildFilterChip('Gaming', false, context),
                    _buildFilterChip('Music', false, context),
                    _buildFilterChip('Esports', false, context),
                  ],
                ),
              ),
            ),
            
            // Grid of Live Streams
            SliverPadding(
              padding: AppDesignSystem.paddingMd,
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDesignSystem.spacingMd,
                  mainAxisSpacing: AppDesignSystem.spacingMd,
                  childAspectRatio: 0.8, // Adjust based on thumbnail vs text ratio
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildLiveCard(context, index);
                  },
                  childCount: 10, // Mock count
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Go to Creator Studio
        },
        icon: const Icon(Icons.videocam),
        label: const Text('Go Live'),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppDesignSystem.spacingSm),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        selectedColor: AppDesignSystem.primarySeed.withOpacity(0.2),
        checkmarkColor: AppDesignSystem.primarySeed,
      ),
    );
  }

  Widget _buildLiveCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const LiveStreamPlayerScreen(
              streamUrl: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8', // Mock HLS
              streamId: 'test_stream_123',
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thumbnail & LIVE badge
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: AppDesignSystem.borderRadiusSmall,
                      ),
                      child: const Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: AppDesignSystem.borderRadiusSmall,
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.person, size: 12, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            '1.2k',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Stream Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: AppDesignSystem.paddingSm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Awesome Stream Title $index',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Streamer $index',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      'Just Chatting',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppDesignSystem.primarySeed,
                          ),
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
