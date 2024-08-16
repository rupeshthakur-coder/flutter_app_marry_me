import 'package:flutter/material.dart';
import 'package:flutter_ui_marry/dash_board/features/user_data/presentation/page/onbaring_screen.dart';

import 'auth_service.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _authService = AuthService();

  Future<void> _signInWithGoogle() async {
    try {
      await _authService.signInWithGoogle();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingFlow()),
      );
    } catch (e) {
      _showErrorDialog('Sign in failed: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with Google'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _signInWithGoogle,
          child: Text('Sign in with Google'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),
          ),
        ),
      ),
    );
  }
}
