// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/flame.dart';
// import 'package:flame/game.dart';
// import 'package:flame_audio/flame_audio.dart';
// import 'package:flutter/material.dart';
// import 'package:flame/components.dart';
// import 'package:flutter/material.dart';
// import 'package:dashbook/dashbook.dart';
// import 'package:team_giant_hockey/core/components/puck_component.dart';
// import 'package:team_giant_hockey/core/settings_game.dart';

// import '../widgets/dialog_widget.dart';
// import 'components/paddle1_component.dart';
// import 'components/paddle2_component.dart';

// class MyGame extends FlameGame with HasCollisionDetection, TapDetector {
//   late Vector2 velocity = Vector2(0, 0);
//   SpriteComponent background = SpriteComponent();
//   PuckComponent puck = PuckComponent();
//   Paddle1DraggableComponent paddle1 = Paddle1DraggableComponent();
//   Paddle2DraggableComponent paddle2 = Paddle2DraggableComponent();

//   @override
//   Future<void> onLoad() async {
//     debugMode = true;
//     // FlameAudio.bgm.play('background_music1.mp3');
//     FlameAudio.bgm.stop();
//     final screenWidth = size[0];
//     final screenHeight = size[1];

//     background
//       ..sprite = await loadSprite('hockey_pitch.png')
//       ..size = Vector2(screenWidth, screenHeight);
//     add(background);
//     puck
//       ..sprite = await loadSprite('game_puck.png')
//       ..size = Vector2(40, 40)
//       ..y = screenHeight - 200
//       ..x = screenWidth / 2;
//     // puck =velocity
//     add(puck);
//     paddle1
//       ..sprite = await loadSprite('puck_green.png')
//       ..size = Vector2(60, 60)
//       ..y = 80
//       ..x = screenWidth / 2 - 30;
//     add(paddle1);
//     paddle2
//       ..sprite = await loadSprite('puck_yellow.png')
//       ..size = Vector2(60, 60)
//       ..y = screenHeight - 140
//       ..x = screenWidth / 2 - 30;
//     add(paddle2);

//     add(ScreenHitbox());
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     // print("collided here here ------");
//     if (puck.collidingWith(paddle1)) {
//       puck.velocity += velocity * dt;
//       print("collided here pad------");
//     }
//     // position.add(velocity * dt);
//   }

//   // @override
//   // void onTap() {
//   //   // Future.delayed(Duration.zero, () {
//   //   if (overlays.isActive('PauseMenu')) {
//   //     overlays.remove('PauseMenu');
//   //     print("resume");
//   //     resumeEngine();
//   //   } else {
//   //     overlays.add('PauseMenu');
//   //     print("pause");
//   //     pauseEngine();
//   //   }
//   //   // });
//   // }
// }

//   //  void pauseGame() {
//   //   Future.delayed(Duration.zero, () {
//   //     isPaused = true;
//   //     // You can put any other code that should run when the game is paused here
//   //   });
//   // }

//   // void resumeGame() {
//   //   Future.delayed(Duration.zero, () {
//   //     isPaused = false;
//   //     // You can put any other code that should run when the game is resumed here
//   //   });
//   // }

// // Widget _pauseMenuBuilder(BuildContext buildContext, MyGame game) {
// //   return showMyDialog(buildContext, () {});
// // }

// // Widget overlayBuilder() {
// //   return GameWidget.controlled(
// //     gameFactory: MyGame.new,
// //     overlayBuilderMap: {
// //       'PauseMenu': (context, game) {
// //         return 
// //         showMyDialog(context, () => null);
// //       }
// //     },
// //     initialActiveOverlays: const ['PauseMenu'],
// //   );
// // }
