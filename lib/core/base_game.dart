import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:team_giant_hockey/core/components/puck_component.dart';
import 'package:team_giant_hockey/core/settings_game.dart';

import 'components/paddle1_component.dart';

class MyGame extends FlameGame with HasCollisionDetection, TapDetector {
  SpriteComponent background = SpriteComponent();
  PuckComponent puck = PuckComponent();
  Paddle1DraggableComponent paddle1 = Paddle1DraggableComponent();
  SpriteComponent paddle2 = SpriteComponent();

  @override
  Future<void> onLoad() async {
    // FlameAudio.bgm.play('background_music1.mp3');
    FlameAudio.bgm.stop();
    final screenWidth = size[0];
    final screenHeight = size[1];

    background
      ..sprite = await loadSprite('hockey_pitch.png')
      ..size = Vector2(screenWidth, screenHeight);
    add(background);
    puck
      ..sprite = await loadSprite('game_puck.png')
      ..size = Vector2(40, 40)
      ..y = screenHeight / 2
      ..x = screenWidth / 2;
    add(puck);
    paddle1
      ..sprite = await loadSprite('puck_green.png')
      ..size = Vector2(60, 60)
      ..y = 80
      ..x = screenWidth / 2;
    add(paddle1);
    paddle2
      ..sprite = await loadSprite('puck_yellow.png')
      ..size = Vector2(60, 60)
      ..y = screenHeight - 80
      ..x = screenWidth / 2;
    add(paddle2);
    // add(ScreenHitbox());
  }

  
  // @override
  // void onTapDown(TapDownInfo info) {
  //   add(MyCollidable(info.eventPosition.widget));
  //   // print("collided");
  // }
}


