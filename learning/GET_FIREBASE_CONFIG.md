# 🔥 Get Your Firebase Configuration

## You need to replace the dummy values in `firebase_options.dart`

### Method 1: Using FlutterFire CLI (EASIEST - Automated) ⭐

This will automatically generate the correct `firebase_options.dart` with all your real values:

```bash
# 1. Install FlutterFire CLI
dart pub global activate flutterfire_cli

# 2. Navigate to your project
cd C:\Users\hasin\OneDrive\Desktop\Sprint-2\concept1\learning

# 3. Run configuration (this will replace the dummy firebase_options.dart)
flutterfire configure

# 4. Select your Firebase project
# 5. Select platforms: Android, iOS, Web
# 6. Done! Your firebase_options.dart will be updated with real values
```

---

### Method 2: Manual Configuration (If FlutterFire CLI doesn't work)

#### Step 1: Get Web Configuration

1. Go to **Firebase Console**: https://console.firebase.google.com/
2. Select your project
3. Click the **gear icon** ⚙️ → **"Project settings"**
4. Scroll to **"Your apps"** section
5. If you don't have a web app, click **"</>"** (Web icon) to add one:
   - App nickname: `learning-web`
   - Click **"Register app"**
6. Copy the configuration values shown:

```javascript
const firebaseConfig = {
  apiKey: "AIzaSy...",  // Copy this
  authDomain: "your-app.firebaseapp.com",  // Copy this
  projectId: "your-project-id",  // Copy this
  storageBucket: "your-app.appspot.com",  // Copy this
  messagingSenderId: "123456789",  // Copy this
  appId: "1:123:web:abc123"  // Copy this
};
```

#### Step 2: Get Android Configuration

Your Android configuration is already in `google-services.json`. To get the values:

1. Open: `android/app/google-services.json`
2. Find these values:
   - `project_id`
   - `mobilesdk_app_id` (under client[0].client_info)
   - `api_key` (under client[0].api_key[0].current_key)
   - `storage_bucket`

#### Step 3: Update `lib/firebase_options.dart`

Replace the dummy values:

```dart
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'YOUR_WEB_API_KEY_HERE',  // From Firebase Console
  appId: 'YOUR_WEB_APP_ID_HERE',
  messagingSenderId: 'YOUR_SENDER_ID_HERE',
  projectId: 'YOUR_PROJECT_ID_HERE',
  authDomain: 'YOUR_PROJECT_ID.firebaseapp.com',
  storageBucket: 'YOUR_PROJECT_ID.appspot.com',
);

static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ANDROID_API_KEY',  // From google-services.json
  appId: 'YOUR_ANDROID_APP_ID',
  messagingSenderId: 'YOUR_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  storageBucket: 'YOUR_PROJECT_ID.appspot.com',
);
```

---

### Method 3: Quick Test Without Real Values (Development Only)

If you just want to test the UI without Firebase functionality:

1. Keep the dummy values in `firebase_options.dart`
2. The app will load but Firebase features won't work
3. You'll see errors when trying to sign up/sign in

---

## ✅ After Configuration

### Enable Firebase Services:

1. **Authentication**:
   - Firebase Console → Authentication
   - Click "Get started"
   - Sign-in method → Enable "Email/Password"

2. **Firestore**:
   - Firebase Console → Firestore Database
   - Click "Create database"
   - Select "Start in test mode"
   - Choose location → Enable

3. **Storage** (Optional):
   - Firebase Console → Storage
   - Click "Get started"
   - Start in test mode → Done

---

## 🚀 Run the App

After updating `firebase_options.dart` with real values:

```bash
# Web
flutter run -d chrome

# Android (if you have emulator)
flutter run

# Hot reload after changes
r
```

---

## 🎯 Recommended: Use FlutterFire CLI

It's the fastest and most reliable way:

```bash
dart pub global activate flutterfire_cli
cd learning
flutterfire configure
```

This will:
- ✅ Detect your Firebase project
- ✅ Generate correct configuration
- ✅ Support all platforms
- ✅ Update automatically

---

## 📝 Quick Checklist

- [ ] Firebase project created
- [ ] Web app added to Firebase project
- [ ] `firebase_options.dart` updated with real values
- [ ] Authentication enabled (Email/Password)
- [ ] Firestore database created (test mode)
- [ ] Run: `flutter run -d chrome`

---

**Use FlutterFire CLI for the easiest setup!** 🚀
