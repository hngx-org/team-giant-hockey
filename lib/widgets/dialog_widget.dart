import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/themes/app_theme.dart';
import 'package:team_giant_hockey/widgets/custom_text.dart';
import 'package:team_giant_hockey/widgets/dialog_button.dart';



showMyDialog(BuildContext context, Function() restart, Function() play) {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppTheme.appBackgroundColor,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 60,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        actionsPadding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        actionsAlignment: MainAxisAlignment.spaceAround,
        content: customCentreText(
          inputText: "PAUSED",
          fontSize: 32,
          weight: FontWeight.w800,
          colorName: AppTheme.whiteColor,
        ),
        actions: <Widget>[
          AppDialogButton(
            buttonText: "PLAY",
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          AppDialogButton(
            buttonText: "RESTART",
            onPressed: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          AppDialogButton(
            buttonText: "EXIT",
            onPressed: () {
              Get.back();
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
