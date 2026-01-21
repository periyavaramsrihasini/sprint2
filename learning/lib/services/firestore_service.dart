import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore Service
/// Handles real-time data operations with Cloud Firestore
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Reference to tasks collection
  CollectionReference get tasksCollection => _firestore.collection('tasks');

  /// Add a new task
  Future<void> addTask(String title, String userId) async {
    try {
      await tasksCollection.add({
        'title': title,
        'userId': userId,
        'completed': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw 'Error adding task: $e';
    }
  }

  /// Get tasks stream for a specific user
  Stream<QuerySnapshot> getTasks(String userId) {
    return tasksCollection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  /// Update task completion status
  Future<void> updateTaskStatus(String taskId, bool completed) async {
    try {
      await tasksCollection.doc(taskId).update({
        'completed': completed,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw 'Error updating task: $e';
    }
  }

  /// Delete a task
  Future<void> deleteTask(String taskId) async {
    try {
      await tasksCollection.doc(taskId).delete();
    } catch (e) {
      throw 'Error deleting task: $e';
    }
  }

  /// Get all tasks (for demo purposes - shows real-time sync across users)
  Stream<QuerySnapshot> getAllTasks() {
    return tasksCollection
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots();
  }
}
