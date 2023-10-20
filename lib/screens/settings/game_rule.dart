import 'package:flutter/material.dart';
import 'package:team_giant_hockey/core/app_export.dart';

import '../../themes/app_theme.dart';

class GameRulesScreen extends StatelessWidget {
  const GameRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_left_rounded,
                  size: 70,
                  color: AppTheme.whiteColor,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  ImageConstant.gameRules,
                  scale: 3.5,
                ),
              ),
              // customCentreText(
              //   inputText: "GAME RULES",
              //   fontSize: 32,
              //   weight: FontWeight.w700,
              //   colorName: AppTheme.whiteColor,
              // ),
              const SizedBox(
                width: 30,
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
