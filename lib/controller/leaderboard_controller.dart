// import '../core/app_export.dart';
// import '../firebase_service.dart';
// import '../screens/settings/leaderboard.dart';

// class LeaderboardController extends GetxController {
//   final FirestoreService _firestoreService = FirestoreService();
//   RxList<LeaderboardModel> leaderboard = <LeaderboardModel>[].obs;

//   Future<void> fetchLeaderboard() async {
//     final documents = await _firestoreService.fetchLeaderboard();
//     leaderboard.value = documents.map((doc) => LeaderboardModel.fromDocument(doc)).toList();
//   }

//   // Implement other functions for updating the leaderboard or handling data.
// }




// // class LeaderboardController extends GetxController {
// //   RxList<PlayerScoreModel> playerScores = <PlayerScoreModel>[].obs;

// //   // Fetch player scores from Firestore and populate playerScores list
// //   Future<void> fetchPlayerScores() async {
// //     // Use Firebase Firestore to fetch the player scores and update playerScores list
// //     // Example code: FirebaseFirestore.instance.collection('scores').snapshots()
// //     // .listen((snapshot) {
// //     //   snapshot.docs.forEach((doc) {
// //     //     print(doc['name']);
// //     //     print(doc['score']);
// //     //   });
// //     // });
// //     //
// //     // Use the following code to update the playerScores list:
// //     // playerScores.add(PlayerScoreModel(name: 'Player 1', score: 100));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 2', score: 200));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 3', score: 300));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 4', score: 400));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 5', score: 500));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 6', score: 600));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 7', score: 700));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 8', score: 800));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 9', score: 900));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 10', score: 1000));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 11', score: 1100));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 12', score: 1200));
// //     // playerScores.add(PlayerScoreModel(name: 'Player 13', score: 1300));
// //   }
  
// // }
