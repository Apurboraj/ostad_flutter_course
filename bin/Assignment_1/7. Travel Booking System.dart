import 'dart:async';

class Trip {
  String destination;
  double price;
  int availableSeats;
  DateTime departureDate;

  Trip(
      {required this.destination,
        required this.price,
        required this.availableSeats,
        required this.departureDate});
}

class Booking {
  Map<String, List<Trip>> _userBookings = {};

  Future<void> bookTrip(String userId, Trip trip) async {
    // Simulate fetching trip data from a database
    await Future.delayed(Duration(seconds: 1));

    if (trip.availableSeats > 0) {
      if (_userBookings.containsKey(userId)) {
        _userBookings[userId]!.add(trip);
      } else {
        _userBookings[userId] = [trip];
      }
      trip.availableSeats--;
      print('Trip booked successfully!');
    } else {
      print('Trip is fully booked.');
    }
  }

  Future<void> cancelTrip(String userId, Trip trip) async {
    // Simulate updating database
    await Future.delayed(Duration(seconds: 1));

    if (_userBookings.containsKey(userId) &&
        _userBookings[userId]!.contains(trip)) {
      _userBookings[userId]!.remove(trip);
      trip.availableSeats++;
      print('Trip canceled successfully!');
    } else {
      print('No such booking found.');
    }
  }

  void displayTripDetails(String userId) {
    if (_userBookings.containsKey(userId)) {
      print('Your booked trips:');
      for (var trip in _userBookings[userId]!) {
        print(
            'Destination: ${trip.destination}, Price: \$${trip.price}, Departure Date: ${trip.departureDate}');
      }
    } else {
      print('You have no booked trips.');
    }
  }
}

void main() async {
  // Sample trips
  List<Trip> trips = [
    Trip(
        destination: 'New York',
        price: 500.0,
        availableSeats: 5,
        departureDate: DateTime(2024, 12, 31)),
    Trip(
        destination: 'Paris',
        price: 800.0,
        availableSeats: 3,
        departureDate: DateTime(2025, 01, 15)),
    Trip(
        destination: 'Tokyo',
        price: 1200.0,
        availableSeats: 2,
        departureDate: DateTime(2025, 02, 20)),
  ];

  Booking bookingSystem = Booking();

  // Book a trip
  await bookingSystem.bookTrip('user1', trips[0]);

  // Cancel a trip
  await bookingSystem.cancelTrip('user1', trips[0]);

  // Display booked trips
  bookingSystem.displayTripDetails('user1');
}