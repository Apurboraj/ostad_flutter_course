// Define the Event class
import 'dart:async';

class Event {
  final int id;
  final String name;
  final DateTime date;
  final String location;
  final Set<String> participants;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    Set<String>? participants,
  }) : participants = participants ?? {};

  @override
  String toString() {
    return 'Event: $name (ID: $id)\nDate: ${date.toLocal()}\nLocation: $location\nParticipants: ${participants.join(", ")}';
  }
}

// Define the EventManager class
class EventManager {
  final List<Event> _events = [];

  void createEvent(Event event) {
    _events.add(event);
    print('Event created: ${event.name}');
  }

  void addParticipant(int eventId, String participant) {
    final event = _events.firstWhere(
          (e) => e.id == eventId,
      orElse: () => throw Exception('Event with ID $eventId not found.'),
    );

    if (event.participants.add(participant)) {
      print('Added participant "$participant" to event "${event.name}".');
    } else {
      print('Participant "$participant" is already registered for the event "${event.name}".');
    }
  }

  void listUpcomingEvents() {
    final now = DateTime.now();
    final upcomingEvents = _events.where((e) => e.date.isAfter(now)).toList();

    if (upcomingEvents.isEmpty) {
      print('No upcoming events.');
      return;
    }

    print('Upcoming Events:');
    for (var event in upcomingEvents) {
      print(event);
    }
  }

  Future<void> sendNotifications(int eventId) async {
    final event = _events.firstWhere(
          (e) => e.id == eventId,
      orElse: () => throw Exception('Event with ID $eventId not found.'),
    );

    print('Sending notifications for event: ${event.name}...');
    await Future.delayed(Duration(seconds: 2)); // Simulate notification delay
    for (var participant in event.participants) {
      print('Notification sent to $participant for event "${event.name}".');
    }
  }
}

void main() async {
  final eventManager = EventManager();

  // Create events
  eventManager.createEvent(Event(
    id: 1,
    name: 'Tech Conference',
    date: DateTime.now().add(Duration(days: 10)),
    location: 'Convention Center',
  ));
  eventManager.createEvent(Event(
    id: 2,
    name: 'Music Festival',
    date: DateTime.now().add(Duration(days: 5)),
    location: 'City Park',
  ));
  eventManager.createEvent(Event(
    id: 3,
    name: 'Past Event',
    date: DateTime.now().subtract(Duration(days: 2)),
    location: 'Old Venue',
  ));

  // Add participants
  eventManager.addParticipant(1, 'Alice');
  eventManager.addParticipant(1, 'Bob');
  eventManager.addParticipant(1, 'Alice'); // Duplicate participant

  // List upcoming events
  eventManager.listUpcomingEvents();

  // Send notifications for a specific event
  await eventManager.sendNotifications(1);
}