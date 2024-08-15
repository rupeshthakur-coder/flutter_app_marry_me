import 'package:flutter/material.dart';
import '../model/event/event_model.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    // Log the entire event model
    debugPrint('EventModel data: ${event.foodFasting?.f1}');

    // Access the first F1 object in the foodFasting map, if it exists
    F1? firstEvent = event.foodFasting?.f1?.values.first;

    debugPrint('title: ${firstEvent?.title}');

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  firstEvent?.title ?? 'No Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Handle view all tasks action
                  },
                  child: Text(
                    'View All Tasks',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '${firstEvent?.date}, ${firstEvent?.time ?? 'No Time'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              firstEvent?.venue ?? 'No Venue',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
