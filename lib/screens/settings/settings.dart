import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/core/utils/image_constants.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';

import '../../core/app_export.dart';
import '../../services/repository/authentication_repository/authentication_repository.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_text.dart';

import '../auth/sign_in.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // final AuthenticationRepository _authRepository = AuthenticationRepository();
  bool val = true;
  bool mus = true;
  
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
                          // FlameAudio.bgm.play(fileName);
                          // FlameAudio.bgm.pause();
                          if (mus == true) {
                            print(mus);
                            mus = false;
                            FlameAudio.bgm.pause();
                          } else if (mus == false) {
                            print("here $mus");
                            mus = true;
                            FlameAudio.bgm.play('background_music1.mp3');
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(158),
                ),
                
                GestureDetector(
                  onTap: () {
                    // log out
                    if (Get.isDialogOpen == false) {
                      Get.defaultDialog(
                        backgroundColor: AppTheme.appBackgroundColor,
                        title: 'Log Out',
                        titleStyle: GoogleFonts.abhayaLibre(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: AppTheme.whiteColor,
                        ),
                        content: customCentreText(
                            inputText: 'Are you sure you want to log out?',
                            fontSize: 24,
                            weight: FontWeight.w700,
                            colorName: AppTheme.whiteColor),
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirmTextColor: AppTheme.primaryColor,
                        cancelTextColor: AppTheme.whiteColor,
                        buttonColor: AppTheme.whiteColor,
                        onConfirm: () async {

                          AuthenticationRepository.instance.logout();

                        },
                        onCancel: () {
                          Get.back();
                        },
                      );
                    }
                  },
                  child: Ink(
                    child: Container(
                      child: customCentreText(
                          inputText: 'Log Out',
                          colorName: AppTheme.primaryColor,
                          fontSize: 26,
                          weight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



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
              height: getProportionateScreenWidth(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: switcher
                      ? AppTheme.whiteColor
                      : AppTheme.inActiveSwitchColor),
              child: customCentreText(
                  inputText: 'OFF',
                  fontSize: 16,
                  weight: FontWeight.w700,
                  colorName: AppTheme.whiteColor),
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
                      fontSize: 16,
                      weight: FontWeight.w700,
                      colorName: AppTheme.whiteColor)),
            ),
          ],
        ),
      ),
    );
  }
}
