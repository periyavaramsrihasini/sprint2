import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:io';
// ignore: unused_import
import 'package:firebase_storage/firebase_storage.dart';
import '../services/firebase_auth_service.dart';
import '../services/firebase_storage_service.dart';

/// Storage Demo Screen (Optional Feature)
/// Demonstrates file upload/download with Firebase Storage
///
/// Note: This is an example implementation. To use:
/// 1. Add image_picker package to pubspec.yaml
/// 2. Configure platform permissions for camera/gallery
/// 3. Import this screen in your app
class StorageDemoScreen extends StatefulWidget {
  const StorageDemoScreen({super.key});

  @override
  State<StorageDemoScreen> createState() => _StorageDemoScreenState();
}

class _StorageDemoScreenState extends State<StorageDemoScreen> {
  // ignore: unused_field
  final _authService = FirebaseAuthService();
  // ignore: unused_field
  final _storageService = FirebaseStorageService();
  String? _uploadedFileUrl;
  final bool _isUploading = false;
  final double _uploadProgress = 0.0;

  // Example: Upload file method
  // To make this work, add image_picker package:
  // dependencies:
  //   image_picker: ^1.0.0
  // ignore: unused_element
  Future<void> _uploadFile() async {
    // This is pseudocode - requires image_picker package
    /*
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile == null) return;
    
    final file = File(pickedFile.path);
    final userId = _authService.currentUser?.uid ?? '';
    final fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    
    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
    });

    try {
      // Method 1: Simple upload
      final downloadUrl = await _storageService.uploadFile(
        file,
        userId,
        fileName,
      );
      
      setState(() {
        _uploadedFileUrl = downloadUrl;
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File uploaded successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      setState(() => _isUploading = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Upload failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
    */
  }

  // Example: Upload with progress tracking
  // ignore: unused_element
  Future<void> _uploadFileWithProgress() async {
    // This is pseudocode - requires image_picker package
    /*
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile == null) return;
    
    final file = File(pickedFile.path);
    final userId = _authService.currentUser?.uid ?? '';
    final fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    
    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
    });

    try {
      // Method 2: Upload with progress tracking
      final uploadTask = _storageService.uploadFileWithProgress(
        file,
        userId,
        fileName,
      );
      
      // Listen to upload progress
      uploadTask.snapshotEvents.listen((snapshot) {
        final progress = snapshot.bytesTransferred / snapshot.totalBytes;
        setState(() => _uploadProgress = progress);
      });
      
      // Wait for upload to complete
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      
      setState(() {
        _uploadedFileUrl = downloadUrl;
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File uploaded successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      setState(() => _isUploading = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Upload failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Storage Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.cloud_upload, size: 100, color: Colors.blue),
            const SizedBox(height: 32),
            const Text(
              'Firebase Storage Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'This is a template for file upload functionality.\n\n'
              'To enable:\n'
              '1. Add image_picker to pubspec.yaml\n'
              '2. Configure platform permissions\n'
              '3. Uncomment upload methods above',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            if (_isUploading) ...[
              LinearProgressIndicator(value: _uploadProgress),
              const SizedBox(height: 8),
              Text(
                '${(_uploadProgress * 100).toStringAsFixed(0)}%',
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: null, // Enable after adding image_picker
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload Image'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 16),
            if (_uploadedFileUrl != null) ...[
              const Text(
                'Uploaded Image:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Image.network(_uploadedFileUrl!, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 8),
              Text(
                _uploadedFileUrl!,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ========================================
// USAGE EXAMPLES (Code Reference)
// ========================================

/// Example 1: Simple File Upload
/// 
/// ```dart
/// final file = File('/path/to/image.jpg');
/// final userId = FirebaseAuth.instance.currentUser!.uid;
/// final fileName = 'profile_pic.jpg';
/// 
/// final url = await FirebaseStorageService().uploadFile(
///   file,
///   userId,
///   fileName,
/// );
/// 
/// print('Download URL: $url');
/// ```

/// Example 2: Upload with Progress
/// 
/// ```dart
/// final uploadTask = FirebaseStorageService().uploadFileWithProgress(
///   file,
///   userId,
///   fileName,
/// );
/// 
/// uploadTask.snapshotEvents.listen((snapshot) {
///   double progress = snapshot.bytesTransferred / snapshot.totalBytes;
///   print('Progress: ${(progress * 100).toStringAsFixed(2)}%');
/// });
/// 
/// final snapshot = await uploadTask;
/// final url = await snapshot.ref.getDownloadURL();
/// ```

/// Example 3: Delete File
/// 
/// ```dart
/// final fileUrl = 'https://firebasestorage.googleapis.com/...';
/// await FirebaseStorageService().deleteFile(fileUrl);
/// ```

/// Example 4: List User Files
/// 
/// ```dart
/// final userId = FirebaseAuth.instance.currentUser!.uid;
/// final urls = await FirebaseStorageService().listFiles('uploads/$userId');
/// 
/// for (var url in urls) {
///   print('File URL: $url');
/// }
/// ```

/// Example 5: Download URL from Path
/// 
/// ```dart
/// final path = 'uploads/user123/image.jpg';
/// final url = await FirebaseStorageService().getDownloadUrl(path);
/// 
/// // Use URL to display image
/// Image.network(url);
/// ```

// ========================================
// INTEGRATION GUIDE
// ========================================

/// To integrate file upload in your app:
/// 
/// 1. Add dependencies to pubspec.yaml:
/// ```yaml
/// dependencies:
///   image_picker: ^1.0.0
///   permission_handler: ^11.0.0  # Optional, for permissions
/// ```
/// 
/// 2. Configure platform permissions:
/// 
/// Android (android/app/src/main/AndroidManifest.xml):
/// ```xml
/// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
/// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
/// <uses-permission android:name="android.permission.CAMERA"/>
/// ```
/// 
/// iOS (ios/Runner/Info.plist):
/// ```xml
/// <key>NSPhotoLibraryUsageDescription</key>
/// <string>We need access to your photo library to upload images</string>
/// <key>NSCameraUsageDescription</key>
/// <string>We need access to your camera to take photos</string>
/// ```
/// 
/// 3. Use ImagePicker in your widget:
/// ```dart
/// import 'package:image_picker/image_picker.dart';
/// 
/// final picker = ImagePicker();
/// final XFile? image = await picker.pickImage(
///   source: ImageSource.gallery,
///   imageQuality: 80,
/// );
/// 
/// if (image != null) {
///   final file = File(image.path);
///   // Upload using FirebaseStorageService
/// }
/// ```
