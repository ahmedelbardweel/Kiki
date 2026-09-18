import 'package:flutter/material.dart';
import '../../../../data/datasources/supabase_chat_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LiveChatOverlay extends StatefulWidget {
  final String streamId;

  const LiveChatOverlay({Key? key, required this.streamId}) : super(key: key);

  @override
  State<LiveChatOverlay> createState() => _LiveChatOverlayState();
}

class _LiveChatOverlayState extends State<LiveChatOverlay> {
  late final SupabaseChatDatasource _chatDatasource;
  final List<ChatMessage> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // In a real app with DI, you would get this from get_it and provide it via BLoC.
    // For this demonstration, we instantiate or retrieve directly.
    _chatDatasource = SupabaseChatDatasource(supabaseClient: Supabase.instance.client);
    
    _initChat();
  }

  Future<void> _initChat() async {
    await _chatDatasource.joinChatChannel(widget.streamId);
    _chatDatasource.messages.listen((message) {
      if (mounted) {
        setState(() {
          _messages.add(message);
        });
        // Auto-scroll to bottom
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _chatDatasource.dispose();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      _chatDatasource.sendMessage(text);
      _messageController.clear();
      // Optimistically add to local state
      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        setState(() {
          _messages.add(ChatMessage(
            userId: currentUser.id,
            displayName: currentUser.userMetadata?['full_name'] ?? 'Me',
            avatarUrl: currentUser.userMetadata?['avatar_url'] ?? '',
            message: text,
            timestamp: DateTime.now().toUtc(),
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Chat messages list
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.0, 0.2],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${msg.displayName}: ',
                          style: const TextStyle(
                            color: Colors.white, // In real app, color by user tier
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            msg.message,
                            style: const TextStyle(
                              color: Colors.white,
                              shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        
        // Chat Input Box
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).copyWith(
            bottom: MediaQuery.of(context).padding.bottom + 8,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Send a message...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.black54,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
