import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventService {
  static CollectionReference<EventModel> _getEventCollection() {
    CollectionReference<EventModel> collection = FirebaseFirestore.instance
        .collection("events")
        .withConverter<EventModel>(
          fromFirestore: (snapshots, options) =>
              EventModel.fromJson(snapshots.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
    return collection;
  }

  static Future<void> addEvent(EventModel event) async {
    try {
      CollectionReference<EventModel> collection = _getEventCollection();
      DocumentReference<EventModel> doc = collection.doc();
      event.id = doc.id;
      await doc.set(event);
    } on Exception catch (e) {
      print("Error in addEvent: $e");
      throw "Something went wrong";
    }
  }
    static Future<void> deleteEvent(EventModel event) async {
    try {
      CollectionReference<EventModel> collection = _getEventCollection();
    
      await collection.doc(event.id).delete();
    } on Exception catch (e) {
      print("Error in deleteEvent: $e");
      throw "Something went wrong";
    }
  }
  static Future<List<EventModel>?> getAllEvents() async {
    try {
      CollectionReference<EventModel> collection = _getEventCollection();
      QuerySnapshot<EventModel> snapshot = await collection.get();
      List<EventModel> events = snapshot.docs.map((e) => e.data()).toList();
      return events;
    } on Exception catch (e) {
      print("Error in display events: $e");
      throw "Something went wrong";
    }
  }
static Future<void> updateEvent(EventModel event) async {
  try {
    await _getEventCollection().doc(event.id).set(event);
  } on Exception catch (e) {
    print("Error in updateEvent: $e");
    throw "Something went wrong";
  }
}

  static Future updateFav(EventModel event) async {
    CollectionReference<EventModel> collection = _getEventCollection();
    DocumentReference<EventModel> doc = collection.doc(event.id);
    await doc.update(event.updateFav());
  }

  static Future getAllFav() async {
    CollectionReference<EventModel> collection = _getEventCollection();
    QuerySnapshot<EventModel> snapshot = await collection
        .where(
          "favorites",
          arrayContains: FirebaseAuth.instance.currentUser?.uid ?? '',
        )
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
