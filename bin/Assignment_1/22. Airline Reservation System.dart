import 'dart:async';

class Flight {
  int id;
  String destination;
  DateTime departureTime;
  int availableSeats;

  Flight(this.id, this.destination, this.departureTime, this.availableSeats);
}

class Reservation {
  Map<int, List<String>> reservations = {};

  void bookFlight(int userId, Flight flight) {
    if (flight.availableSeats > 0) {
      flight.availableSeats--;
      if (reservations.containsKey(userId)) {
        reservations[userId]!.add(flight.destination);
      } else {
        reservations[userId] = [flight.destination];
      }
      print('Flight booked to ${flight.destination}.');
    } else {
      throw Exception('No available seats for flight to ${flight.destination}.');
    }
  }

  void displayReservationDetails(int userId) {
    if (reservations.containsKey(userId)) {
      print('Reservation details for user $userId:');
      reservations[userId]!.forEach((destination) {
        print('Flight to: $destination');
      });
    } else {
      throw Exception('No reservations found for user $userId.');
    }
  }
}

Future<void> fetchFlightData() async {
  print('Fetching flight data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate fetching data
  print('Flight data fetched.');
}

void main() async {
  try {
    Flight flight1 = Flight(1, 'New York', DateTime(2025, 6, 15, 10, 0), 5);
    Flight flight2 = Flight(2, 'Los Angeles', DateTime(2025, 7, 20, 15, 0), 3);

    Reservation reservation = Reservation();

    await fetchFlightData();

    reservation.bookFlight(1, flight1);
    reservation.bookFlight(1, flight2);

    reservation.displayReservationDetails(1);
  } catch (e) {
    print('Error: $e');
  }
}
