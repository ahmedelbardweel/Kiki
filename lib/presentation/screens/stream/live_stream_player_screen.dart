import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'widgets/live_chat_overlay.dart';

class LiveStreamPlayerScreen extends StatefulWidget {
  final String streamUrl;
  final String streamId;

  const LiveStreamPlayerScreen({
    Key? key,
    required this.streamUrl,
    required this.streamId,
  }) : super(key: key);

  @override
  State<LiveStreamPlayerScreen> createState() => _LiveStreamPlayerScreenState();
}

class _LiveStreamPlayerScreenState extends State<LiveStreamPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  bool _isPlayerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    // In a real app with HLS, this URL would point to an m3u8 file on the CDN.
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.streamUrl));
    
    try {
      await _videoPlayerController.initialize();
      await _videoPlayerController.play();
      if (mounted) {
        setState(() {
          _isPlayerInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing video player: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for video
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Video Player Surface
          Center(
            child: _isPlayerInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  )
                : const CircularProgressIndicator(),
          ),

          // 2. High-speed Chat Overlay (Isolated with RepaintBoundary)
          Positioned.fill(
            child: RepaintBoundary(
              child: LiveChatOverlay(streamId: widget.streamId),
            ),
          ),
          
          // 3. Top Gradient & Header (Could also be in its own RepaintBoundary if animating)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  // Streamer info
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'StreamerName',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.red, size: 14),
                            SizedBox(width: 4),
                            Text(
                              '1.2k viewers',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
