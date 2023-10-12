
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:team_giant_hockey/screens/games/game_menu.dart';
import 'package:team_giant_hockey/themes/app_theme.dart';


import 'package:device_preview/device_preview.dart';

import 'core/base_game.dart';

import 'firebase_options.dart';

import 'screens/auth/sign_up.dart';
import 'screens/games/game_menu.dart';
import 'services/repository/authentication_repository/authentication_repository.dart';

AppTheme appTheme = AppTheme();
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  FlameAudio.bgm.initialize();
  runApp(GameWidget(game: MyGame()));
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen()
      
      // GameMenuScreen(),
    );
  }
}
