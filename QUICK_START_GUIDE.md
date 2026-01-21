# Quick Start Guide

## How to Use the Firebase Learning App

### 🚀 First Time Setup

1. **Ensure Firebase is configured** (see FIREBASE_SETUP_GUIDE.md)
2. **Run the app**:
   ```bash
   cd learning
   flutter run
   ```

---

## 📱 Using the App

### Step 1: Sign Up
1. App opens to **Sign Up/Sign In** screen
2. Enter your email (e.g., `test@example.com`)
3. Enter password (minimum 6 characters)
4. Tap **"Sign Up"**
5. ✅ Success! You're automatically signed in

### Step 2: Add Tasks
1. After signing in, you'll see the **Task List** screen
2. Type a task in the text field (e.g., "Learn Firebase")
3. Tap the **+ button** or press Enter
4. ✨ Task appears instantly!

### Step 3: Manage Tasks
- **Mark Complete**: Tap the checkbox next to a task
- **Delete**: Tap the red delete icon
- **Sign Out**: Tap the logout icon in the app bar

---

## 🔥 Testing Real-Time Sync

### Method 1: Two Emulators
```bash
# Terminal 1
flutter run -d emulator-5554

# Terminal 2
flutter run -d emulator-5556
```

1. Sign up with different accounts on each device
2. Add a task on Device 1
3. Watch it appear on Device 2 in real-time! ⚡

### Method 2: Firebase Console
1. Open [Firebase Console](https://console.firebase.google.com/)
2. Go to **Firestore Database** → **tasks** collection
3. Add a document manually:
   ```json
   {
     "title": "Task from Firebase",
     "userId": "your-user-id",
     "completed": false,
     "createdAt": (current timestamp)
   }
   ```
4. Watch it appear in your app instantly!

---

## 🎯 Features to Demonstrate

### 1. Authentication Flow
- ✅ Sign up with email/password
- ✅ Sign in with existing account
- ✅ Error handling (wrong password, invalid email, etc.)
- ✅ Session persistence (stays logged in after app restart)

### 2. Real-Time Database
- ✅ Add tasks instantly
- ✅ Update task status (complete/incomplete)
- ✅ Delete tasks
- ✅ Auto-sync across devices
- ✅ User-specific data (each user sees only their tasks)

### 3. Authentication State
- ✅ Automatic navigation based on login status
- ✅ Sign out returns to auth screen
- ✅ User email displayed on home screen

---

## 📊 Viewing Data in Firebase Console

### Check Authentication
1. Firebase Console → **Authentication** → **Users** tab
2. See all registered users with email and UID

### Check Firestore Data
1. Firebase Console → **Firestore Database**
2. Click on **tasks** collection
3. See all tasks with real-time updates

### Monitor Storage (Future Feature)
1. Firebase Console → **Storage**
2. Browse uploaded files by user

---

## 🐛 Common Issues & Solutions

### "No Firebase App has been created"
**Fix**: Ensure Firebase is initialized in main.dart
```dart
await Firebase.initializeApp();
```

### Tasks not appearing
**Fix**: 
1. Check internet connection
2. Verify Firestore is in test mode
3. Check userId matches in Firestore query

### Can't sign in
**Fix**:
1. Verify Authentication is enabled in Firebase Console
2. Check Email/Password provider is enabled
3. Ensure password is at least 6 characters

### Real-time sync not working
**Fix**:
1. Restart the app
2. Check Firebase Console shows correct data
3. Verify StreamBuilder is properly configured

---

## 🎥 Recording Your Demo Video

### What to Show (3-5 minutes)

1. **Introduction** (30 seconds)
   - Project overview
   - Firebase services used

2. **Firebase Setup** (1 minute)
   - Show Firebase Console
   - Point out Authentication, Firestore, Storage
   - Show security rules

3. **App Demonstration** (2 minutes)
   - Sign up process
   - Add tasks
   - Toggle task completion
   - Delete task
   - Sign out and sign in

4. **Real-Time Sync** (1 minute)
   - Show two devices side-by-side
   - Add task on one device
   - Show it appearing on the other
   - OR: Add from Firebase Console → appears in app

5. **Reflection** (30 seconds)
   - How Firebase simplified development
   - Benefits of real-time sync
   - Future enhancements

### Recording Tips
- Use screen recording software (OBS, QuickTime, etc.)
- Speak clearly and explain what you're doing
- Show both code and running app
- Keep it concise and focused

---

## 📝 Testing Checklist

Before recording your video, test these features:

- [ ] Sign up new user
- [ ] Sign in existing user
- [ ] Add multiple tasks
- [ ] Mark task as complete
- [ ] Unmark completed task
- [ ] Delete task
- [ ] Sign out
- [ ] Sign in again (verify session persistence)
- [ ] Test on two devices (real-time sync)
- [ ] Verify data in Firebase Console
- [ ] Test error cases (wrong password, weak password)

---

## 🚀 Next Steps

1. ✅ Complete setup and testing
2. 📝 Update README with your reflections
3. 🎥 Record demo video (3-5 minutes)
4. ☁️ Upload video to Google Drive
5. 🔗 Add link to README
6. 🎉 Submit your work!

---

## 💡 Pro Tips

1. **Test Early, Test Often**: Run the app after each feature addition
2. **Use Firebase Console**: Monitor data in real-time as you test
3. **Check Logs**: Use `flutter run -v` for detailed logs
4. **Clean Build**: If issues arise, run `flutter clean`
5. **Read Error Messages**: Firebase provides helpful error messages

---

## 📚 Code Reference

### Adding a Task
```dart
await firestoreService.addTask('Task title', userId);
```

### Updating Task Status
```dart
await firestoreService.updateTaskStatus(taskId, completed);
```

### Deleting a Task
```dart
await firestoreService.deleteTask(taskId);
```

### Sign Out
```dart
await authService.signOut();
```

---

**Happy Learning! 🎓**
