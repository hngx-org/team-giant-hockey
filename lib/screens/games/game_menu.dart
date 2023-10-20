import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/controller/menu_controller.dart';
import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/screens/settings/game_rule.dart';
import 'package:team_giant_hockey/screens/settings/leaderboard.dart';
import 'package:team_giant_hockey/screens/settings/player_mode.dart';
import 'package:team_giant_hockey/screens/settings/settings.dart';
import 'package:team_giant_hockey/themes/app_theme.dart';
import 'package:team_giant_hockey/widgets/custom_text.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';

class GameMenuScreen extends StatefulWidget {
  const GameMenuScreen({super.key});

  @override
  State<GameMenuScreen> createState() => _GameMenuScreenState();
}

class _GameMenuScreenState extends State<GameMenuScreen> {
  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    if (FlameAudio.bgm.isPlaying) {
    } else {
      FlameAudio.bgm.play('background_music1.mp3');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final _menuController = Get.put(GameMenuController());

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            Column(
              children: [
                Image.asset(
                  ImageConstant.gameAirString,
                  scale: 4,
                ),
                Image.asset(
                  ImageConstant.gameHockeyString,
                  scale: 4,
                ),
              ),
              Column(
                children: [
                  ...List.generate(
                    _menuController.menus.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.to(PlayerModeScreen());
                            // Get.to(GameWidget(game: MyGame()) );
                          } else if (index == 1) {
                            Get.to(GameRulesScreen());
                          } else if (index == 2) {
                            Get.to(SignUpScreen());
                          } else if (index == 3) {
                            Get.to(LeaderBoardScreen());
                          } else if (index == 4) {
                            SystemNavigator.pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customCentreText(
                            inputText: _menuController.menus[index],
                            fontSize: 32,
                            weight: FontWeight.w700,
                            colorName: AppTheme.whiteColor,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImageConstant.greenPuck,
                    scale: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SettingsScreen());
                    },
                    child: const Icon(
                      Icons.settings,
                      color: AppTheme.whiteColor,
                      size: 60,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
