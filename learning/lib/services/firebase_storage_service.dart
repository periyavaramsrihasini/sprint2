import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

/// Firebase Storage Service
/// Handles file uploads and downloads from Firebase Storage
class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Upload a file to Firebase Storage
  /// Returns the download URL of the uploaded file
  Future<String> uploadFile(File file, String userId, String fileName) async {
    try {
      // Create a reference to the file location
      final storageRef = _storage.ref().child('uploads/$userId/$fileName');

      // Upload the file
      final uploadTask = await storageRef.putFile(file);

      // Get the download URL
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw 'Error uploading file: $e';
    }
  }

  /// Upload a file with progress tracking
  UploadTask uploadFileWithProgress(File file, String userId, String fileName) {
    final storageRef = _storage.ref().child('uploads/$userId/$fileName');
    return storageRef.putFile(file);
  }

  /// Delete a file from Firebase Storage
  Future<void> deleteFile(String fileUrl) async {
    try {
      final storageRef = _storage.refFromURL(fileUrl);
      await storageRef.delete();
    } catch (e) {
      throw 'Error deleting file: $e';
    }
  }

  /// Get download URL for a file
  Future<String> getDownloadUrl(String path) async {
    try {
      final storageRef = _storage.ref().child(path);
      return await storageRef.getDownloadURL();
    } catch (e) {
      throw 'Error getting download URL: $e';
    }
  }

  /// List all files in a directory
  Future<List<String>> listFiles(String path) async {
    try {
      final storageRef = _storage.ref().child(path);
      final listResult = await storageRef.listAll();

      List<String> urls = [];
      for (var item in listResult.items) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }

      return urls;
    } catch (e) {
      throw 'Error listing files: $e';
    }
  }
}
