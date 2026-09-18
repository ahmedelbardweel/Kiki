import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_player_bloc.freezed.dart';

// --- Events ---
@freezed
class StreamPlayerEvent with _$StreamPlayerEvent {
  const factory StreamPlayerEvent.loadStream(String streamUrl) = _LoadStream;
  const factory StreamPlayerEvent.play() = _Play;
  const factory StreamPlayerEvent.pause() = _Pause;
}

// --- States ---
@freezed
class StreamPlayerState with _$StreamPlayerState {
  const factory StreamPlayerState.initial() = _Initial;
  const factory StreamPlayerState.loading() = _Loading;
  const factory StreamPlayerState.playing() = _Playing;
  const factory StreamPlayerState.paused() = _Paused;
  const factory StreamPlayerState.error(String message) = _Error;
}

// --- BLoC ---
class StreamPlayerBloc extends Bloc<StreamPlayerEvent, StreamPlayerState> {
  StreamPlayerBloc() : super(const StreamPlayerState.initial()) {
    on<_LoadStream>(_onLoadStream);
    on<_Play>(_onPlay);
    on<_Pause>(_onPause);
  }

  Future<void> _onLoadStream(_LoadStream event, Emitter<StreamPlayerState> emit) async {
    emit(const StreamPlayerState.loading());
    // Simulate initial buffering/loading delay before we know it can play
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const StreamPlayerState.playing());
  }

  void _onPlay(_Play event, Emitter<StreamPlayerState> emit) {
    emit(const StreamPlayerState.playing());
  }

  void _onPause(_Pause event, Emitter<StreamPlayerState> emit) {
    emit(const StreamPlayerState.paused());
  }
}
