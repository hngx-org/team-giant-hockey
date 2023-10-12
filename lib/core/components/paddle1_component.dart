import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:team_giant_hockey/core/base_game.dart';
import 'package:team_giant_hockey/core/components/puck_component.dart';

class Paddle1DraggableComponent extends SpriteComponent
    with DragCallbacks, HasGameRef<MyGame>, CollisionCallbacks {
  // update and render omitted

  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  Paddle1DraggableComponent({super.position}) : super(size: Vector2.all(100));
  
  
  Future<void> onload() async {
    await super.onLoad();
    
    add(CircleHitbox());
    // add(MyCollidable(size));
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugColor =
        isDragged && findGame() is MyGame ? Colors.greenAccent : Colors.purple;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (findGame() is! MyGame) {
      event.continuePropagation = true;
      return;
    }

    position.add(event.delta);
    event.continuePropagation = false;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    print("Collision started");
    if (other is PuckComponent) {
      // removeFromParent();
      print("Collision started");
      return;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    print("Collision ended");
    if (!isColliding) {
      print("Collision ended");
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other == PuckComponent()) print("collided ------");
  }

  // @override
  // bool onDragEnd(DragEndEvent event) {
  //   dragDeltaPosition = null;
  //   return false;
  // }

  // @override
  // bool onDragCancel(DragCancelEvent event) {
  //   dragDeltaPosition = null;
  //   return false;
  // }
}
