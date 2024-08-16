import 'package:flutter/material.dart';

class OnboardingPage3 extends StatefulWidget {
  final VoidCallback onNext; // Add a callback for navigation

  OnboardingPage3({required this.onNext});

  @override
  _OnboardingPage3State createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  final TextEditingController religionController = TextEditingController();
  final TextEditingController dreamPlaceController = TextEditingController();
  DateTime dob = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Religion'),
          TextFormField(controller: religionController),
          SizedBox(height: 16.0),
          Text('Date of Birth'),
          TextButton(
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: dob,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                setState(() {
                  dob = selectedDate;
                });
              }
            },
            child: Text(dob.toLocal().toString().split(' ')[0]),
          ),
          SizedBox(height: 16.0),
          Text('Dream Place to Visit'),
          TextFormField(controller: dreamPlaceController),
          ElevatedButton(
            onPressed: widget.onNext, // Use the onNext callback for navigation
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
