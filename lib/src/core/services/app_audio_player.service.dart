import 'package:just_audio/just_audio.dart';

import '../constant/app_file_path.dart';

class AppAudioPlayer {
  static final AppAudioPlayer _instance = AppAudioPlayer._internal();

  final AudioPlayer _audioPlayer = AudioPlayer();

  factory AppAudioPlayer() => _instance;

  AppAudioPlayer._internal();

  AudioPlayer get audioPlayer => _audioPlayer;

  Future<void> playAudio() async {
    await _audioPlayer.setAsset(AppFilePath.kNotificationSoundPath);
    await _audioPlayer.setLoopMode(LoopMode.all);

    if (!_audioPlayer.playing) await _audioPlayer.play();
  }

  Future<void> stopAudio() async => await _audioPlayer.stop();

  Future<void> pauseAudio() async => await _audioPlayer.pause();
}
