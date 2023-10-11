import 'package:flutter/material.dart';
import 'package:team_giant_hockey/widgets/custom_text.dart';

import '../themes/app_theme.dart';

class AppDialogButton extends StatelessWidget {
  const AppDialogButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonWidth = double.infinity});
  final String buttonText;
  final Function() onPressed;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            AppTheme.whiteColor,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        onPressed: onPressed,
        child: customCentreText(
          inputText: buttonText,
          fontSize: 30,
          weight: FontWeight.w800,
          colorName: AppTheme.blackColor,
        ),
      ),
    );
  }
}
