import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:team_giant_hockey/new_game/game_provider.dart';
import 'package:team_giant_hockey/new_game/shared_pref.dart';
import 'package:team_giant_hockey/screens/games/game_menu.dart';
import 'package:team_giant_hockey/themes/app_theme.dart';

AppTheme appTheme = AppTheme();
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.instance.initialize();
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  FlameAudio.bgm.initialize();
  // runApp(GameWidget(game: MyGame()));
//   runApp(
//     DevicePreview(
//       enabled: false,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

  runApp(MultiProvider(
    providers: _providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: GameMenuScreen());
      },
    );
  }
}

final _providers = <SingleChildWidget>[
  ChangeNotifierProvider<GameProvider>(
    create: (_) => GameProvider.instance,
  ),
  ChangeNotifierProvider(create: (context) => MyProvider()..initialize()),
  ChangeNotifierProvider(
      create: (context) => PaddleColorProvider()..initialize()),
];
