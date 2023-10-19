// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flutter/material.dart';
// import 'package:team_giant_hockey/core/base_game.dart';
// import 'package:team_giant_hockey/core/components/puck_component.dart';

// class Paddle2DraggableComponent extends SpriteComponent
//     with DragCallbacks, HasGameRef<MyGame>, CollisionCallbacks {
//   @override
//   Future<void> onLoad() async {
//     add(CircleHitbox(isSolid: true));
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     debugColor =
//         isDragged && findGame() is MyGame ? Colors.greenAccent : Colors.purple;
//   }

//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     print("position ${position.y}");
//     if (findGame() is! MyGame) {
//       event.continuePropagation = true;
//       return;
//     }
//     if (position.x >= 0 && position.x <= 350 && position.y >= 350 && position.y <= 668) {
//       position.add(event.delta);
//       event.continuePropagation = false;
//     } else {
//       if (position.x < 0){
//         position.add(Vector2(0.5, 0));
//       } 
//       if (position.x > 350)  {
//         position.add(Vector2(-0.5, 0));
//       }
//       if (position.y < 350){
//         position.add(Vector2(0, 0.5));
//       } 
//       if (position.y > 668)  {
//         position.add(Vector2(0, -0.5));
//       }
      
//     }
//     // if (position.y >= 350 && position.y <= 710) {
//     //   position.add(Vector2(0, event.delta.y));
//     //   event.continuePropagation = false;
//     // } else {
//     //   if (position.y < 350){
//     //     position.add(Vector2(0.5, 0));
//     //   } 
//     //   if (position.y > 710)  {
//     //     position.add(Vector2(-0.5, 0));
//     //   }
      
//     // }
//   }

//   // @override
//   // void onCollisionStart(
//   //   Set<Vector2> intersectionPoints,
//   //   PositionComponent other,
//   // ) {
//   //   super.onCollisionStart(intersectionPoints, other);
//   //   print("Collision started");
//   //   if (other is PuckComponent) {
//   //     // removeFromParent();
//   //     print("Collision started");
//   //     return;
//   //   }
//   // }

//   // @override
//   // void onCollisionEnd(PositionComponent other) {
//   //   super.onCollisionEnd(other);
//   //   if (!isColliding) {
//   //     print("Collision ended");
//   //   }
//   // }

//   @override
//   void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
//     super.onCollision(intersectionPoints, other);
//     if (other == ScreenHitbox()) {}
//   }
// }
