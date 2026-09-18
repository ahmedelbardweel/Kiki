import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/theme/app_design_system.dart';
import '../stream/live_stream_player_screen.dart';
import '../creator/live_broadcast_screen.dart';
import '../../../core/utils/bottom_sheet_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Just Chatting';
  final List<String> _categories = ['Just Chatting', 'Gaming', 'Music', 'Esports'];
  final _supabase = Supabase.instance.client;

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
      body: CustomScrollView(
        slivers: [
          // Category Chips Carousel
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMd),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return _buildFilterChip(category, _selectedCategory == category);
                },
              ),
            ),
          ),
          
          // Grid of Live Streams
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: _supabase
                .from('streams')
                .stream(primaryKey: ['id'])
                .eq('status', 'live')
                .eq('category', _selectedCategory)
                .order('created_at', ascending: false),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text('Error loading streams: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red)),
                  ),
                );
              }

              final streams = snapshot.data ?? [];

              if (streams.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.videocam_off, size: 64, color: Colors.grey[600]),
                        const SizedBox(height: 16),
                        Text(
                          'لا يوجد بث مباشر في قسم $_selectedCategory حالياً',
                          style: TextStyle(color: Colors.grey[400], fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'كن أنت الأول وابدأ البث الآن!',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SliverPadding(
                padding: AppDesignSystem.paddingMd,
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppDesignSystem.spacingMd,
                    mainAxisSpacing: AppDesignSystem.spacingMd,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final stream = streams[index];
                      return _buildLiveCard(context, stream);
                    },
                    childCount: streams.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startLiveStream(context),
        icon: const Icon(Icons.videocam),
        label: const Text('Go Live'),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: AppDesignSystem.spacingSm),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {
          setState(() {
            _selectedCategory = label;
          });
        },
        selectedColor: AppDesignSystem.primarySeed.withValues(alpha: 0.2),
        checkmarkColor: AppDesignSystem.primarySeed,
      ),
    );
  }

  Widget _buildLiveCard(BuildContext context, Map<String, dynamic> stream) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => LiveStreamPlayerScreen(
              streamId: stream['id'],
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
                      child: Row(
                        children: [
                          const Icon(Icons.person, size: 12, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            '${stream['viewer_count'] ?? 0}',
                            style: const TextStyle(
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
                      stream['title'] ?? 'Live Stream',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Creator', // Ideally, join with profiles table to get creator name
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      stream['category'] ?? 'Just Chatting',
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

  Future<void> _startLiveStream(BuildContext context) async {
    final confirmed = await BottomSheetUtil.showConfirmation(
      context: context,
      title: 'Start Broadcast',
      message: 'Are you ready to go live in the "$_selectedCategory" category?',
      confirmText: 'Go Live',
    );

    if (confirmed == true && mounted) {
      try {
        final userId = _supabase.auth.currentUser!.id;
        
        // Create stream record in Supabase
        final streamData = await _supabase.from('streams').insert({
          'creator_id': userId,
          'title': 'My Awesome $_selectedCategory Stream',
          'category': _selectedCategory,
          'status': 'live',
        }).select().single();
        
        if (!mounted) return;
        
        // Navigate to broadcast screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LiveBroadcastScreen(streamId: streamData['id']),
          ),
        );
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to start stream: $e')),
          );
        }
      }
    }
  }
}
