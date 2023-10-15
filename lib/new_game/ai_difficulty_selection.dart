import 'package:flutter/widgets.dart';
import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/new_game/game_enum.dart';
import 'package:team_giant_hockey/new_game/new_game_page.dart';
import 'package:team_giant_hockey/widgets/dialog_button.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';

class DificultySelectionScreen extends StatefulWidget {
  const DificultySelectionScreen({super.key});

  @override
  State<DificultySelectionScreen> createState() =>
      _DificultySelectionScreenState();
}

class _DificultySelectionScreenState extends State<DificultySelectionScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        AppDialogButton(
            buttonText: "Easy",
            onPressed: () {
              Get.to(NewGameScreen(
                gameMode: GameMode.ai,
                speed: 3.0,
              ));
            }),
        AppDialogButton(
            buttonText: "Medium",
            onPressed: () {
              Get.to(NewGameScreen(
                gameMode: GameMode.ai,
                speed: 5.0,
              ));
            }),
        AppDialogButton(
            buttonText: "Hard",
            onPressed: () {
              Get.to(NewGameScreen(
                gameMode: GameMode.ai,
                speed: 7.0,
              ));
            }),
      ])),
    );
  }
}
