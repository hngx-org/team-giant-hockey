import 'package:flutter/material.dart';

class Player {
  double left = 0;
  double right = 0;
  double top = 0;
  double bottom = 0;
  double centerX = 0;
  double centerY = 0;
  double shotX = 0;
  double shotY = 0;
  int score = 0;
  final String name;
  final double size = playerSize;
  final Color color;

  Player({
    required this.name,
    required this.color,
  });
}


const playerSize = 80.0;
const playerRadius = playerSize / 2;
const ballSize = 40.0;
const ballRadius = ballSize / 2;


class Puck {
  double left = 0;
  double top = 0;
  double right = 0;
  double bottom = 0;
  double centerX = 0;
  double centerY = 0;
  double mass = 15;
  double velocityX = 0;
  double velocityY = 0;
  double maxSpeed = 10;
  double frictionX = 0.997;
  double frictionY = 0.997;
  double acceleration = 1;
  final String name;
  final double size = ballSize;
  final Color color;

  Puck({
    required this.name,
    required this.color,
  });
}