import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_giant_hockey/new_game/goal_post.dart';

class TopSpace extends StatelessWidget {
  final double playerSize;
  const TopSpace({super.key, required this.playerSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Positioned(
            top: -120.h,
            left: MediaQuery.of(context).size.width / 2 - (50),
            child: Center(
              child: CustomPaint(
                size: Size(100, 200.w), // Adjust size as needed
                painter: SemiCirclePainter(
                  color: Colors.white,
                  isTop: true,
                ),
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/goal_post_green.png",
                scale: 2.5,
              ),
            ),
          ),
          SizedBox(height: 100.h),
          Column(
            children: [
              SizedBox(height: 100.h),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .1),
                child: Row(
                  children: [
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomSpace extends StatelessWidget {
  final double playerSize;
  const BottomSpace({super.key, required this.playerSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Positioned(
            bottom: -120.h,
            left: MediaQuery.of(context).size.width / 2 - (50),
            child: Center(
              child: Transform.rotate(
                angle: math.pi,
                child: CustomPaint(
                  size: Size(100, 200.w), // Adjust size as needed
                  painter: SemiCirclePainter(
                    color: Colors.white,
                    isTop: true,
                  ),
                ),
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/goal_post_red.png",
                scale: 2.5,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .1),
                child: Row(
                  children: [
                    const Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ],
      ),
    );
  }
}
