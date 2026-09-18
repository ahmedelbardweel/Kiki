import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'stream_player_bloc.freezed.dart';

// --- Events ---
@freezed
class StreamPlayerEvent with _$StreamPlayerEvent {
  const factory StreamPlayerEvent.joinStream({
    required String channelName,
    required ClientRoleType role,
  }) = _JoinStream;
  const factory StreamPlayerEvent.leaveStream() = _LeaveStream;
  const factory StreamPlayerEvent.toggleMic() = _ToggleMic;
  const factory StreamPlayerEvent.toggleCamera() = _ToggleCamera;
  const factory StreamPlayerEvent.remoteUserJoined(int uid) = _RemoteUserJoined;
  const factory StreamPlayerEvent.remoteUserOffline(int uid) = _RemoteUserOffline;
}

// --- States ---
@freezed
class StreamPlayerState with _$StreamPlayerState {
  const factory StreamPlayerState.initial() = _Initial;
  const factory StreamPlayerState.loading() = _Loading;
  const factory StreamPlayerState.active({
    required String channelName,
    required ClientRoleType role,
    @Default(true) bool isMicEnabled,
    @Default(true) bool isCameraEnabled,
    int? remoteUid,
  }) = _Active;
  const factory StreamPlayerState.error(String message) = _Error;
}

// --- BLoC ---
class StreamPlayerBloc extends Bloc<StreamPlayerEvent, StreamPlayerState> {
  RtcEngine? _engine;
  final String _appId = '4c6f899f64f84ade8a0a737789b8e859';
  
  RtcEngine? get engine => _engine;

  StreamPlayerBloc() : super(const StreamPlayerState.initial()) {
    on<_JoinStream>(_onJoinStream);
    on<_LeaveStream>(_onLeaveStream);
    on<_ToggleMic>(_onToggleMic);
    on<_ToggleCamera>(_onToggleCamera);
    on<_RemoteUserJoined>(_onRemoteUserJoined);
    on<_RemoteUserOffline>(_onRemoteUserOffline);
  }

  Future<void> _onJoinStream(_JoinStream event, Emitter<StreamPlayerState> emit) async {
    emit(const StreamPlayerState.loading());
    try {
      // Request permissions
      await [Permission.microphone, Permission.camera].request();

      // Initialize engine
      _engine = createAgoraRtcEngine();
      await _engine!.initialize(RtcEngineContext(
        appId: _appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ));

      _engine!.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            // Joined successfully
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            add(StreamPlayerEvent.remoteUserJoined(remoteUid));
          },
          onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
            add(StreamPlayerEvent.remoteUserOffline(remoteUid));
          },
        ),
      );

      await _engine!.setClientRole(role: event.role);
      
      if (event.role == ClientRoleType.clientRoleBroadcaster) {
        await _engine!.enableVideo();
        await _engine!.startPreview();
      } else {
        await _engine!.enableVideo();
      }

      await _engine!.joinChannel(
        token: '', // Leave empty if token is not enabled in Agora console
        channelId: event.channelName,
        uid: 0,
        options: const ChannelMediaOptions(),
      );

      emit(StreamPlayerState.active(
        channelName: event.channelName,
        role: event.role,
      ));
    } catch (e) {
      emit(StreamPlayerState.error(e.toString()));
    }
  }

  Future<void> _onLeaveStream(_LeaveStream event, Emitter<StreamPlayerState> emit) async {
    if (_engine != null) {
      await _engine!.leaveChannel();
      await _engine!.release();
      _engine = null;
    }
    emit(const StreamPlayerState.initial());
  }

  Future<void> _onToggleMic(_ToggleMic event, Emitter<StreamPlayerState> emit) async {
    if (state is _Active && _engine != null) {
      final activeState = state as _Active;
      final newMicStatus = !activeState.isMicEnabled;
      await _engine!.muteLocalAudioStream(!newMicStatus);
      emit(activeState.copyWith(isMicEnabled: newMicStatus));
    }
  }

  Future<void> _onToggleCamera(_ToggleCamera event, Emitter<StreamPlayerState> emit) async {
    if (state is _Active && _engine != null) {
      final activeState = state as _Active;
      final newCameraStatus = !activeState.isCameraEnabled;
      await _engine!.muteLocalVideoStream(!newCameraStatus);
      emit(activeState.copyWith(isCameraEnabled: newCameraStatus));
    }
  }

  void _onRemoteUserJoined(_RemoteUserJoined event, Emitter<StreamPlayerState> emit) {
    if (state is _Active) {
      final activeState = state as _Active;
      emit(activeState.copyWith(remoteUid: event.uid));
    }
  }

  void _onRemoteUserOffline(_RemoteUserOffline event, Emitter<StreamPlayerState> emit) {
    if (state is _Active) {
      final activeState = state as _Active;
      if (activeState.remoteUid == event.uid) {
        emit(activeState.copyWith(remoteUid: null));
      }
    }
  }

  @override
  Future<void> close() {
    _engine?.leaveChannel();
    _engine?.release();
    return super.close();
  }
}
