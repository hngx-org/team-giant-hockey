import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/core/utils/image_constants.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';
import '../../new_game/game_enum.dart';
import '../../new_game/new_game_page.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_text.dart';

class DifficultyLevelScreen extends StatefulWidget {
  const DifficultyLevelScreen({super.key});

  @override
  State<DifficultyLevelScreen> createState() => _DifficultyLevelScreenState();
}

class _DifficultyLevelScreenState extends State<DifficultyLevelScreen> {
  int selected = 0;
  int puckNumber = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.appBackgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_left_rounded,
            size: 60,
            color: AppTheme.whiteColor,
          ),
        ),
        title: customCentreText(
          inputText: "DIFFICULTY",
          fontSize: 32,
          weight: FontWeight.w700,
          colorName: AppTheme.whiteColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(137),
              ),
              SizedBox(
                height: getProportionateScreenHeight(260),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      var data = difficultylevels[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(5),
                              right: getProportionateScreenWidth(22),
                              top: getProportionateScreenHeight(5),
                              bottom: getProportionateScreenHeight(5)),
                          decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              customCentreText(
                                  inputText: data.title,
                                  fontSize: 24,
                                  weight: FontWeight.w700,
                                  colorName: AppTheme.blackColor),
                              Container(
                                height: getProportionateScreenHeight(20),
                                width: getProportionateScreenWidth(20),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.greyColor),
                                child: Center(
                                  child: Container(
                                    height: getProportionateScreenHeight(12),
                                    width: getProportionateScreenWidth(12),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selected == index
                                            ? data.color
                                            : AppTheme.greyColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: getProportionateScreenHeight(47),
                      );
                    },
                    itemCount: difficultylevels.length),
              ),
              SizedBox(
                height: getProportionateScreenHeight(70),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(46)),
                child: GestureDetector(
                  onTap: () {
                    if (difficultylevels[selected].title == "Easy") {
                      Get.to(const NewGameScreen(
                        gameMode: GameMode.ai,
                        speed: 3.0,
                      ));
                    } else if (difficultylevels[selected].title == "Medium") {
                      Get.to(const NewGameScreen(
                        gameMode: GameMode.ai,
                        speed: 5.0,
                      ));
                    } else if (difficultylevels[selected].title == "Hard") {
                      Get.to(const NewGameScreen(
                        gameMode: GameMode.ai,
                        speed: 7.0,
                      ));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.arrow_right_sharp,
                        size: 60,
                        color: AppTheme.whiteColor,
                      ),
                      Center(
                        child: customCentreText(
                          inputText: 'START',
                          fontSize: 32,
                          weight: FontWeight.w700,
                          colorName: const Color(0xff66FF30),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_left_rounded,
                        size: 60,
                        color: AppTheme.whiteColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> pucks = [
  ImageConstant.greenPuck,
  ImageConstant.yellowPuck,
];

class DifficultyLevel {
  final String title;
  final IconData icon;
  final Color color;

  DifficultyLevel(
      {required this.title, required this.icon, required this.color});
}

List<DifficultyLevel> difficultylevels = [
  DifficultyLevel(
      title: 'Easy', icon: Icons.person, color: AppTheme.primaryColor),
  DifficultyLevel(
      title: 'Medium', icon: Icons.person_2, color: AppTheme.redColor),
  DifficultyLevel(
    title: 'Hard',
    icon: Icons.person_add,
    color: AppTheme.yellowColor,
  ),
];
