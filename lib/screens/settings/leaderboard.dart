import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/core/utils/image_constants.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';

import '../../themes/app_theme.dart';
import '../../widgets/custom_text.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

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
              size: 70,
              color: AppTheme.whiteColor,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Image.asset(
                                ImageConstant.leaderboard,
                                scale: 3.5,
                              ),
          ),
          // customCentreText(
          //   inputText: "LEADERBOARD",
          //   fontSize: 32,
          //   weight: FontWeight.w700,
          //   colorName: AppTheme.whiteColor,
          // ),
          ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(42),
          ),
          Center(
              child: SizedBox(
                  height: getProportionateScreenHeight(41),
                  width: getProportionateScreenWidth(53.02),
                  child: Image(image: AssetImage(ImageConstant.crown)))),
          SizedBox(
            height: getProportionateScreenHeight(41),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(108),
                      width: getProportionateScreenWidth(90),
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(10)),
                      decoration: BoxDecoration(
                          color: Color(0xff1A1964),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          customCentreText(
                              inputText: 'Victory',
                              fontSize: 16,
                              weight: FontWeight.w700,
                              colorName: AppTheme.whiteColor),
                          SizedBox(
                            height: getProportionateScreenHeight(6),
                          ),
                          customCentreText(
                            inputText: '1250',
                            fontSize: 16,
                            weight: FontWeight.w700,
                            colorName: AppTheme.yellowColor,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: getProportionateScreenWidth(10),
                      right: getProportionateScreenWidth(10),
                      top: getProportionateScreenHeight(-35),
                      child: SizedBox(
                        height: getProportionateScreenHeight(78),
                        width: getProportionateScreenWidth(70),
                        child: Image(image: AssetImage(ImageConstant.second)),
                      ),
                    )
                  ],
                ),
                Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(161),
                      width: getProportionateScreenWidth(140),
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(26)),
                      decoration: BoxDecoration(
                          color: Color(0xff27268C),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          customCentreText(
                              inputText: 'Faith',
                              fontSize: 20,
                              weight: FontWeight.w700,
                              colorName: AppTheme.whiteColor),
                          SizedBox(
                            height: getProportionateScreenHeight(6),
                          ),
                          customCentreText(
                            inputText: '1500',
                            fontSize: 20,
                            weight: FontWeight.w700,
                            colorName: AppTheme.redColor,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: getProportionateScreenWidth(25),
                      right: getProportionateScreenWidth(25),
                      top: getProportionateScreenHeight(-40),
                      child: SizedBox(
                        height: getProportionateScreenHeight(97),
                        width: getProportionateScreenWidth(90),
                        child: Image(image: AssetImage(ImageConstant.first)),
                      ),
                    )
                  ],
                ),
                Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(108),
                      width: getProportionateScreenWidth(90),
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(10)),
                      decoration: BoxDecoration(
                          color: Color(0xff1A1964),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          customCentreText(
                              inputText: 'Faith',
                              fontSize: 16,
                              weight: FontWeight.w700,
                              colorName: AppTheme.whiteColor),
                          SizedBox(
                            height: getProportionateScreenHeight(6),
                          ),
                          customCentreText(
                            inputText: '1000',
                            fontSize: 16,
                            weight: FontWeight.w700,
                            colorName: AppTheme.greenColor,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: getProportionateScreenWidth(10),
                      right: getProportionateScreenWidth(10),
                      top: getProportionateScreenHeight(-35),
                      child: SizedBox(
                        height: getProportionateScreenHeight(78),
                        width: getProportionateScreenWidth(70),
                        child: Image(image: AssetImage(ImageConstant.third)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(41),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: getProportionateScreenHeight(398),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xff1A1964).withOpacity(0.56)),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    var data = playerScoreList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(5),
                          horizontal: getProportionateScreenWidth(24)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: getProportionateScreenWidth(22.5),
                                backgroundImage: AssetImage(ImageConstant.guy),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(21),
                              ),
                              customCentreText(
                                  inputText: data.title,
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                  colorName: AppTheme.whiteColor)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              customNormalText(
                                  inputText: data.score,
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                  colorName: AppTheme.whiteColor),
                              SizedBox(
                                  height: getProportionateScreenHeight(10),
                                  width: getProportionateScreenWidth(10),
                                  child: data.isUp == true
                                      ? Image(
                                          image: AssetImage(
                                              ImageConstant.greentri))
                                      : Image(
                                          image:
                                              AssetImage(ImageConstant.redtri)))
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      indent: getProportionateScreenWidth(21),
                      endIndent: getProportionateScreenWidth(21),
                    );
                  },
                  itemCount: playerScoreList.length),
            ),
          )
        ],
      ),
    );
  }
}

class PlayerScoreModel {
  final String title;
  final String score;
  final bool isUp;

  PlayerScoreModel(
      {required this.title, required this.score, required this.isUp});
}

List<PlayerScoreModel> playerScoreList = [
  PlayerScoreModel(title: 'Prince', score: '800', isUp: true),
  PlayerScoreModel(title: 'Light', score: '600', isUp: false),
  PlayerScoreModel(title: 'Paul', score: '800', isUp: true),
  PlayerScoreModel(title: 'Loveth', score: '600', isUp: false),
  PlayerScoreModel(title: 'John', score: '800', isUp: true),
  PlayerScoreModel(title: 'Prince', score: '600', isUp: false),
];
