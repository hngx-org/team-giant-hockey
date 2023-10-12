import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:team_giant_hockey/core/base_game.dart';

import 'paddle1_component.dart';

class PuckComponent extends SpriteComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  Vector2 velocity = Vector2.zero();
  @override
  Future<void> onLoad() async {
    print("here here");
    // velocity = (center - position)..scaleTo(150);

    print("here");
    add(CircleHitbox(isSolid: true));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // add(MyCollidable(intersectionPoints.first));
    // print("collided ------");
    if (other is Paddle1DraggableComponent) {
      final collisionPoint = intersectionPoints.first;
      velocity.y = collisionPoint.y;
      if (collisionPoint.toRect().overlaps(toRect())) {
        // Reverse the Y velocity to bounce off the paddle.
        //  velocity.y = -velocity.y;

        // Optionally, adjust the ball's horizontal velocity based on its position relative to the paddle's center.
        // Calculate the position difference between the ball and the center of the paddle.
        double relativePosition = position.x - collisionPoint.x;
        // Scale the X velocity based on the relative position.

// Scale the X velocity based on the relative position.
        velocity.x = relativePosition * 5;
      }
      // velocity.x = collisionPoint.x;
      // velocity.negate();
      // movePuck();
      print("collided ------");
    } else if (other is ScreenHitbox) {
      final collisionPoint = intersectionPoints.first;
      // Left Side Collision
      if (collisionPoint.x == 0) {
        velocity.x = -velocity.x;
        velocity.y = velocity.y;
      }
      // Right Side Collision
      if (collisionPoint.x == game.size.x) {
        velocity.x = -velocity.x;
        velocity.y = velocity.y;
      }
      // Top Side Collision
      if (collisionPoint.y == 0) {
        velocity.x = velocity.x;
        velocity.y = -velocity.y;
      }
      // Bottom Side Collision
      if (collisionPoint.y == game.size.y) {
        velocity.x = velocity.x;
        velocity.y = -velocity.y;
      }
      //  FlameAudio.play('wall-hit.wav');
    }
    // if (other is ScreenHitbox) {
    //   velocity.negate();
    // }
  }

  // void movePuck() {
  //   velocity = Vector2(20, -40);
  // }

  @override
  void update(double dt) {
    super.update(dt);

    // print("collided here here ------");
    // if () {
    if (position.x == gameRef.size.x || position.x == 0) {
      velocity.x = -velocity.x;

    }
    if (position.y == gameRef.size.y || position.y == 0) {
      velocity.y = -velocity.y;
    }
    position += velocity * dt;
    // Check for collisions with the screen boundaries.
    // if (position.x <= 0 ||
    //     position.x >=
    //         MediaQueryData.fromView(
    //                 WidgetsBinding.instance.renderView.flutterView)
    //             .size
    //             .width) {
    //   // Reverse the X velocity to bounce off the sides.
    //   velocity.x = -velocity.x;
    // }
    // if (position.y <= 0) {
    //   // Reverse the Y velocity to bounce off the top.
    //   velocity.y = -velocity.y;
    // }
    // print("collided here ------");
    // }
    // position.add(velocity * dt);
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


