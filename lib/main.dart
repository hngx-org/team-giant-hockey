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
import 'dart:async';

import 'core/app_export.dart';
import 'firebase.config.dart';
import 'services/repository/authentication_repository/authentication_repository.dart';

AppTheme appTheme = AppTheme();
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.instance.initialize();
  // await FirebaseService.initialize(); // Initialize Firebase
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
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
            home: 
            // CountdownScreen()
            GameMenuScreen(),
            );
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

// class CountdownScreen extends StatefulWidget {
//   @override
//   _CountdownScreenState createState() => _CountdownScreenState();
// }

// class _CountdownScreenState extends State<CountdownScreen> {
//   int count = 3;
//   String countdownString = "3";
//   Timer? countdownTimer;

//   @override
//   void initState() {
//     super.initState();
//     startCountdown();
//   }



//   @override
//   void dispose() {
//     countdownTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Game Countdown'),
//       ),
//       body: count == -1
//           ? const SizedBox()
//           : Center(
//               child: AnimatedSwitcher(
//                 duration: Duration(seconds: 1),
//                 child: Text(
//                   countdownString.toString(),
//                   key: ValueKey<int>(count),
//                   style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//     );
//   }
// }
