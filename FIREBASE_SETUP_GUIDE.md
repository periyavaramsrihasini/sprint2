# Firebase Setup Guide

## Complete Step-by-Step Setup Instructions

### Part 1: Firebase Console Setup

#### 1. Create Firebase Project
1. Visit [Firebase Console](https://console.firebase.google.com/)
2. Click **"Add project"**
3. Enter project name: `learning-app` (or your choice)
4. **Optional**: Enable Google Analytics
5. Click **"Create project"**

#### 2. Add Android App to Firebase
1. In Firebase Console, click **"Add app"** → Select **Android**
2. **Register app:**
   - Package name: `com.example.learning` 
   - App nickname: `Learning App`
   - Click **"Register app"**
3. **Download config file:**
   - Download `google-services.json`
   - Move it to: `android/app/google-services.json` ✅ (Already in place)

#### 3. Enable Firebase Authentication
1. In Firebase Console → **Authentication**
2. Click **"Get started"**
3. Go to **"Sign-in method"** tab
4. Enable **"Email/Password"**
5. Click **"Save"**

#### 4. Create Cloud Firestore Database
1. In Firebase Console → **Firestore Database**
2. Click **"Create database"**
3. Select **"Start in test mode"** (for development)
4. Choose a location (e.g., `us-central`)
5. Click **"Enable"**

**Important**: Test mode allows all reads/writes. Update security rules for production!

#### 5. Enable Firebase Storage
1. In Firebase Console → **Storage**
2. Click **"Get started"**
3. Select **"Start in test mode"**
4. Click **"Done"**

---

### Part 2: Flutter Project Configuration

#### 1. Verify Dependencies (Already Added ✅)
Check `pubspec.yaml`:
```yaml
dependencies:
  firebase_core: ^3.0.0
  cloud_firestore: ^5.0.0
  firebase_auth: ^5.0.0
  firebase_storage: ^12.0.0
```

#### 2. Install Dependencies
```bash
cd learning
flutter pub get
```

#### 3. Android Configuration
Edit `android/build.gradle.kts`:
```kotlin
buildscript {
    dependencies {
        classpath("com.google.gms:google-services:4.4.0")
    }
}
```

Edit `android/app/build.gradle.kts`:
```kotlin
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")  // Add this line
}

android {
    compileSdk = 34  // Ensure this is 33 or higher
    
    defaultConfig {
        minSdk = 21  // Firebase requires minimum SDK 21
        targetSdk = 34
    }
}
```

#### 4. Update AndroidManifest.xml
Edit `android/app/src/main/AndroidManifest.xml`:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    
    <application
        android:label="learning"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <!-- Your activity configuration -->
    </application>
</manifest>
```

---

### Part 3: iOS Configuration (Optional)

#### 1. Download iOS Config File
1. In Firebase Console → Project settings
2. Add iOS app
3. Download `GoogleService-Info.plist`
4. Add to `ios/Runner/` using Xcode

#### 2. Update Podfile
Edit `ios/Podfile`:
```ruby
platform :ios, '13.0'  # Firebase requires iOS 13+
```

---

### Part 4: Test Firebase Connection

#### 1. Run the App
```bash
flutter run
```

#### 2. Test Authentication
1. Click **"Sign Up"**
2. Enter email: `test@example.com`
3. Enter password: `password123`
4. Click **"Sign Up"**
5. Check Firebase Console → Authentication → Users

#### 3. Test Firestore
1. After signing in, add a task
2. Check Firebase Console → Firestore Database → tasks collection
3. You should see your task appear in real-time!

#### 4. Test Real-Time Sync (Two Devices)
1. Run on two emulators:
   ```bash
   flutter run -d emulator-5554
   flutter run -d emulator-5556
   ```
2. Sign in with different accounts
3. Add task on Device 1
4. Watch it appear on Device 2 instantly! ⚡

---

### Part 5: Firestore Security Rules (Production)

Before deploying, update Firestore rules in Firebase Console:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Tasks collection
    match /tasks/{taskId} {
      // Users can only read/write their own tasks
      allow read, write: if request.auth != null 
                         && request.auth.uid == resource.data.userId;
    }
  }
}
```

---

### Part 6: Firebase Storage Rules (Production)

Update Storage rules in Firebase Console:

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /uploads/{userId}/{allPaths=**} {
      // Users can only access their own files
      allow read, write: if request.auth != null 
                         && request.auth.uid == userId;
    }
  }
}
```

---

## Troubleshooting Common Issues

### Issue 1: "FirebaseOptions cannot be null"
**Solution**: Ensure `google-services.json` is in `android/app/` and run:
```bash
flutter clean
flutter pub get
flutter run
```

### Issue 2: "Gradle build failed"
**Solution**: 
1. Check `android/build.gradle.kts` has Google services plugin
2. Ensure `compileSdk >= 33` in `android/app/build.gradle.kts`
3. Run:
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter run
   ```

### Issue 3: "MissingPluginException"
**Solution**:
```bash
flutter clean
flutter pub get
cd android
./gradlew clean
cd ..
flutter run
```

### Issue 4: Authentication fails silently
**Solution**: 
- Check Firebase Console → Authentication is enabled
- Verify Email/Password provider is enabled
- Check device has internet connection

### Issue 5: Firestore permission denied
**Solution**: 
- Ensure Firestore is in "test mode" during development
- Check security rules allow authenticated users
- Verify user is signed in before Firestore operations

---

## Verification Checklist

- [ ] Firebase project created
- [ ] `google-services.json` in `android/app/`
- [ ] Firebase Authentication enabled (Email/Password)
- [ ] Firestore Database created (test mode)
- [ ] Firebase Storage enabled
- [ ] Dependencies installed (`flutter pub get`)
- [ ] Android `build.gradle.kts` updated with Google services plugin
- [ ] App runs without errors
- [ ] Can sign up new user
- [ ] Can sign in existing user
- [ ] Can add tasks
- [ ] Tasks appear in Firestore Console
- [ ] Real-time sync works between devices

---

## Next Steps

1. ✅ Complete Firebase setup
2. ✅ Test all features
3. 📝 Document your experience in README
4. 🎥 Record 3-5 minute video demonstration
5. 🚀 Deploy to production with proper security rules

---

## Additional Commands

### Check for outdated packages
```bash
flutter pub outdated
```

### Upgrade to latest compatible versions
```bash
flutter pub upgrade
```

### View Flutter doctor diagnostics
```bash
flutter doctor -v
```

### Clean build cache
```bash
flutter clean
flutter pub get
```

---

**Happy Coding! 🚀**
