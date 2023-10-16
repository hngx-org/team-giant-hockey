// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame_audio/flame_audio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:team_giant_hockey/core/base_game.dart';
// import 'paddle2_component.dart';
// import 'paddle1_component.dart';

// class PuckComponent extends SpriteComponent
//     with HasGameRef<MyGame>, CollisionCallbacks {
//   Vector2 velocity = Vector2.zero();
//   @override
//   Future<void> onLoad() async {
//     print("here here");
//     // velocity = (center - position)..scaleTo(150);

//     print("here");
//     add(CircleHitbox(isSolid: true));
//   }

//   @override
//   void onCollisionStart(
//       Set<Vector2> intersectionPoints, PositionComponent other) {
//     super.onCollisionStart(intersectionPoints, other);

//     if (other is Paddle1DraggableComponent) {
//       final collisionPoint = intersectionPoints.first;
//       velocity.y = collisionPoint.y;
//       if (collisionPoint.toRect().overlaps(toRect())) {
//         double relativePosition = position.x - collisionPoint.x;
//         velocity.x = relativePosition * 5;
//       }
//       FlameAudio.play("collision_sound.wav");
//       print("collided ------");
//     } else if (other is Paddle2DraggableComponent) {
//       final collisionPoint = intersectionPoints.first;
//       velocity.y = -collisionPoint.y;
//       if (collisionPoint.toRect().overlaps(toRect())) {
//         double relativePosition = position.x - collisionPoint.x;
//         velocity.x = relativePosition * 5;
//       }
//       FlameAudio.play("collision_sound.wav");
//     } else if (other is ScreenHitbox) {
//       FlameAudio.play("collision_sound.wav");
//       velocity.negate();
//     }
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     position += velocity * dt;
//     double gameX = gameRef.size.x - 20;
//     double gameY = gameRef.size.y - 20;
//     if (position.x >= gameX) {
//       velocity.x = -velocity.x;
//     }
//     if (position.y >= gameY) {
//       velocity.y = -velocity.y;
//     }
//     // print("position $position");
//     // if (position.x == gameRef.size.x || position.x == 0) {
//     //   velocity.x = -velocity.x;
//     // }
//     // if (position.y == gameRef.size.y || position.y == 0) {
//     //   velocity.y = -velocity.y;
//     // }
//   }
// }

// class MyCollidable extends PositionComponent
//     with HasGameReference<MyGame>, CollisionCallbacks {
//   late Vector2 velocity;
//   final _collisionColor = Colors.amber;
//   final _defaultColor = Colors.cyan;
//   late ShapeHitbox hitbox;

//   MyCollidable(Vector2 position)
//       : super(
//           position: position,
//           size: Vector2.all(100),
//           anchor: Anchor.center,
//         );

//   @override
//   Future<void> onLoad() async {
//     final defaultPaint = Paint()
//       ..color = _defaultColor
//       ..style = PaintingStyle.stroke;
//     hitbox = CircleHitbox()
//       ..paint = defaultPaint
//       ..renderShape = true;
//     add(hitbox);
//     final center = game.size / 2;
//     velocity = (center - position)..scaleTo(150);
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     position.add(velocity * dt);
//   }

//   @override
//   void onCollisionStart(
//     Set<Vector2> intersectionPoints,
//     PositionComponent other,
//   ) {
//     super.onCollisionStart(intersectionPoints, other);
//     hitbox.paint.color = _collisionColor;
//     if (other is ScreenHitbox) {
//       removeFromParent();
//       return;
//     }
//   }

//   @override
//   void onCollisionEnd(PositionComponent other) {
//     super.onCollisionEnd(other);
//     if (!isColliding) {
//       hitbox.paint.color = _defaultColor;
//     }
//   }
// }
