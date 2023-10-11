import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_text.dart';

class PlayerModeScreen extends StatefulWidget {
  const PlayerModeScreen({super.key});

  @override
  State<PlayerModeScreen> createState() => _PlayerModeScreenState();
}

class _PlayerModeScreenState extends State<PlayerModeScreen> {
  int selected = 0;
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
            child: Icon(
              Icons.arrow_left_rounded,
              size: 60,
              color: AppTheme.whiteColor,
            ),
          ),
          title: customCentreText(
            inputText: "PLAYER MODE",
            fontSize: 32,
            weight: FontWeight.w700,
            colorName: AppTheme.whiteColor,
          )),
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
                        var data = playerList[index];
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
                                Container(
                                  height: getProportionateScreenHeight(40),
                                  width: getProportionateScreenWidth(40),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: data.color)),
                                  child: Center(
                                    child: Icon(
                                      data.icon,
                                      color: data.color,
                                    ),
                                  ),
                                ),
                                customCentreText(
                                    inputText: data.title,
                                    fontSize: 24,
                                    weight: FontWeight.w700,
                                    colorName: AppTheme.blackColor),
                                Container(
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(20),
                                  decoration: BoxDecoration(
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
                      itemCount: playerList.length)),
              SizedBox(
                height: getProportionateScreenHeight(100),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(46)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_right_sharp,
                        size: 60,
                        color: Color(0xff66FF30),
                      ),
                    ),
                    customCentreText(
                        inputText: 'START',
                        fontSize: 32,
                        weight: FontWeight.w700,
                        colorName: AppTheme.whiteColor),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_left_rounded,
                        size: 60,
                        color: Color(0xff66FF30),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerModel {
  final String title;
  final IconData icon;
  final Color color;

  PlayerModel({required this.title, required this.icon, required this.color});
}

List<PlayerModel> playerList = [
  PlayerModel(
      title: 'Single Player', icon: Icons.person, color: AppTheme.primaryColor),
  PlayerModel(
      title: 'Double Player', icon: Icons.person_2, color: AppTheme.redColor),
  PlayerModel(
      title: 'Play Online',
      icon: Icons.person_add,
      color: AppTheme.yellowColor),
];
