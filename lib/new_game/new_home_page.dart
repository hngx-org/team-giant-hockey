// import 'package:flutter/material.dart';
// import 'package:team_giant_hockey/core/app_export.dart';
// import 'package:team_giant_hockey/new_game/ai_difficulty_selection.dart';
// import 'package:team_giant_hockey/new_game/game_enum.dart';
// import 'package:team_giant_hockey/new_game/new_game_page.dart';
// import 'package:team_giant_hockey/widgets/dialog_button.dart';
// import 'package:team_giant_hockey/widgets/size_config.dart';

// class NewHomePage extends StatefulWidget {
//   const NewHomePage({super.key});

//   @override
//   State<NewHomePage> createState() => _NewHomePageState();
// }

// class _NewHomePageState extends State<NewHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           AppDialogButton(
//               buttonText: "Vs Ai",
//               onPressed: () {
//                 Get.to(const DificultySelectionScreen());
//               }),
//           AppDialogButton(buttonText: "multiplayer", onPressed: () {}),
//           AppDialogButton(
//               buttonText: "Vs player 2",
//               onPressed: () {
//                 Get.to(const NewGameScreen(
//                   gameMode: GameMode.player2,
//                 ));
//               }),
//         ],
//       )),
//     );
//   }
// }
