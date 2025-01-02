import 'dart:async';

class Event {
  int id;
  String name;
  DateTime date;
  String location;
  Set<String> participants;

  Event(this.id, this.name, this.date, this.location) : participants = {};
}

class EventManager {
  List<Event> events = [];

  void createEvent(Event event) {
    events.add(event);
    print('Event "${event.name}" created.');
  }

  void addParticipant(int eventId, String participant) {
    Event event = events.firstWhere((event) => event.id == eventId, orElse: () => throw Exception('Event not found'));
    if (event.participants.contains(participant)) {
      throw Exception('Participant already added.');
    } else {
      event.participants.add(participant);
      print('Participant "$participant" added to event "${event.name}".');
    }
  }

  void listUpcomingEvents() {
    DateTime now = DateTime.now();
    events.where((event) => event.date.isAfter(now)).forEach((event) {
      print('Event: ${event.name}, Date: ${event.date}, Location: ${event.location}');
    });
  }
}

Future<void> sendNotification(String participant, String eventName) async {
  print('Sending notification to $participant about event $eventName...');
  await Future.delayed(Duration(seconds: 2)); // Simulate sending notification
  print('Notification sent to $participant.');
}

void main() async {
  try {
    EventManager eventManager = EventManager();

    Event event1 = Event(1, 'Tech Conference', DateTime(2025, 1, 15), 'Dhaka');
    Event event2 = Event(2, 'Music Festival', DateTime(2025, 2, 20), 'Gazipur');

    eventManager.createEvent(event1);
    eventManager.createEvent(event2);

    eventManager.addParticipant(1, 'Apurbo');
    eventManager.addParticipant(1, 'Arnob');

    await sendNotification('Apurbo', 'Tech Conference');
    await sendNotification('Arnob', 'Tech Conference');

    print('Upcoming Events:');
    eventManager.listUpcomingEvents();
  } catch (e) {
    print('Error: $e');
  }
}
