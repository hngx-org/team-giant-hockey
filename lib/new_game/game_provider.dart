import 'package:flutter/material.dart';
import 'package:team_giant_hockey/new_game/player.dart';
import 'package:team_giant_hockey/new_game/shared_pref.dart';

class MyProvider extends ChangeNotifier {
  late bool isMusicPlaying;
  late bool isSfxOn;

  final prefs = AppSharedPreferences.instance;

  double sfxVolume = 1.0;

  initialize() async {
    isMusicPlaying = prefs.getbgMusicState();
    isSfxOn = prefs.getSFX();
    if (!isSfxOn) {
      sfxVolume = 0.0;
    }
  }

  void updateBgMusicState(bool newPlayState) {
    isMusicPlaying = newPlayState;
    prefs.setBGMusicState(newPlayState);
    notifyListeners();
  }

  void updateSfxState(bool newSfxState) {
    isSfxOn = newSfxState;
    newSfxState ? sfxVolume = 1.0 : sfxVolume = 0.0;
    prefs.setSFX(newSfxState);
    notifyListeners();
  }
}

class PaddleColorProvider extends ChangeNotifier {
  late Color player1Color;
  late Color puckColor;
  late Color player2Color;

  final prefs = AppSharedPreferences.instance;

  initialize() {
    player1Color = prefs.getColor("player_1") ?? Colors.red;
    puckColor = prefs.getColor("puck") ?? Colors.blue;
    player2Color = prefs.getColor("player_2") ?? Colors.blue;
  }

  setPlayer1Color(Color color) {
    player1Color = color;
    prefs.setColor("player_1", color);
    notifyListeners();
  }

  setPuckColor(Color color) {
    puckColor = color;
    prefs.setColor("puck", color);
    notifyListeners();
  }

  setPlayer2Color(Color color) {
    player2Color = color;
    prefs.setColor("player_2", color);
    notifyListeners();
  }
}


class GameProvider extends ChangeNotifier {
  GameProvider._();
  static final GameProvider instance = GameProvider._();

  Player? _player;

  Player? get player => _player;
}
