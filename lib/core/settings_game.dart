
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';

// class DraggableComponent extends PositionComponent with DragCallbacks  {

//   // update and render omitted

//   Vector2? dragDeltaPosition;
//   bool get isDragging => dragDeltaPosition != null;

//   DraggableEmber({super.position}) : super(size: Vector2.all(100));

//   @override
//   void update(double dt) {
//     super.update(dt);
//     debugColor = isDragged && findGame() is DraggablesExample
//         ? Colors.greenAccent
//         : Colors.purple;
//   }

//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     if (findGame() is! DraggablesExample) {
//       event.continuePropagation = true;
//       return;
//     }

//     position.add(event.delta);
//     event.continuePropagation = false;

//   @override
//   bool onDragStart(DragStartEvent event) {
//     dragDeltaPosition = startPosition.eventPosition.game - position;
//     return false;
//   }

//   @override
//   bool onDragUpdate(DragUpdateEvent event) {
//     if (isDragging) {
//       final localCoords = event.eventPosition.game;
//       position = localCoords - dragDeltaPosition!;
//     }
//     return false;
//   }

//   @override
//   bool onDragEnd(DragEndEvent event) {
//     dragDeltaPosition = null;
//     return false;
//   }

//   @override
//   bool onDragCancel(DragCancelEvent event) {
//     dragDeltaPosition = null;
//     return false;
//   }
// }


// // import 'package:flame/components.dart';
// // import 'package:flame/flame.dart';
// // import 'package:flame/game.dart';
// // import 'package:flame_audio/flame_audio.dart';

// // class SettingsGame extends FlameGame {
  

// //   @override
// //   Future<void> onLoad() async {
// //     // FlameAudio.bgm.play('background_music1.mp3');
// //     FlameAudio.bgm.stop();
// //   }
// // }
