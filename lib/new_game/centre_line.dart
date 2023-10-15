import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/new_game/dotted_line_painter.dart';

class CenterLine extends StatelessWidget {
  const CenterLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomPaint(
            size: Size(100.w, 1),
            painter: DottedLinePainter(),
          ),
        ),
        Container(
          height: 150.h,
          width: 150.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.blackColor,
            border: Border.all(
              color: Colors.white,
              width: 3.w,
            ),
          ),
          child: Center(
            child: Container(
              height: 24.w,
              width: 24.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Expanded(
          child: CustomPaint(
            size: Size(100.w, 1),
            painter: DottedLinePainter(),
          ),
        ),
      ],
    );
  }
}
