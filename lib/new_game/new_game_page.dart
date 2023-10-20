import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/new_game/centre_line.dart';
import 'package:team_giant_hockey/new_game/game_enum.dart';
import 'package:team_giant_hockey/new_game/game_provider.dart';
import 'package:team_giant_hockey/new_game/player.dart';
import 'package:team_giant_hockey/new_game/player_chip.dart';
import 'package:team_giant_hockey/new_game/spaces.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import '../widgets/custom_text.dart';
import '../widgets/dialog_button.dart';

class NewGameScreen extends StatefulWidget {
  final GameMode gameMode;
  final double? speed;
  final String paddleType;

  const NewGameScreen(
      {super.key,
      required this.gameMode,
      required this.paddleType,
      this.speed});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  final ConfettiController confettiController = ConfettiController();
  bool isConfettiPlay = false;
  int count = 3;
  String countdownString = "3";
  Timer? countdownTimer;

  List<String> pucks = [
    ImageConstant.greenPuck,
    ImageConstant.bluePuck,
    ImageConstant.yellowPuck,
    ImageConstant.redPuck,
  ];

  @override
  void initState() {
    pucks.remove(widget.paddleType);
    confettiController.addListener(() {
      isConfettiPlay =
          confettiController.state == ConfettiControllerState.playing;
    });

    super.initState();

    final paddleColorProvider =
        Provider.of<PaddleColorProvider>(context, listen: false);
    if (widget.gameMode == GameMode.ai) {
      player1 = Player(
          name: "Computer",
          color: paddleColorProvider.player1Color,
          playerImage: pucks[1]);

      player2 = Player(
          name: "Player",
          color: paddleColorProvider.player2Color,
          playerImage: widget.paddleType);
    } else if (widget.gameMode == GameMode.player2) {
      player1 = Player(
          name: "Player 1",
          color: paddleColorProvider.player1Color,
          playerImage: pucks[1]);

      player2 = Player(
          name: "Player 2",
          color: paddleColorProvider.player2Color,
          playerImage: widget.paddleType);
    } else {
      player1 = Player(
          name: "Player 1",
          color: paddleColorProvider.player1Color,
          playerImage: pucks[1]);

      player2 = Player(
        name: "Player 2",
        color: paddleColorProvider.player2Color,
        playerImage: widget.paddleType,
      );
    }

    ball = Puck(
      name: paddleColorProvider.puckColor.toString(),
      color: paddleColorProvider.puckColor,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // getGameDetails();
    });
  }

  Player player1 = Player(
    name: "Computer",
    color: Colors.red,
    playerImage: ImageConstant.greenPuck,
  );
  Player player2 = Player(
    name: "Player 2",
    color: Colors.blue,
    playerImage: ImageConstant.yellowPuck,
  );

  Puck ball = Puck(
    name: "ball",
    color: Colors.black,
  );

  // ball attributes
  late double xSpeed = 0;
  late double ySpeed = 0;

  late double temporaryXSpeed;
  late double temporaryYSpeed;

  // last known grid positions
  double lastKnownX = 0;
  double lastKnownY = 0;

  double lastKnownOppX = 0;
  double lastKnownOppY = 0;

  final goalWidth = getProportionateScreenWidth(200);

  gridSizingFunction({
    required double left,
    required double top,
    required double minY,
    required double maxY,
  }) async {
    final gridX =
        ((MediaQuery.of(context).size.width - getProportionateScreenWidth(14)) /
                5)
            .ceilToDouble();
    final gridY = ((MediaQuery.of(context).size.height -
                getProportionateScreenWidth(14)) /
            11)
        .ceilToDouble();
    /**
     * Get grid to send to DB 
     */
    final verticalGrid = (top / gridY).ceilToDouble();
    final horizontalGrid = (left / gridX).ceilToDouble();

    if (!(lastKnownX == horizontalGrid.toDouble() &&
        lastKnownY == verticalGrid.toDouble())) {
      if (
          // widget.gameId != null &&
          widget.gameMode == GameMode.multiplayer) {
        // GameService.instance.updatePaddleMovement(
        // widget.gameId!,
        // widget.playerId!,
        // horizontalGrid,
        //   verticalGrid,
        // );
      }
    }
    lastKnownX = horizontalGrid.toDouble();
    lastKnownY = verticalGrid.toDouble();
    /**
     * On getting the grid, multiply the (phoneWidth -14.w / 5).toCeiling on X and (phoneHeight -14.w / 11).toCeiling on Y
     * On getting on other phone
     * 11 - verticalGrid
     * */
  }

  // table attributes
  late final double tableHeight;
  late final double tableWidth;

  // Start text attributes
  String textStart = 'Tap to start!';
  final textStartHeight = getProportionateScreenHeight(120);
  final textStartWidth = getProportionateScreenWidth(480);
  double textStartFontSize = getProportionateScreenWidth(35);
  late final double textStartTop;
  late final double textStartLeft;

  movePlayer1(
    Player player,
    double dx,
    double dy,
  ) async {
    if (mounted) {
      player.left += dx;
      if (player.left <= 7.w) {
        player.left = 7.w;
      } else {
        player.left = player.left;
      }
      player.left = player.left < (tableWidth - (playerSize.w + 7.w))
          ? player.left
          : (tableWidth - (playerSize.w + 7.w));
      player.top += dy;
      if (player.top <= 7.w) {
        player.top = 7.w;
      } else {
        player.top = player.top;
      }

      if (player.top >
          MediaQuery.of(context).size.height / 2 - (playerSize.w + 7.w)) {
        player.top =
            MediaQuery.of(context).size.height / 2 - (playerSize.w + 7.w);
      } else {
        player.top = player.top;
      }
    }
  }

  movePlayer1Multiplayer(
    Player player,
    double dx,
    double dy,
  ) async {
    if (lastKnownOppX == dx && lastKnownOppY == dy) {
      return;
    }

    final gridX =
        ((MediaQuery.of(context).size.width - 14.w) / 5).ceilToDouble();
    final gridY =
        ((MediaQuery.of(context).size.height - 14.w) / 11).ceilToDouble();
    const xGrids = 5;
    const yGrids = 11;
    lastKnownOppX = dx;
    lastKnownOppY = dy;

    player.left = gridX * (xGrids - dx);
    player.left = player.left <= 7.w ? 7.w : player.left;
    player.left = player.left < (tableWidth - playerSize.w + 7.w)
        ? player.left
        : (tableWidth - playerSize.w + 7.w);

    player.top = (gridY * (yGrids - dy));
    player.top = player.top > 7.w ? player.top : 7.w;
    if (player.top == gridY) {
      player.top = 7.w;
    } else {
      player.top = player.top >
              (MediaQuery.of(context).size.height / 2 - (playerSize.w + 7.w))
          ? (MediaQuery.of(context).size.height / 2 - (playerSize.w + 7.w))
          : player1.top;
    }
  }

  movePlayer2(
    Player player,
    double dx,
    double dy,
  ) async {
    if (mounted) {
      player.left += dx;
      if (player.left <= 7.w) {
        player.left = 7.w;
      } else {
        player.left = player.left;
      }
      player.left = player.left < (tableWidth - (playerSize.w + 7.w))
          ? player.left
          : (tableWidth - (playerSize.w + 7.w));
      player.top += dy;
      if (player.top <= 7.w) {
        player.top = 7.w;
      } else {
        player.top = player.top;
      }
      if (player.top > MediaQuery.of(context).size.height / 2 &&
          player.top >=
              MediaQuery.of(context).size.height - (playerSize.w + 7.w)) {
        player.top = MediaQuery.of(context).size.height - (playerSize.w + 7.w);
      } else if (player.top > MediaQuery.of(context).size.height / 2) {
        player.top = player2.top;
      } else {
        player.top = MediaQuery.of(context).size.height / 2;
      }

      gridSizingFunction(
        left: player.left,
        top: player.top,
        minY: MediaQuery.of(context).size.height / 2,
        maxY: MediaQuery.of(context).size.height - (playerSize.h + 7.w),
      );
    }
  }

  late String turn;
  bool gameIsStarted = false;
  bool gameIsFinished = false;
  bool showStartText = true;
  late double distanceBall2P1;
  late double distanceBall2P2;
  int gameEndsAt = 5;
  Offset? previousPoint;

  void nextRound(String player) {
    player == player1.name ? player1.score++ : player2.score++;
    turn = player;
    xSpeed = 0;
    ySpeed = 0;
    showStartText = true;
    if (player1.score == gameEndsAt) {
      textStart = "${player1.name} Wins";
      textStartFontSize *= 1.5;
      turn = player1.name;
      gameIsFinished = true;
    } else if (player2.score == gameEndsAt) {
      textStart = "${player2.name} Wins";
      textStartFontSize *= 1.5;
      turn = player2.name;
      gameIsFinished = true;
    }
    ball.left = (MediaQuery.of(context).size.width / 2) - ballRadius;
    ball.top = (MediaQuery.of(context).size.height / 2) - ballRadius;
  }

  double pythagoras(double a, double b) {
    return math.sqrt(math.pow(a, 2).toDouble() + math.pow(b, 2).toDouble());
  }

  void doTheMathWork() async {
    player1.right = player1.left + playerSize;
    player1.bottom = player1.top + playerSize;
    player1.centerX = player1.left + playerRadius;
    player1.centerY = player1.top + playerRadius;
    player2.right = player2.left + playerSize;
    player2.bottom = player2.top + playerSize;
    player2.centerX = player2.left + playerRadius;
    player2.centerY = player2.top + playerRadius;
    ball.right = ball.left + ball.size;
    ball.bottom = ball.top + ball.size;
    ball.centerX = ball.left + ballRadius;
    ball.centerY = ball.top + ballRadius;

    // Calculate the left and right bounds of the goalpost.
    double goalLeft1 = (MediaQuery.of(context).size.width - goalWidth) / 2;
    double goalRight1 = goalLeft1 + goalWidth;
    double goalLeft2 = MediaQuery.of(context).size.width / 2 - goalWidth / 2;
    double goalRight2 = goalLeft2 + goalWidth;

    // Check if the ball is inside the goalpost area.
    if ((ball.top <= 0 || ball.bottom >= tableHeight) &&
        ((ball.centerX >= goalLeft1 && ball.centerX <= goalRight1) ||
            (ball.centerX >= goalLeft2 && ball.centerX <= goalRight2))) {
    } else if (ball.top <= 0 || ball.bottom >= tableHeight) {
      ySpeed = -ySpeed;
    } else {
      distanceBall2P1 = pythagoras(
        ball.centerX - player1.centerX,
        ball.centerY - player1.centerY,
      );
      distanceBall2P2 = pythagoras(
        ball.centerX - player2.centerX,
        ball.centerY - player2.centerY,
      );

      // Player1 (top player) calculations
      if (distanceBall2P1 <= playerRadius + ballRadius) {
        handlePaddleCollision(player1);
        FlameAudio.play("collision_sound.wav");
      }

      // Player2 (bottom player) calculations
      else if (distanceBall2P2 <= playerRadius + ballRadius) {
        handlePaddleCollision(player2);
        FlameAudio.play("collision_sound.wav");
      }
    }
  }

  void updateAI() {
    //print(ball.centerX);
    if ((ball.centerX - player1.centerX) < playerSize &&
        tableWidth - ball.centerX < 40) {
      player1.left -= Random().nextDouble() * 20;
      player1.top -= Random().nextDouble() * 20;
    } else if ((ball.centerX - player1.centerX) < playerSize &&
        ball.centerX < 40) {
      player1.left += Random().nextDouble() * 20;
      player1.top -= Random().nextDouble() * 20;
    } else {
      if (ball.bottom < tableHeight / 2) {
        if (ball.centerX > player1.centerX) {
          // Move the paddle right to follow the puck

          player1.left += widget.speed ?? 2.0;
        } else if (ball.centerX < player1.centerX) {
          // Move the paddle left to follow the puck

          player1.left -= widget.speed ?? 2.0;
        }

        // Check if the ball is in the AI's half

        // If the puck is in the AI's half, adjust the paddle's vertical position
        if (ball.centerY > player1.centerY) {
          // Move the paddle down to follow the puck
          player1.top += widget.speed ?? 2.0;
        } else if (ball.centerY < player1.centerY) {
          // Move the paddle up to follow the puck
          player1.top -= widget.speed ?? 2.0;
        }
      } else {
        if (player1.top >= playerSize * 1.2) {
          player1.top -= widget.speed ?? 2.0;
        }
        if (player1.left >= tableWidth / 2 - playerRadius) {
          player1.left -= widget.speed ?? 2.0;
        } else {
          player1.left += widget.speed ?? 2.0;
        }
      }
    }

    // Limit the paddle's movement within the game boundaries
    player1.left =
        max(min(player1.left, tableWidth - (playerSize + ballSize)), 0);
    player1.top = max(
        min(player1.top, (tableHeight / 2) - 100), (playerRadius + ballSize));
  }

  void handlePaddleCollision(Player player) {
    // Calculate the horizontal and vertical distances between the ball and the player's center
    double horizontalDistance = ball.centerX - player.centerX;
    double verticalDistance = ball.centerY - player.centerY;

    // Calculate the horizontal and vertical speed components
    double horizontalSpeed = horizontalDistance / playerRadius;
    double verticalSpeed = verticalDistance / playerRadius;

    // Adjust the speed factors (make the ball move faster or slower)
    double speedFactor = widget.speed!;
    // Limit the maximum speed
    double maxSpeed = widget.speed! + 1.5;
    horizontalSpeed = horizontalSpeed.clamp(-maxSpeed, maxSpeed);
    verticalSpeed = verticalSpeed.clamp(-maxSpeed, maxSpeed);

    // Calculate the new x and y speeds based on the direction of collision
    if (horizontalDistance.abs() > verticalDistance.abs()) {
      // Horizontal collision
      xSpeed = horizontalSpeed * speedFactor;
      ySpeed = verticalSpeed / horizontalSpeed.abs();
      ySpeed *= speedFactor;
    } else {
      // Vertical collision
      xSpeed = horizontalSpeed / verticalSpeed.abs();
      xSpeed *= speedFactor;
      ySpeed = verticalSpeed * speedFactor;
    }
    // Check for player's shot and adjust the speed if needed
    if (player.shotX != 0) {
      xSpeed = (player.shotX) / speedFactor;
    }
    if (player.shotY != 0) {
      ySpeed = (player.shotY) / speedFactor;
    }
    // FlameAudio.play("collision_sound.wav");
  }

  void startCountdown(double sWidth, double sHeight) {
    print(count);
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count >= 0) {
        setState(() {
          count--;
          if (count == 0) {
            FlameAudio.play("whistle.wav");
            countdownString = "GO!";
            // if (gameIsFinished) {
            //   return;
            // }

            // showStartText = false;
            // xSpeed = math.Random().nextBool() ? 1.2 : -1.2;
            // ySpeed = turn == player1.name ? 1.2 : -1.2;

            // while (mounted) {
            //   ball.left += xSpeed;
            //   ball.top += ySpeed;
            //   if (ball.left > tableWidth - ballSize) {
            //     xSpeed = (-1) * (xSpeed.abs());
            //   } else if (ball.left <= 0) {
            //     xSpeed = xSpeed.abs();
            //   }
            //   if (ball.top > tableHeight - ballSize / 3) {
            //     FlameAudio.play("goal.wav");
            //     player1.left = sWidth / 2 - playerRadius;
            //     player1.top = playerSize * 1.2;
            //     player2.left = sWidth / 2 - playerRadius;
            //     player2.top = sHeight - (playerSize * 2.5);
            //     ball.left = sWidth / 2 - ballRadius;
            //     ball.top = (sHeight / 2) - ballRadius - 50;
            //     setState(() {});
            //     nextRound(player1.name);
            //     break;
            //   } else if (ball.top <= 0 - ballSize * 2 / 3) {
            //     FlameAudio.play("goal.wav");
            //     player1.left = sWidth / 2 - playerRadius;
            //     player1.top = playerSize * 1.2;
            //     player2.left = sWidth / 2 - playerRadius;
            //     player2.top = sHeight - (playerSize * 2.5);
            //     ball.left = sWidth / 2 - ballRadius;
            //     ball.top = (sHeight / 2) - ballRadius - 50;

            //     nextRound(player2.name);
            //     break;
            //   }

            //   doTheMathWork();
            //   // await Future.delayed(const Duration(milliseconds: 1));
            //   if (mounted) {
            //     setState(() {});
            //   }
            // }
          } else {
            countdownString = count.toString();
          }
          print(count);
        });
      } else if (count == 0) {
        print(countdownString);
        timer.cancel();
      }
    });
  }

  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SizeConfig.init(context);
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    // showStartText = false;
    // startCountdown(sWidth, sHeight);

    if (!gameIsStarted) {
      player1.score = 0;
      player2.score = 0;
      tableWidth = sWidth;
      tableHeight = sHeight;
      player1.left = sWidth / 2 - playerRadius;
      player1.top = playerSize * 1.2;
      player2.left = sWidth / 2 - playerRadius;
      player2.top = sHeight - (playerSize * 2.5);
      textStartLeft = tableWidth / 2 - textStartWidth / 2;
      textStartTop = tableHeight / 2 - textStartHeight / 2;
      ball.left = sWidth / 2 - ballRadius;
      ball.top = sHeight / 2 - ballRadius;
      turn = math.Random().nextBool() ? player1.name : player2.name;
      gameIsStarted = true;
    } else {
      if (widget.gameMode == GameMode.ai && !isPaused) {
        updateAI();
      }
    }
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          // color: AppTheme.greyColor,
          width: sWidth,
          height: sHeight,
          child: Stack(
            children: [
              Positioned(
                left: 0, // Align to the left edge of the table
                top: 0, // Align to the top edge of the table
                child: Container(
                  width: sWidth,
                  height: sHeight,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 0, 0, 1),
                        Color.fromARGB(255, 255, 217, 0),
                        Color.fromARGB(255, 0, 0, 255),
                        Color.fromARGB(255, 0, 255, 0)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent, // Transparent border color
                          width: 5.0, // Border width
                        ),
                        color: AppTheme.appBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(child: TopSpace(playerSize: playerSize.w)),
                    Divider(color: AppTheme.appBackgroundColor, thickness: 3.w),
                    SizedBox(height: playerSize.h),
                    const CenterLine(),
                    SizedBox(height: playerSize.h),
                    Divider(color: AppTheme.appBackgroundColor, thickness: 3.w),
                    Expanded(child: BottomSpace(playerSize: playerSize.w)),
                  ],
                ),
              ),
              Positioned(
                left: (sWidth - goalWidth) / 2, // Centered
                top: 0, // Align to the top
                child: Container(
                  width: goalWidth,
                  height: 6.w,
                  color: const Color.fromARGB(255, 0, 255, 0),
                ),
              ),
              // Goalpost 2
              Positioned(
                left: (sWidth - goalWidth) / 2, // Centered
                bottom: 0, // Align to the top
                child: Container(
                  width: goalWidth,
                  height: 7.w,
                  color: const Color.fromRGBO(
                      255, 0, 0, 1), // Transparent background
                ),
              ),
              !gameIsFinished
                  ? AnimatedPositioned(
                      duration: const Duration(milliseconds: 80),
                      left: player2.left,
                      top: player2.top,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          movePlayer2(
                            player2,
                            details.delta.dx,
                            details.delta.dy,
                          );
                          setState(() {});
                        },
                        onPanEnd: (details) {
                          player2.shotX = 0;
                          player2.shotY = 0;
                          setState(() {});
                        },
                        child: PlayerChip(
                          player: player2,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),

              // player1 (top player)
              !gameIsFinished
                  ? AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      left: player1.left,
                      top: player1.top,
                      child: Builder(
                        builder: (context) {
                          if (widget.gameMode == GameMode.player2) {
                            return GestureDetector(
                              onPanUpdate: (details) {
                                movePlayer1(
                                  player1,
                                  details.delta.dx,
                                  details.delta.dy,
                                );
                                setState(() {});
                              },
                              onPanEnd: (details) {
                                player1.shotX = 0;
                                player1.shotY = 0;
                                setState(() {});
                              },
                              child: PlayerChip(
                                player: player1,
                              ),
                            );
                          }
                          return PlayerChip(
                            player: player1,
                          );
                        },
                      ), // Player2 is now controlled by AI.
                    )
                  : const SizedBox.shrink(),

              Positioned(
                top: (sHeight / 2 - 14.w) - (playerSize.w),
                right: 24.w,
                child: Column(
                  children: [
                    //Player 1 score text display
                    RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        player1.score.toString(),
                        style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.whiteColor),
                      ),
                    ),
                    SizedBox(height: 53.h),

                    //Display pause button
                    Visibility(
                      visible: (xSpeed != 0 && ySpeed != 0),
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      child: InkWell(
                        onTap: () {
                          temporaryXSpeed = xSpeed;
                          temporaryYSpeed = ySpeed;
                          setState(() {
                            xSpeed = 0;
                            ySpeed = 0;
                            isPaused = true;
                          });
                        },
                        child: Center(
                          child: Icon(
                            Icons.pause,
                            size: 55.h,
                            color: AppTheme.whiteColor,
                          ),
                          // ),
                        ),
                        // ),
                      ),
                    ),
                    SizedBox(height: 51.h),

                    //Player 2 score display
                    RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        player2.score.toString(),
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              !gameIsFinished //Display game puck when the game is still on
                  ? AnimatedPositioned(
                      duration: const Duration(milliseconds: 15),
                      left: ball.left,
                      top: ball.top,
                      child: Image.asset(
                        ImageConstant.gamePuck,
                        scale: 4,
                      ))
                  : const SizedBox.shrink(),
              !gameIsFinished //Display the tap to start text button then the game counter
                  ? Positioned(
                      width: textStartWidth,
                      height: textStartHeight,
                      left: textStartLeft,
                      top: textStartTop,
                      child: Center(
                          child:
                              // showStartText
                              //     ?
                              Visibility(
                        visible: showStartText,
                        child: TextButton(
                          style: Theme.of(context)
                              .textButtonTheme
                              .style
                              ?.copyWith(
                                backgroundColor: const MaterialStatePropertyAll(
                                  Colors.white,
                                ),
                              ),
                          child: RotatedBox(
                            quarterTurns: turn == player1.name ? 2 : 0,
                            child: customCentreText(
                              inputText: textStart,
                              fontSize: textStartFontSize,
                              weight: FontWeight.w800,
                              colorName: AppTheme.whiteColor,
                            ),
                          ),
                          onPressed: () async {
                            if (gameIsFinished) {
                              return;
                            }

                            showStartText = false;
                            // setState(() {
                            //   countdownString = "3";
                            //   count = 3;
                            // });

                            // await Future.delayed(
                            //   const Duration(seconds: 3),
                            // );
                            xSpeed = math.Random().nextBool() ? 1.2 : -1.2;
                            ySpeed = turn == player1.name ? 1.2 : -1.2;

                            while (mounted) {
                              ball.left += xSpeed;
                              ball.top += ySpeed;
                              if (ball.left > tableWidth - ballSize) {
                                xSpeed = (-1) * (xSpeed.abs());
                              } else if (ball.left <= 0) {
                                xSpeed = xSpeed.abs();
                              }
                              if (ball.top > tableHeight - ballSize / 3) {
                                FlameAudio.play("goal.wav");
                                player1.left = sWidth / 2 - playerRadius;
                                player1.top = playerSize * 1.2;
                                player2.left = sWidth / 2 - playerRadius;
                                player2.top = sHeight - (playerSize * 2.5);
                                ball.left = sWidth / 2 - ballRadius;
                                ball.top = (sHeight / 2) - ballRadius - 50;
                                setState(() {});
                                nextRound(player1.name);
                                break;
                              } else if (ball.top <= 0 - ballSize * 2 / 3) {
                                FlameAudio.play("goal.wav");
                                player1.left = sWidth / 2 - playerRadius;
                                player1.top = playerSize * 1.2;
                                player2.left = sWidth / 2 - playerRadius;
                                player2.top = sHeight - (playerSize * 2.5);
                                ball.left = sWidth / 2 - ballRadius;
                                ball.top = (sHeight / 2) - ballRadius - 50;

                                nextRound(player2.name);
                                break;
                              }

                              doTheMathWork();
                              await Future.delayed(
                                  const Duration(milliseconds: 1));
                              if (mounted) {
                                setState(() {});
                              }
                            }
                          },
                        ),
                      )
                          // : count == -1
                          //     ? const SizedBox()
                          //     : AnimatedSwitcher(
                          //         duration: const Duration(seconds: 1),
                          //         child: Text(
                          //           countdownString.toString(),
                          //           key: ValueKey<int>(count),
                          //           style: GoogleFonts.abhayaLibre(
                          //             fontSize: 75,
                          //             fontWeight: FontWeight.w800,
                          //             color: AppTheme.whiteColor,
                          //           ),
                          //         ),
                          //       ),
                          ),
                    )
                  : Visibility(
                      visible: true,
                      child: Container(
                        height: sHeight,
                        width: sWidth,
                        color: Colors.black.withOpacity(0.8),
                        child: Center(
                          child: Container(
                            height: sHeight,
                            width: sWidth,
                            margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(50),
                              vertical: getProportionateScreenHeight(260),
                            ),
                            decoration: BoxDecoration(
                                color: AppTheme.appBackgroundColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(30),
                                15,
                                getProportionateScreenWidth(30),
                                40,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // customCentreText(
                                  //     inputText: textStart,
                                  //     fontSize: 30,
                                  //     weight: FontWeight.bold,
                                  //     colorName: AppTheme.whiteColor),
                                  textStart == "Player 2 Wins" ||
                                          textStart == "Player Wins"
                                      ? Image.asset(
                                          ImageConstant.youWin,
                                          scale: 4,
                                        )
                                      : Image.asset(
                                          ImageConstant.youLose,
                                          scale: 4,
                                        ),
                                  AppDialogButton(
                                    buttonText: "REPLAY",
                                    onPressed: () {
                                      Get.back();
                                      Get.to(NewGameScreen(
                                        gameMode: widget.gameMode,
                                        speed: widget.speed,
                                        paddleType: widget.paddleType,
                                      ));
                                    },
                                  ),
                                  AppDialogButton(
                                    buttonText: "EXIT",
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

              Visibility(
                visible: isPaused,
                child: Container(
                  height: sHeight,
                  width: sWidth,
                  color: Colors.black.withOpacity(0.8),
                  child: Center(
                    child: Container(
                      height: sHeight,
                      width: sWidth,
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(50),
                        vertical: getProportionateScreenHeight(210),
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.appBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(30),
                            15,
                            getProportionateScreenWidth(30),
                            40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              ImageConstant.paused,
                              scale: 4,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppDialogButton(
                              buttonText: "RESUME",
                              onPressed: () {
                                setState(() {
                                  xSpeed = temporaryXSpeed;
                                  ySpeed = temporaryYSpeed;
                                  isPaused = false;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppDialogButton(
                              buttonText: "RESTART",
                              onPressed: () {
                                Get.back();
                                Get.to(NewGameScreen(
                                  gameMode: widget.gameMode,
                                  speed: widget.speed,
                                  paddleType: widget.paddleType,
                                ));
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppDialogButton(
                              buttonText: "EXIT",
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              !gameIsFinished
                  ? const SizedBox()
                  : Positioned(
                      left: (sWidth - goalWidth) / 2, // Centered
                      top: 0,
                      child: ConfettiWidget(
                        numberOfParticles: 20,
                        maxBlastForce: 100,
                        confettiController: confettiController,
                        shouldLoop: true,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }
}
