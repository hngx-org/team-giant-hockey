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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonWidth,
        height: 40,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(255, 0, 0, 1),
              Color.fromARGB(255, 255, 217, 0),
              Color.fromARGB(255, 0, 0, 255),
              Color.fromARGB(255, 0, 255, 0)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent, // Transparent border color
                    width: 5.0, // Border width
                  ),
                  color: AppTheme.appBackgroundColor,
                ),
                // child:
              ),
              Center(
                child: customCentreText(
                  inputText: buttonText,
                  fontSize: 28,
                  weight: FontWeight.w800,
                  colorName: AppTheme.whiteColor,
                ),
              ),
            ],
          ),
        ),
        // ElevatedButton(
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.all<Color>(
        //       AppTheme.whiteColor,
        //     ),
        //     elevation: MaterialStateProperty.all<double>(0),
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //       RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(100),
        //       ),
        //     ),
        //   ),
        //   onPressed: onPressed,
        //   child: customCentreText(
        //     inputText: buttonText,
        //     fontSize: 30,
        //     weight: FontWeight.w800,
        //     colorName: AppTheme.blackColor,
        //   ),
        // ),
      ),
    );
  }
}
