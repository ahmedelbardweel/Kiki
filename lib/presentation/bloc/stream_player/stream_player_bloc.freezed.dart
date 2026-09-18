// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StreamPlayerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelName, ClientRoleType role)
    joinStream,
    required TResult Function() leaveStream,
    required TResult Function() toggleMic,
    required TResult Function() toggleCamera,
    required TResult Function(int uid) remoteUserJoined,
    required TResult Function(int uid) remoteUserOffline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelName, ClientRoleType role)? joinStream,
    TResult? Function()? leaveStream,
    TResult? Function()? toggleMic,
    TResult? Function()? toggleCamera,
    TResult? Function(int uid)? remoteUserJoined,
    TResult? Function(int uid)? remoteUserOffline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelName, ClientRoleType role)? joinStream,
    TResult Function()? leaveStream,
    TResult Function()? toggleMic,
    TResult Function()? toggleCamera,
    TResult Function(int uid)? remoteUserJoined,
    TResult Function(int uid)? remoteUserOffline,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinStream value) joinStream,
    required TResult Function(_LeaveStream value) leaveStream,
    required TResult Function(_ToggleMic value) toggleMic,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_RemoteUserJoined value) remoteUserJoined,
    required TResult Function(_RemoteUserOffline value) remoteUserOffline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinStream value)? joinStream,
    TResult? Function(_LeaveStream value)? leaveStream,
    TResult? Function(_ToggleMic value)? toggleMic,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult? Function(_RemoteUserOffline value)? remoteUserOffline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinStream value)? joinStream,
    TResult Function(_LeaveStream value)? leaveStream,
    TResult Function(_ToggleMic value)? toggleMic,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult Function(_RemoteUserOffline value)? remoteUserOffline,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamPlayerEventCopyWith<$Res> {
  factory $StreamPlayerEventCopyWith(
    StreamPlayerEvent value,
    $Res Function(StreamPlayerEvent) then,
  ) = _$StreamPlayerEventCopyWithImpl<$Res, StreamPlayerEvent>;
}

/// @nodoc
class _$StreamPlayerEventCopyWithImpl<$Res, $Val extends StreamPlayerEvent>
    implements $StreamPlayerEventCopyWith<$Res> {
  _$StreamPlayerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$JoinStreamImplCopyWith<$Res> {
  factory _$$JoinStreamImplCopyWith(
    _$JoinStreamImpl value,
    $Res Function(_$JoinStreamImpl) then,
  ) = __$$JoinStreamImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String channelName, ClientRoleType role});
}

/// @nodoc
class __$$JoinStreamImplCopyWithImpl<$Res>
    extends _$StreamPlayerEventCopyWithImpl<$Res, _$JoinStreamImpl>
    implements _$$JoinStreamImplCopyWith<$Res> {
  __$$JoinStreamImplCopyWithImpl(
    _$JoinStreamImpl _value,
    $Res Function(_$JoinStreamImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? channelName = null, Object? role = null}) {
    return _then(
      _$JoinStreamImpl(
        channelName: null == channelName
            ? _value.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as ClientRoleType,
      ),
    );
  }
}

/// @nodoc

class _$JoinStreamImpl implements _JoinStream {
  const _$JoinStreamImpl({required this.channelName, required this.role});

  @override
  final String channelName;
  @override
  final ClientRoleType role;

  @override
  String toString() {
    return 'StreamPlayerEvent.joinStream(channelName: $channelName, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinStreamImpl &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelName, role);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinStreamImplCopyWith<_$JoinStreamImpl> get copyWith =>
      __$$JoinStreamImplCopyWithImpl<_$JoinStreamImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelName, ClientRoleType role)
    joinStream,
    required TResult Function() leaveStream,
    required TResult Function() toggleMic,
    required TResult Function() toggleCamera,
    required TResult Function(int uid) remoteUserJoined,
    required TResult Function(int uid) remoteUserOffline,
  }) {
    return joinStream(channelName, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelName, ClientRoleType role)? joinStream,
    TResult? Function()? leaveStream,
    TResult? Function()? toggleMic,
    TResult? Function()? toggleCamera,
    TResult? Function(int uid)? remoteUserJoined,
    TResult? Function(int uid)? remoteUserOffline,
  }) {
    return joinStream?.call(channelName, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelName, ClientRoleType role)? joinStream,
    TResult Function()? leaveStream,
    TResult Function()? toggleMic,
    TResult Function()? toggleCamera,
    TResult Function(int uid)? remoteUserJoined,
    TResult Function(int uid)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (joinStream != null) {
      return joinStream(channelName, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinStream value) joinStream,
    required TResult Function(_LeaveStream value) leaveStream,
    required TResult Function(_ToggleMic value) toggleMic,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_RemoteUserJoined value) remoteUserJoined,
    required TResult Function(_RemoteUserOffline value) remoteUserOffline,
  }) {
    return joinStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinStream value)? joinStream,
    TResult? Function(_LeaveStream value)? leaveStream,
    TResult? Function(_ToggleMic value)? toggleMic,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult? Function(_RemoteUserOffline value)? remoteUserOffline,
  }) {
    return joinStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinStream value)? joinStream,
    TResult Function(_LeaveStream value)? leaveStream,
    TResult Function(_ToggleMic value)? toggleMic,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult Function(_RemoteUserOffline value)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (joinStream != null) {
      return joinStream(this);
    }
    return orElse();
  }
}

abstract class _JoinStream implements StreamPlayerEvent {
  const factory _JoinStream({
    required final String channelName,
    required final ClientRoleType role,
  }) = _$JoinStreamImpl;

  String get channelName;
  ClientRoleType get role;

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinStreamImplCopyWith<_$JoinStreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeaveStreamImplCopyWith<$Res> {
  factory _$$LeaveStreamImplCopyWith(
    _$LeaveStreamImpl value,
    $Res Function(_$LeaveStreamImpl) then,
  ) = __$$LeaveStreamImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LeaveStreamImplCopyWithImpl<$Res>
    extends _$StreamPlayerEventCopyWithImpl<$Res, _$LeaveStreamImpl>
    implements _$$LeaveStreamImplCopyWith<$Res> {
  __$$LeaveStreamImplCopyWithImpl(
    _$LeaveStreamImpl _value,
    $Res Function(_$LeaveStreamImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LeaveStreamImpl implements _LeaveStream {
  const _$LeaveStreamImpl();

  @override
  String toString() {
    return 'StreamPlayerEvent.leaveStream()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LeaveStreamImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelName, ClientRoleType role)
    joinStream,
    required TResult Function() leaveStream,
    required TResult Function() toggleMic,
    required TResult Function() toggleCamera,
    required TResult Function(int uid) remoteUserJoined,
    required TResult Function(int uid) remoteUserOffline,
  }) {
    return leaveStream();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelName, ClientRoleType role)? joinStream,
    TResult? Function()? leaveStream,
    TResult? Function()? toggleMic,
    TResult? Function()? toggleCamera,
    TResult? Function(int uid)? remoteUserJoined,
    TResult? Function(int uid)? remoteUserOffline,
  }) {
    return leaveStream?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelName, ClientRoleType role)? joinStream,
    TResult Function()? leaveStream,
    TResult Function()? toggleMic,
    TResult Function()? toggleCamera,
    TResult Function(int uid)? remoteUserJoined,
    TResult Function(int uid)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (leaveStream != null) {
      return leaveStream();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinStream value) joinStream,
    required TResult Function(_LeaveStream value) leaveStream,
    required TResult Function(_ToggleMic value) toggleMic,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_RemoteUserJoined value) remoteUserJoined,
    required TResult Function(_RemoteUserOffline value) remoteUserOffline,
  }) {
    return leaveStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinStream value)? joinStream,
    TResult? Function(_LeaveStream value)? leaveStream,
    TResult? Function(_ToggleMic value)? toggleMic,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult? Function(_RemoteUserOffline value)? remoteUserOffline,
  }) {
    return leaveStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinStream value)? joinStream,
    TResult Function(_LeaveStream value)? leaveStream,
    TResult Function(_ToggleMic value)? toggleMic,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult Function(_RemoteUserOffline value)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (leaveStream != null) {
      return leaveStream(this);
    }
    return orElse();
  }
}

abstract class _LeaveStream implements StreamPlayerEvent {
  const factory _LeaveStream() = _$LeaveStreamImpl;
}

/// @nodoc
abstract class _$$ToggleMicImplCopyWith<$Res> {
  factory _$$ToggleMicImplCopyWith(
    _$ToggleMicImpl value,
    $Res Function(_$ToggleMicImpl) then,
  ) = __$$ToggleMicImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleMicImplCopyWithImpl<$Res>
    extends _$StreamPlayerEventCopyWithImpl<$Res, _$ToggleMicImpl>
    implements _$$ToggleMicImplCopyWith<$Res> {
  __$$ToggleMicImplCopyWithImpl(
    _$ToggleMicImpl _value,
    $Res Function(_$ToggleMicImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleMicImpl implements _ToggleMic {
  const _$ToggleMicImpl();

  @override
  String toString() {
    return 'StreamPlayerEvent.toggleMic()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleMicImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelName, ClientRoleType role)
    joinStream,
    required TResult Function() leaveStream,
    required TResult Function() toggleMic,
    required TResult Function() toggleCamera,
    required TResult Function(int uid) remoteUserJoined,
    required TResult Function(int uid) remoteUserOffline,
  }) {
    return toggleMic();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelName, ClientRoleType role)? joinStream,
    TResult? Function()? leaveStream,
    TResult? Function()? toggleMic,
    TResult? Function()? toggleCamera,
    TResult? Function(int uid)? remoteUserJoined,
    TResult? Function(int uid)? remoteUserOffline,
  }) {
    return toggleMic?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelName, ClientRoleType role)? joinStream,
    TResult Function()? leaveStream,
    TResult Function()? toggleMic,
    TResult Function()? toggleCamera,
    TResult Function(int uid)? remoteUserJoined,
    TResult Function(int uid)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (toggleMic != null) {
      return toggleMic();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinStream value) joinStream,
    required TResult Function(_LeaveStream value) leaveStream,
    required TResult Function(_ToggleMic value) toggleMic,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_RemoteUserJoined value) remoteUserJoined,
    required TResult Function(_RemoteUserOffline value) remoteUserOffline,
  }) {
    return toggleMic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinStream value)? joinStream,
    TResult? Function(_LeaveStream value)? leaveStream,
    TResult? Function(_ToggleMic value)? toggleMic,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult? Function(_RemoteUserOffline value)? remoteUserOffline,
  }) {
    return toggleMic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinStream value)? joinStream,
    TResult Function(_LeaveStream value)? leaveStream,
    TResult Function(_ToggleMic value)? toggleMic,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult Function(_RemoteUserOffline value)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (toggleMic != null) {
      return toggleMic(this);
    }
    return orElse();
  }
}

abstract class _ToggleMic implements StreamPlayerEvent {
  const factory _ToggleMic() = _$ToggleMicImpl;
}

/// @nodoc
abstract class _$$ToggleCameraImplCopyWith<$Res> {
  factory _$$ToggleCameraImplCopyWith(
    _$ToggleCameraImpl value,
    $Res Function(_$ToggleCameraImpl) then,
  ) = __$$ToggleCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleCameraImplCopyWithImpl<$Res>
    extends _$StreamPlayerEventCopyWithImpl<$Res, _$ToggleCameraImpl>
    implements _$$ToggleCameraImplCopyWith<$Res> {
  __$$ToggleCameraImplCopyWithImpl(
    _$ToggleCameraImpl _value,
    $Res Function(_$ToggleCameraImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleCameraImpl implements _ToggleCamera {
  const _$ToggleCameraImpl();

  @override
  String toString() {
    return 'StreamPlayerEvent.toggleCamera()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleCameraImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelName, ClientRoleType role)
    joinStream,
    required TResult Function() leaveStream,
    required TResult Function() toggleMic,
    required TResult Function() toggleCamera,
    required TResult Function(int uid) remoteUserJoined,
    required TResult Function(int uid) remoteUserOffline,
  }) {
    return toggleCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelName, ClientRoleType role)? joinStream,
    TResult? Function()? leaveStream,
    TResult? Function()? toggleMic,
    TResult? Function()? toggleCamera,
    TResult? Function(int uid)? remoteUserJoined,
    TResult? Function(int uid)? remoteUserOffline,
  }) {
    return toggleCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelName, ClientRoleType role)? joinStream,
    TResult Function()? leaveStream,
    TResult Function()? toggleMic,
    TResult Function()? toggleCamera,
    TResult Function(int uid)? remoteUserJoined,
    TResult Function(int uid)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinStream value) joinStream,
    required TResult Function(_LeaveStream value) leaveStream,
    required TResult Function(_ToggleMic value) toggleMic,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_RemoteUserJoined value) remoteUserJoined,
    required TResult Function(_RemoteUserOffline value) remoteUserOffline,
  }) {
    return toggleCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinStream value)? joinStream,
    TResult? Function(_LeaveStream value)? leaveStream,
    TResult? Function(_ToggleMic value)? toggleMic,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult? Function(_RemoteUserOffline value)? remoteUserOffline,
  }) {
    return toggleCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinStream value)? joinStream,
    TResult Function(_LeaveStream value)? leaveStream,
    TResult Function(_ToggleMic value)? toggleMic,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult Function(_RemoteUserOffline value)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera(this);
    }
    return orElse();
  }
}

abstract class _ToggleCamera implements StreamPlayerEvent {
  const factory _ToggleCamera() = _$ToggleCameraImpl;
}

/// @nodoc
abstract class _$$RemoteUserJoinedImplCopyWith<$Res> {
  factory _$$RemoteUserJoinedImplCopyWith(
    _$RemoteUserJoinedImpl value,
    $Res Function(_$RemoteUserJoinedImpl) then,
  ) = __$$RemoteUserJoinedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int uid});
}

/// @nodoc
class __$$RemoteUserJoinedImplCopyWithImpl<$Res>
    extends _$StreamPlayerEventCopyWithImpl<$Res, _$RemoteUserJoinedImpl>
    implements _$$RemoteUserJoinedImplCopyWith<$Res> {
  __$$RemoteUserJoinedImplCopyWithImpl(
    _$RemoteUserJoinedImpl _value,
    $Res Function(_$RemoteUserJoinedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? uid = null}) {
    return _then(
      _$RemoteUserJoinedImpl(
        null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RemoteUserJoinedImpl implements _RemoteUserJoined {
  const _$RemoteUserJoinedImpl(this.uid);

  @override
  final int uid;

  @override
  String toString() {
    return 'StreamPlayerEvent.remoteUserJoined(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteUserJoinedImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteUserJoinedImplCopyWith<_$RemoteUserJoinedImpl> get copyWith =>
      __$$RemoteUserJoinedImplCopyWithImpl<_$RemoteUserJoinedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelName, ClientRoleType role)
    joinStream,
    required TResult Function() leaveStream,
    required TResult Function() toggleMic,
    required TResult Function() toggleCamera,
    required TResult Function(int uid) remoteUserJoined,
    required TResult Function(int uid) remoteUserOffline,
  }) {
    return remoteUserJoined(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelName, ClientRoleType role)? joinStream,
    TResult? Function()? leaveStream,
    TResult? Function()? toggleMic,
    TResult? Function()? toggleCamera,
    TResult? Function(int uid)? remoteUserJoined,
    TResult? Function(int uid)? remoteUserOffline,
  }) {
    return remoteUserJoined?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelName, ClientRoleType role)? joinStream,
    TResult Function()? leaveStream,
    TResult Function()? toggleMic,
    TResult Function()? toggleCamera,
    TResult Function(int uid)? remoteUserJoined,
    TResult Function(int uid)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (remoteUserJoined != null) {
      return remoteUserJoined(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinStream value) joinStream,
    required TResult Function(_LeaveStream value) leaveStream,
    required TResult Function(_ToggleMic value) toggleMic,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_RemoteUserJoined value) remoteUserJoined,
    required TResult Function(_RemoteUserOffline value) remoteUserOffline,
  }) {
    return remoteUserJoined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinStream value)? joinStream,
    TResult? Function(_LeaveStream value)? leaveStream,
    TResult? Function(_ToggleMic value)? toggleMic,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult? Function(_RemoteUserOffline value)? remoteUserOffline,
  }) {
    return remoteUserJoined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinStream value)? joinStream,
    TResult Function(_LeaveStream value)? leaveStream,
    TResult Function(_ToggleMic value)? toggleMic,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult Function(_RemoteUserOffline value)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (remoteUserJoined != null) {
      return remoteUserJoined(this);
    }
    return orElse();
  }
}

abstract class _RemoteUserJoined implements StreamPlayerEvent {
  const factory _RemoteUserJoined(final int uid) = _$RemoteUserJoinedImpl;

  int get uid;

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteUserJoinedImplCopyWith<_$RemoteUserJoinedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteUserOfflineImplCopyWith<$Res> {
  factory _$$RemoteUserOfflineImplCopyWith(
    _$RemoteUserOfflineImpl value,
    $Res Function(_$RemoteUserOfflineImpl) then,
  ) = __$$RemoteUserOfflineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int uid});
}

/// @nodoc
class __$$RemoteUserOfflineImplCopyWithImpl<$Res>
    extends _$StreamPlayerEventCopyWithImpl<$Res, _$RemoteUserOfflineImpl>
    implements _$$RemoteUserOfflineImplCopyWith<$Res> {
  __$$RemoteUserOfflineImplCopyWithImpl(
    _$RemoteUserOfflineImpl _value,
    $Res Function(_$RemoteUserOfflineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? uid = null}) {
    return _then(
      _$RemoteUserOfflineImpl(
        null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RemoteUserOfflineImpl implements _RemoteUserOffline {
  const _$RemoteUserOfflineImpl(this.uid);

  @override
  final int uid;

  @override
  String toString() {
    return 'StreamPlayerEvent.remoteUserOffline(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteUserOfflineImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteUserOfflineImplCopyWith<_$RemoteUserOfflineImpl> get copyWith =>
      __$$RemoteUserOfflineImplCopyWithImpl<_$RemoteUserOfflineImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelName, ClientRoleType role)
    joinStream,
    required TResult Function() leaveStream,
    required TResult Function() toggleMic,
    required TResult Function() toggleCamera,
    required TResult Function(int uid) remoteUserJoined,
    required TResult Function(int uid) remoteUserOffline,
  }) {
    return remoteUserOffline(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelName, ClientRoleType role)? joinStream,
    TResult? Function()? leaveStream,
    TResult? Function()? toggleMic,
    TResult? Function()? toggleCamera,
    TResult? Function(int uid)? remoteUserJoined,
    TResult? Function(int uid)? remoteUserOffline,
  }) {
    return remoteUserOffline?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelName, ClientRoleType role)? joinStream,
    TResult Function()? leaveStream,
    TResult Function()? toggleMic,
    TResult Function()? toggleCamera,
    TResult Function(int uid)? remoteUserJoined,
    TResult Function(int uid)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (remoteUserOffline != null) {
      return remoteUserOffline(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinStream value) joinStream,
    required TResult Function(_LeaveStream value) leaveStream,
    required TResult Function(_ToggleMic value) toggleMic,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_RemoteUserJoined value) remoteUserJoined,
    required TResult Function(_RemoteUserOffline value) remoteUserOffline,
  }) {
    return remoteUserOffline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinStream value)? joinStream,
    TResult? Function(_LeaveStream value)? leaveStream,
    TResult? Function(_ToggleMic value)? toggleMic,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult? Function(_RemoteUserOffline value)? remoteUserOffline,
  }) {
    return remoteUserOffline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinStream value)? joinStream,
    TResult Function(_LeaveStream value)? leaveStream,
    TResult Function(_ToggleMic value)? toggleMic,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_RemoteUserJoined value)? remoteUserJoined,
    TResult Function(_RemoteUserOffline value)? remoteUserOffline,
    required TResult orElse(),
  }) {
    if (remoteUserOffline != null) {
      return remoteUserOffline(this);
    }
    return orElse();
  }
}

abstract class _RemoteUserOffline implements StreamPlayerEvent {
  const factory _RemoteUserOffline(final int uid) = _$RemoteUserOfflineImpl;

  int get uid;

  /// Create a copy of StreamPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteUserOfflineImplCopyWith<_$RemoteUserOfflineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StreamPlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )
    active,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamPlayerStateCopyWith<$Res> {
  factory $StreamPlayerStateCopyWith(
    StreamPlayerState value,
    $Res Function(StreamPlayerState) then,
  ) = _$StreamPlayerStateCopyWithImpl<$Res, StreamPlayerState>;
}

/// @nodoc
class _$StreamPlayerStateCopyWithImpl<$Res, $Val extends StreamPlayerState>
    implements $StreamPlayerStateCopyWith<$Res> {
  _$StreamPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StreamPlayerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'StreamPlayerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )
    active,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements StreamPlayerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$StreamPlayerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'StreamPlayerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )
    active,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements StreamPlayerState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ActiveImplCopyWith<$Res> {
  factory _$$ActiveImplCopyWith(
    _$ActiveImpl value,
    $Res Function(_$ActiveImpl) then,
  ) = __$$ActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String channelName,
    ClientRoleType role,
    bool isMicEnabled,
    bool isCameraEnabled,
    int? remoteUid,
  });
}

/// @nodoc
class __$$ActiveImplCopyWithImpl<$Res>
    extends _$StreamPlayerStateCopyWithImpl<$Res, _$ActiveImpl>
    implements _$$ActiveImplCopyWith<$Res> {
  __$$ActiveImplCopyWithImpl(
    _$ActiveImpl _value,
    $Res Function(_$ActiveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelName = null,
    Object? role = null,
    Object? isMicEnabled = null,
    Object? isCameraEnabled = null,
    Object? remoteUid = freezed,
  }) {
    return _then(
      _$ActiveImpl(
        channelName: null == channelName
            ? _value.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as ClientRoleType,
        isMicEnabled: null == isMicEnabled
            ? _value.isMicEnabled
            : isMicEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCameraEnabled: null == isCameraEnabled
            ? _value.isCameraEnabled
            : isCameraEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        remoteUid: freezed == remoteUid
            ? _value.remoteUid
            : remoteUid // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$ActiveImpl implements _Active {
  const _$ActiveImpl({
    required this.channelName,
    required this.role,
    this.isMicEnabled = true,
    this.isCameraEnabled = true,
    this.remoteUid,
  });

  @override
  final String channelName;
  @override
  final ClientRoleType role;
  @override
  @JsonKey()
  final bool isMicEnabled;
  @override
  @JsonKey()
  final bool isCameraEnabled;
  @override
  final int? remoteUid;

  @override
  String toString() {
    return 'StreamPlayerState.active(channelName: $channelName, role: $role, isMicEnabled: $isMicEnabled, isCameraEnabled: $isCameraEnabled, remoteUid: $remoteUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveImpl &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isMicEnabled, isMicEnabled) ||
                other.isMicEnabled == isMicEnabled) &&
            (identical(other.isCameraEnabled, isCameraEnabled) ||
                other.isCameraEnabled == isCameraEnabled) &&
            (identical(other.remoteUid, remoteUid) ||
                other.remoteUid == remoteUid));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelName,
    role,
    isMicEnabled,
    isCameraEnabled,
    remoteUid,
  );

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveImplCopyWith<_$ActiveImpl> get copyWith =>
      __$$ActiveImplCopyWithImpl<_$ActiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )
    active,
    required TResult Function(String message) error,
  }) {
    return active(channelName, role, isMicEnabled, isCameraEnabled, remoteUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult? Function(String message)? error,
  }) {
    return active?.call(
      channelName,
      role,
      isMicEnabled,
      isCameraEnabled,
      remoteUid,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(
        channelName,
        role,
        isMicEnabled,
        isCameraEnabled,
        remoteUid,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Error value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _Active implements StreamPlayerState {
  const factory _Active({
    required final String channelName,
    required final ClientRoleType role,
    final bool isMicEnabled,
    final bool isCameraEnabled,
    final int? remoteUid,
  }) = _$ActiveImpl;

  String get channelName;
  ClientRoleType get role;
  bool get isMicEnabled;
  bool get isCameraEnabled;
  int? get remoteUid;

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveImplCopyWith<_$ActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$StreamPlayerStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'StreamPlayerState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )
    active,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String channelName,
      ClientRoleType role,
      bool isMicEnabled,
      bool isCameraEnabled,
      int? remoteUid,
    )?
    active,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements StreamPlayerState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of StreamPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
