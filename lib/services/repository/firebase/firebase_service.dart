import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> fetchLeaderboard() async {
    final querySnapshot = await _firestore.collection('leaderboard').get();
    return querySnapshot.docs;
  }


  // Function to save game data
  Future<void> saveGameData(String userId, String userName, int score) async {
    try {
      // Reference to a Firestore document
      final DocumentReference userRef = _firestore.collection('users').doc(userId);

      // Set data in the document
      await userRef.set({
        'name': userName,
        'score': score,
      });
    } catch (e) {
      print('Error saving game data: $e');
    }
  }

  // Function to get game data
  Future<Map<String, dynamic>?> getGameData(String userId) async {
    try {
      final DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(userId).get();
      if (userSnapshot.exists) {
        return userSnapshot.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting game data: $e');
      return null;
    }
  }


  // Add more Firestore functions as needed
}
