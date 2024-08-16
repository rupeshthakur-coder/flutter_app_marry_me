import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_marry/dash_board/features/auth/google_auth/sign_in_page.dart';
import 'package:flutter_ui_marry/dash_board/features/home/presentation/pages/homepage.dart';
import 'package:flutter_ui_marry/dash_board/features/user_data/presentation/page/onbaring_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            '/onboarding': (context) =>
                OnboardingFlow(), // Register the OnboardingFlow route
          },
          // Set the initial route depending on user onboarding status
          home: FutureBuilder(
            future:
                _checkIfOnboardingCompleted(), // Method to check onboarding status
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                // If onboarding is completed, show sign-in page; otherwise, start onboarding
                return snapshot.data == true ? SignInPage() : OnboardingFlow();
              }
            },
          ),
        );
      },
    );
  }

  // This method checks whether the user has completed the onboarding process
  Future<bool> _checkIfOnboardingCompleted() async {
    // Implement logic to check if onboarding is completed
    // For example, check shared preferences or a Firestore flag
    // Returning false for now as an example
    return false;
  }
}
