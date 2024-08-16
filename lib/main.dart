import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_marry/dash_board/features/auth/google_auth/sign_in_page.dart';

import 'package:flutter_ui_marry/dash_board/features/user_data/presentation/page/onbaring_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dash_board/features/home/presentation/pages/homepage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<bool>('isFirstTimeUser');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Box<bool> userBox;
  late bool _isFirstTimeUser;

  @override
  void initState() {
    super.initState();

    try {
      _isFirstTimeUser = true;
      userBox = Hive.box<bool>('isFirstTimeUser');

      checkOnboardingStatus();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void checkOnboardingStatus() {
    try {
      bool isFirstTimeUser = userBox.get('isFirstTimeUser', defaultValue: true)!;
      setState(() {
        _isFirstTimeUser = isFirstTimeUser;
      });
    } catch (e) {
      debugPrint('Error checking onboarding status: $e');
    }
  }

  void completeOnboarding() {
    try {
      userBox.put('isFirstTimeUser', false);
      setState(() {
        _isFirstTimeUser = false;
      });
    } catch (e) {
      debugPrint('Error completing onboarding: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Marry Me',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // Define the routes here
            routes: {
              '/home': (context) => HomePage(), // Ensure HomePage is defined
              '/signIn': (context) => SignInPage(),
              '/onboarding': (context) => OnboardingFlow(), // Register the OnboardingFlow route
            },
            // Set the initial route depending on user onboarding status
            home: _isFirstTimeUser ? OnboardingFlow(completeOnboarding: completeOnboarding) : SignInPage());
      },
    );
  }
}
