import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GameMenuController extends GetxController {
  List<String> menus = [
    "START",
    "GAME RULES",
    "CREATE ACCOUNT",
    "LEADERBOARD",
    "EXIT",
  ];
}

class LoggedInMenu extends GetxController {
  List<String> logMenu = [
    "START",
    "GAME RULES",
    "LEADERBOARD",
    "EXIT",
  ];
}
