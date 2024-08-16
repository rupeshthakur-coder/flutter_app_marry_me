import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_marry/dash_board/features/user_data/model/user_model.dart';

class OnboardingPage4 extends StatelessWidget {
  final VoidCallback onFinish; // Add a callback for finishing onboarding

  OnboardingPage4({required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Review and Submit'),
          // Display collected data here
          ElevatedButton(
            onPressed: () {
              // Trigger data saving function
              saveUserData();
              onFinish(); // Call the onFinish callback to end onboarding
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void saveUserData() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final email = FirebaseAuth.instance.currentUser?.email;

    if (uid != null && email != null) {
      final personalData = PersonalData(
        temporaryAddress: 'Example Temp Address',
        permanentAddress: 'Example Perm Address',
        job: 'Example Job',
        expertise: ['Example Expertise'],
        religion: 'Example Religion',
        dob: DateTime.now(),
        dreamPlaceToVisit: 'Example Place',
      );

      final userData = UserData(
        uid: uid,
        email: email,
        personalData: personalData,
        userFiles: UserFiles(
          type: 'image',
          url: 'https://firebase.storage/...',
          metadata: Metadata(
            uploadedAt: '2024-08-16T12:34:56Z',
            fileSize: 1024,
          ),
        ),
        socialGraph: SocialGraph(
          mutualFriendsCount: 10,
          socialNetworkInfluence: SocialNetworkInfluence(influenceScore: 85),
        ),
        compatibilityScores: CompatibilityScores(
          userScores: {'userId2': 78},
        ),
        feedbackData: FeedbackData(
          likesGiven: ['userId3', 'userId4'],
          surveyResponses: {
            'question1': 'answer1',
            'question2': 'answer2',
          },
        ),
      );

      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userData.toJson())
          .then((_) {
        print('Data saved successfully');
      });
    }
  }
}
