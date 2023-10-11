import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_theme.dart';
import '../../widgets/custom_text.dart';

class PlayerModeScreen extends StatelessWidget {
  const PlayerModeScreen({super.key});

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
                  inputText: "PLAYER MODE",
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