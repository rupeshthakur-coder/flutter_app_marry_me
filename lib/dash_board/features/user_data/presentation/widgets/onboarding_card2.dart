import 'package:flutter/material.dart';

class OnboardingPage2 extends StatefulWidget {
  final VoidCallback onNext; // Add a callback for navigation

  OnboardingPage2({required this.onNext});

  @override
  _OnboardingPage2State createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final TextEditingController jobController = TextEditingController();
  final TextEditingController expertiseController = TextEditingController();
  final List<String> expertise = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Job'),
          TextFormField(controller: jobController),
          SizedBox(height: 16.0),
          Text('Expertise'),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: expertiseController,
                  decoration: InputDecoration(labelText: 'Add Expertise'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (expertiseController.text.isNotEmpty) {
                    setState(() {
                      expertise.add(expertiseController.text);
                      expertiseController.clear();
                    });
                  }
                },
              ),
            ],
          ),
          Wrap(
            children: expertise.map((e) => Chip(label: Text(e))).toList(),
          ),
          ElevatedButton(
            onPressed: widget.onNext, // Use the onNext callback for navigation
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
