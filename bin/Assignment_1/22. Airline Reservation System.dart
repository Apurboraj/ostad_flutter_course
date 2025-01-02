// Define the Flight class
class Flight {
  final int id;
  final String destination;
  final DateTime departureTime;
  int availableSeats;

  Flight({
    required this.id,
    required this.destination,
    required this.departureTime,
    required this.availableSeats,
  });

  @override
  String toString() => 'Flight(ID: $id, Destination: $destination, Departure: $departureTime, Available Seats: $availableSeats)';
}

// Define the Reservation class
class Reservation {
  final int reservationId;
  final int flightId;
  final String passengerName;

  Reservation({
    required this.reservationId,
    required this.flightId,
    required this.passengerName,
  });

  @override
  String toString() => 'Reservation(ID: $reservationId, Flight ID: $flightId, Passenger: $passengerName)';
}

// Define the AirlineReservationSystem class
class AirlineReservationSystem {
  final List<Flight> _flights = [];
  final Map<int, Reservation> _reservations = {};
  int _nextReservationId = 1;

  Future<void> fetchFlights() async {
    print('Fetching flight data...');
    await Future.delayed(Duration(seconds: 2)); // Simulate API delay

    _flights.addAll([
      Flight(id: 1, destination: 'New York', departureTime: DateTime.now().add(Duration(hours: 5)), availableSeats: 50),
      Flight(id: 2, destination: 'London', departureTime: DateTime.now().add(Duration(hours: 10)), availableSeats: 30),
      Flight(id: 3, destination: 'Tokyo', departureTime: DateTime.now().add(Duration(hours: 15)), availableSeats: 20),
    ]);

    print('Flights fetched successfully.');
    listFlights();
  }

  void listFlights() {
    if (_flights.isEmpty) {
      print('No flights available.');
    } else {
      print('Available Flights:');
      for (var flight in _flights) {
        print(flight);
      }
    }
  }

  void bookFlight(int flightId, String passengerName) {
    try {
      final flight = _getFlight(flightId);

      if (flight.availableSeats <= 0) {
        throw Exception('No seats available on Flight ID $flightId.');
      }

      flight.availableSeats--;
      final reservation = Reservation(
        reservationId: _nextReservationId++,
        flightId: flight.id,
        passengerName: passengerName,
      );
      _reservations[reservation.reservationId] = reservation;

      print('Reservation successful: $reservation');
    } catch (e) {
      print('Error: $e');
    }
  }

  void displayReservation(int reservationId) {
    try {
      final reservation = _reservations[reservationId];
      if (reservation == null) {
        throw Exception('Reservation ID $reservationId not found.');
      }
      print('Reservation Details: $reservation');
    } catch (e) {
      print('Error: $e');
    }
  }

  Flight _getFlight(int flightId) {
    final flight = _flights.firstWhere(
          (flight) => flight.id == flightId,
      orElse: () => throw Exception('Flight ID $flightId not found.'),
    );
    return flight;
  }
}

void main() async {
  final airlineSystem = AirlineReservationSystem();

  // Fetch flights
  await airlineSystem.fetchFlights();

  // Book a flight
  airlineSystem.bookFlight(1, 'Alice');
  airlineSystem.bookFlight(2, 'Bob');

  // Display a reservation
  airlineSystem.displayReservation(1);

  // List flights again to see updated seat availability
  airlineSystem.listFlights();
}
