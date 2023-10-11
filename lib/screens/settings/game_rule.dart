import 'package:flutter/material.dart';
import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/widgets/custom_text.dart';

import '../../themes/app_theme.dart';

class GameRulesScreen extends StatelessWidget {
  const GameRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 24, 24),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_left_rounded,
                    size: 60,
                    color: AppTheme.whiteColor,
                  ),
                ),
                const Spacer(),
                customCentreText(
                  inputText: "GAME RULES",
                  fontSize: 32,
                  weight: FontWeight.w700,
                  colorName: AppTheme.whiteColor,
                ),
                const SizedBox(
                  width: 30,
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
