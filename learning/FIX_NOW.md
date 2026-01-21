# ⚠️ QUICK FIX NEEDED

## Step 1: Enable Windows Developer Mode (REQUIRED)

Run this command in PowerShell:
```powershell
start ms-settings:developers
```

Then:
1. Windows Settings will open
2. Click **"Developer Mode"** toggle to **ON**
3. Close settings

---

## Step 2: Install FlutterFire CLI & Configure

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Navigate to project
cd C:\Users\hasin\OneDrive\Desktop\Sprint-2\concept1\learning

# Configure Firebase (MOST IMPORTANT STEP!)
flutterfire configure
```

When prompted:
1. **Login to Firebase** (if asked)
2. **Select your Firebase project** from the list
3. **Select platforms**: Choose Android, iOS, Web (use space to select, enter to confirm)
4. Wait for it to generate `firebase_options.dart` with real values
5. Done!

---

## Step 3: Run the App

```bash
flutter run -d chrome
```

---

## Alternative: Manual Firebase Config (If FlutterFire CLI fails)

### Get Your Web Config:
1. Go to: https://console.firebase.google.com/
2. Select your project
3. Click ⚙️ → Project settings
4. Scroll to "Your apps" → Click "</>" to add web app
5. Copy the config values

### Update `lib/firebase_options.dart`:
Replace the dummy values in the `web` section with your real values from Firebase Console.

---

## ✅ After Configuration

### Enable Firebase Services:
1. **Firebase Console** → **Authentication** → Enable Email/Password
2. **Firebase Console** → **Firestore Database** → Create database (test mode)

### Run:
```bash
flutter run -d chrome
```

---

**Start with Step 1 (Enable Developer Mode), then run flutterfire configure!** 🚀
