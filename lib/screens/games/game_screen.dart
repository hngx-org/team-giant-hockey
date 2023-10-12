import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:team_giant_hockey/core/base_game.dart';
import 'package:team_giant_hockey/core/utils/image_constants.dart';
import 'package:team_giant_hockey/widgets/custom_text.dart';
import 'package:team_giant_hockey/widgets/dialog_widget.dart';

import '../../themes/app_theme.dart';

class GameScreen extends StatelessWidget {
  GameScreen({
    super.key,
  });

  final MyGame gameRef = MyGame();

//   @override
//   State<GameScreen> createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Image.asset(
          //     ImageConstant.hockeyPitch,
          //     fit: BoxFit.fill,
          //   ),

          GameWidget.controlled(
            gameFactory: MyGame.new,
            // overlayBuilderMap: {
            //   'PauseMenu': (context, game) {
            //     return showMyDialog(context, () => null);
            //   }
            // },
            // initialActiveOverlays: const ['PauseMenu'],
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: customNormalText(
                    inputText: "5",
                    fontSize: 32,
                    weight: FontWeight.w700,
                    colorName: AppTheme.whiteColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    gameRef.pauseEngine();
                    showMyDialog(
                      context,
                      () {
                        // @override
                        //  gameRef.refreshWidget();
                      },
                      () {
                        gameRef.resumeEngine();
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.pause,
                      size: 50,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: customNormalText(
                    inputText: "3",
                    fontSize: 32,
                    weight: FontWeight.w700,
                    colorName: AppTheme.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
