import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/stream_player/stream_player_bloc.dart';
import 'widgets/live_chat_overlay.dart';

class LiveStreamPlayerScreen extends StatefulWidget {
  final String streamId;

  const LiveStreamPlayerScreen({
    Key? key,
    required this.streamId,
  }) : super(key: key);

  @override
  State<LiveStreamPlayerScreen> createState() => _LiveStreamPlayerScreenState();
}

class _LiveStreamPlayerScreenState extends State<LiveStreamPlayerScreen> {
  late final StreamPlayerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = StreamPlayerBloc()
      ..add(StreamPlayerEvent.joinStream(
        channelName: widget.streamId,
        role: ClientRoleType.clientRoleAudience,
      ));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.black, // Dark background for video
        body: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Video Player Surface (Agora)
            BlocBuilder<StreamPlayerBloc, StreamPlayerState>(
              builder: (context, state) {
                return state.maybeWhen(
                  active: (channelName, role, isMicEnabled, isCameraEnabled, remoteUid) {
                    if (remoteUid != null && _bloc.engine != null) {
                      return AgoraVideoView(
                        controller: VideoViewController.remote(
                          rtcEngine: _bloc.engine!,
                          canvas: VideoCanvas(uid: remoteUid),
                          connection: RtcConnection(channelId: channelName),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Waiting for broadcaster...', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      );
                    }
                  },
                  error: (message) => Center(child: Text('Error: $message', style: const TextStyle(color: Colors.red))),
                  orElse: () => const Center(child: CircularProgressIndicator()),
                );
              },
            ),

            // 2. High-speed Chat Overlay (Isolated with RepaintBoundary)
            Positioned.fill(
              child: RepaintBoundary(
                child: LiveChatOverlay(streamId: widget.streamId),
              ),
            ),
            
            // 3. Top Gradient & Header
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
                            'Live Stream',
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
                                'Agora Real-time',
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
      ),
    );
  }
}
