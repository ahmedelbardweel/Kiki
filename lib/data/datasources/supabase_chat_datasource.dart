import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatMessage {
  final String userId;
  final String displayName;
  final String avatarUrl;
  final String message;
  final DateTime timestamp;

  ChatMessage({
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.message,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String,
      avatarUrl: json['avatarUrl'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'displayName': displayName,
      'avatarUrl': avatarUrl,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class SupabaseChatDatasource {
  final SupabaseClient _supabaseClient;
  RealtimeChannel? _channel;
  final _messageController = StreamController<ChatMessage>.broadcast();

  SupabaseChatDatasource({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  /// Joins a specific stream's chat channel using Supabase Realtime Broadcast.
  /// We do NOT insert messages into the database.
  Future<void> joinChatChannel(String streamId) async {
    _channel = _supabaseClient.channel('chat_room_$streamId');

    _channel!.onBroadcast(
      event: 'chat_message',
      callback: (payload) {
        if (payload != null) {
          try {
            final message = ChatMessage.fromJson(payload);
            _messageController.add(message);
          } catch (e) {
            // Silently drop malformed messages
          }
        }
      },
    ).subscribe();
  }

  /// Leaves the current chat channel and cleans up.
  Future<void> leaveChatChannel() async {
    if (_channel != null) {
      await _channel!.unsubscribe();
      _channel = null;
    }
  }

  /// Sends a chat message over the broadcast channel.
  Future<void> sendMessage(String message) async {
    if (_channel == null) {
      throw Exception('Not joined to any chat channel.');
    }

    final currentUser = _supabaseClient.auth.currentUser;
    if (currentUser == null) {
      throw Exception('User must be logged in to send a message.');
    }

    // In a real app, you'd fetch the user's profile info from local state/cache.
    // For this example, we use the raw_user_meta_data available in the user object.
    final displayName = currentUser.userMetadata?['full_name'] as String? ?? 'Anonymous';
    final avatarUrl = currentUser.userMetadata?['avatar_url'] as String? ?? '';

    final chatMessage = ChatMessage(
      userId: currentUser.id,
      displayName: displayName,
      avatarUrl: avatarUrl,
      message: message,
      timestamp: DateTime.now().toUtc(),
    );

    await _channel!.sendBroadcastMessage(
      event: 'chat_message',
      payload: chatMessage.toJson(),
    );
  }

  /// Stream of incoming chat messages.
  Stream<ChatMessage> get messages => _messageController.stream;

  void dispose() {
    leaveChatChannel();
    _messageController.close();
  }
}
