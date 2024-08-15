import 'package:firebase_database/firebase_database.dart';
import '../model/event/event_model.dart';

class FirebaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('events').child('FoodFasting');

  Future<EventModel> fetchEvent() async {
    final DataSnapshot snapshot = await _dbRef.get();
    if (snapshot.exists) {
      print('Raw data: ${snapshot.value}'); // This logs the raw data fetched from Firebase
      final Map<String, dynamic> eventsMap = Map<String, dynamic>.from(snapshot.value as Map);
      final eventModel = EventModel.fromJson(eventsMap);
      print('Parsed EventModel: $eventModel');
      return eventModel;
    } else {
      throw Exception("Event not found");
    }
  }

  Stream<EventModel> eventStream() {
    return _dbRef.onValue.map((event) {
      final data = event.snapshot.value as Map<Object?, Object?>?;
      if (data == null) {
        throw Exception("Event not found");
      }
      final Map<String, dynamic> eventsMap = Map<String, dynamic>.from(data);
      return EventModel.fromJson(eventsMap);
    });
  }
}
