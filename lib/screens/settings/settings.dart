import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/core/utils/image_constants.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';

import '../../themes/app_theme.dart';
import '../../widgets/custom_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool val = true;
  bool mus = false;
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
            child: Icon(
              Icons.arrow_left_rounded,
              size: 60,
              color: AppTheme.whiteColor,
            ),
          ),
          title: customCentreText(
            inputText: "SETTINGS",
            fontSize: 32,
            weight: FontWeight.w700,
            colorName: AppTheme.whiteColor,
          )),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(145),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customNormalText(
                        inputText: 'Sound',
                        fontSize: 24,
                        weight: FontWeight.w700,
                        colorName: AppTheme.whiteColor),
                    buildSwitch(
                      switcher: val,
                      onTap: () {
                        setState(() {
                          val = !val;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(39),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customNormalText(
                        inputText: 'Music',
                        fontSize: 24,
                        weight: FontWeight.w700,
                        colorName: AppTheme.whiteColor),
                    buildSwitch(
                      switcher: mus,
                      onTap: () {
                        setState(() {
                          mus = !mus;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(158),
                ),
                Center(
                  child: SizedBox(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),
                      child: Image(image: AssetImage(pucks[puckNumber]))),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(36),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(24)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            puckNumber == 0 ? puckNumber = 1 : puckNumber = 0;
                          });
                        },
                        child: Icon(
                          Icons.arrow_left_rounded,
                          size: getProportionateScreenWidth(60),
                          color: AppTheme.whiteColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            puckNumber == 0 ? puckNumber = 1 : puckNumber = 0;
                          });
                        },
                        child: Icon(
                          Icons.arrow_right_rounded,
                          size: getProportionateScreenWidth(60),
                          color: AppTheme.whiteColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> pucks = [
    ImageConstant.greenPuck,
    ImageConstant.yellowPuck,
  ];

  GestureDetector buildSwitch(
      {required bool switcher, required void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(169),
        height: getProportionateScreenHeight(26),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppTheme.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: getProportionateScreenWidth(84.5),
              height: getProportionateScreenWidth(26),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: switcher
                      ? AppTheme.whiteColor
                      : AppTheme.inActiveSwitchColor),
              child: Center(
                  child: customCentreText(
                      inputText: 'OFF',
                      fontSize: 20,
                      weight: FontWeight.w700,
                      colorName: AppTheme.whiteColor)),
            ),
            Container(
              width: getProportionateScreenWidth(84.5),
              height: getProportionateScreenWidth(26),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                      switcher ? AppTheme.primaryColor : AppTheme.white72Color),
              child: Center(
                  child: customCentreText(
                      inputText: 'ON',
                      fontSize: 20,
                      weight: FontWeight.w700,
                      colorName: AppTheme.whiteColor)),
            ),
          ],
        ),
      ),
    );
  }
}
