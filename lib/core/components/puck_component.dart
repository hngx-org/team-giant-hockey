import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:team_giant_hockey/core/base_game.dart';

import 'paddle1_component.dart';

class PuckComponent extends SpriteComponent
    with HasGameRef<MyGame>, DragCallbacks, CollisionCallbacks {
  Future<void> onload() async {
    await super.onLoad();
    final screenWidth = size[0];
    final screenHeight = size[1];

    sprite = await gameRef.loadSprite('game_puck.png');
    size = Vector2(40, 40)
      ..y = screenHeight / 2
      ..x = screenWidth / 2;

    // add(CircleHitbox());
    // add(MyCollidable(size));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    // add(MyCollidable(intersectionPoints.first));
    if (other is Paddle1DraggableComponent) {
      removeFromParent();
      print("collided ------");
    }
  }
}

class MyCollidable extends PositionComponent
    with HasGameReference<MyGame>, CollisionCallbacks {
  late Vector2 velocity;
  final _collisionColor = Colors.amber;
  final _defaultColor = Colors.cyan;
  late ShapeHitbox hitbox;

  MyCollidable(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(100),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;
    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
    final center = game.size / 2;
    velocity = (center - position)..scaleTo(150);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(velocity * dt);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    hitbox.paint.color = _collisionColor;
    if (other is ScreenHitbox) {
      removeFromParent();
      return;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (!isColliding) {
      hitbox.paint.color = _defaultColor;
    }
  }
}
