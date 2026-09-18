import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/stream_player/stream_player_bloc.dart';
import '../stream/widgets/live_chat_overlay.dart';

class LiveBroadcastScreen extends StatefulWidget {
  final String streamId; // This acts as the channel name

  const LiveBroadcastScreen({
    Key? key,
    required this.streamId,
  }) : super(key: key);

  @override
  State<LiveBroadcastScreen> createState() => _LiveBroadcastScreenState();
}

class _LiveBroadcastScreenState extends State<LiveBroadcastScreen> {
  late final StreamPlayerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = StreamPlayerBloc()
      ..add(StreamPlayerEvent.joinStream(
        channelName: widget.streamId,
        role: ClientRoleType.clientRoleBroadcaster,
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
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Local Camera Preview
            BlocBuilder<StreamPlayerBloc, StreamPlayerState>(
              builder: (context, state) {
                return state.maybeWhen(
                  active: (channelName, role, isMicEnabled, isCameraEnabled, _) {
                    if (_bloc.engine != null && isCameraEnabled) {
                      return AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _bloc.engine!,
                          canvas: const VideoCanvas(uid: 0), // 0 is local user
                        ),
                      );
                    } else if (!isCameraEnabled) {
                      return const Center(
                        child: Icon(Icons.videocam_off, color: Colors.white, size: 64),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                  error: (msg) => Center(child: Text('Error: $msg', style: const TextStyle(color: Colors.red))),
                  orElse: () => const Center(child: CircularProgressIndicator()),
                );
              },
            ),

            // 2. Chat Overlay
            Positioned.fill(
              child: RepaintBoundary(
                child: LiveChatOverlay(streamId: widget.streamId),
              ),
            ),

            // 3. Top Header
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
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('LIVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        // End stream confirmation
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),

            // 4. Bottom Controls (Mic, Camera)
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: BlocBuilder<StreamPlayerBloc, StreamPlayerState>(
                builder: (context, state) {
                  final isMicEnabled = state.maybeWhen(
                    active: (_, __, mic, ___, ____) => mic,
                    orElse: () => true,
                  );
                  final isCameraEnabled = state.maybeWhen(
                    active: (_, __, ___, cam, ____) => cam,
                    orElse: () => true,
                  );

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: 'mic_btn',
                        backgroundColor: isMicEnabled ? Colors.white30 : Colors.red,
                        onPressed: () => _bloc.add(const StreamPlayerEvent.toggleMic()),
                        child: Icon(isMicEnabled ? Icons.mic : Icons.mic_off, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      FloatingActionButton(
                        heroTag: 'cam_btn',
                        backgroundColor: isCameraEnabled ? Colors.white30 : Colors.red,
                        onPressed: () => _bloc.add(const StreamPlayerEvent.toggleCamera()),
                        child: Icon(isCameraEnabled ? Icons.videocam : Icons.videocam_off, color: Colors.white),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
