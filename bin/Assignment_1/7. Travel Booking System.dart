import 'dart:async';

class Trip {
  String destination;
  double price;
  int availableSeats;
  DateTime departureDate;

  Trip(this.destination, this.price, this.availableSeats, this.departureDate);
}

class Booking {
  Map<int, Trip> userBookings = {};

  void bookTrip(int userId, Trip trip) {
    if (trip.availableSeats > 0) {
      userBookings[userId] = trip;
      trip.availableSeats--;
      print('Booking successful for ${trip.destination}.');
    } else {
      throw Exception('No available seats for ${trip.destination}.');
    }
  }

  void cancelBooking(int userId) {
    if (userBookings.containsKey(userId)) {
      Trip trip = userBookings[userId]!;
      trip.availableSeats++;
      userBookings.remove(userId);
      print('Booking canceled for ${trip.destination}.');
    } else {
      throw Exception('No booking found for user ID: $userId.');
    }
  }

  void displayTripDetails(Trip trip) {
    print('Destination: ${trip.destination}');
    print('Price: \$${trip.price}');
    print('Available Seats: ${trip.availableSeats}');
    print('Departure Date: ${trip.departureDate}');
  }
}

Future<void> fetchTripData() async {
  print('Fetching trip data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate fetching data
  print('Trip data fetched.');
}

Future<void> validateBooking(Booking booking, int userId, Trip trip) async {
  print('Validating booking...');
  await Future.delayed(Duration(seconds: 2)); // Simulate validation
  booking.bookTrip(userId, trip);
}

void main() async {
  try {
    Trip trip1 = Trip('Paris', 1000.0, 5, DateTime(2025, 6, 15));
    Trip trip2 = Trip('Tokyo', 1500.0, 3, DateTime(2025, 7, 20));

    Booking booking = Booking();

    await fetchTripData();

    await validateBooking(booking, 1, trip1);
    await validateBooking(booking, 2, trip2);

    booking.displayTripDetails(trip1);
    booking.displayTripDetails(trip2);

    booking.cancelBooking(1);
    booking.displayTripDetails(trip1);
  } catch (e) {
    print('Error: $e');
  }
}
