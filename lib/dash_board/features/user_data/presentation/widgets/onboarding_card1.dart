import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingPage1({required this.onNext});

  final TextEditingController tempAddressController = TextEditingController();
  final TextEditingController permAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Temporary Address'),
              TextFormField(controller: tempAddressController),
              SizedBox(height: 16.0),
              Text('Permanent Address'),
              TextFormField(controller: permAddressController),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: onNext,
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
