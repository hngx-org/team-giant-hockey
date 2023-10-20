import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardModel {
  final String name;
  final int score;

  LeaderboardModel({
    required this.name,
    required this.score,
  });

  factory LeaderboardModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LeaderboardModel(
      name: data['name'],
      score: data['score'],
    );
  }
}
