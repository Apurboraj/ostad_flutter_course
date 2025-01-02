class Movie {
  int id;
  String title;
  int availableSeats;
  DateTime showTime;

  Movie(this.id, this.title, this.availableSeats, this.showTime);
}

class Booking {
  Map<int, List<String>> userBookings = {};

  void bookTicket(int userId, Movie movie) {
    if (movie.availableSeats > 0) {
      movie.availableSeats--;
      if (userBookings.containsKey(userId)) {
        userBookings[userId]!.add(movie.title);
      } else {
        userBookings[userId] = [movie.title];
      }
      print('Ticket booked for ${movie.title}.');
    } else {
      throw Exception('No available seats for ${movie.title}.');
    }
  }

  void displayBookingDetails(int userId) {
    if (userBookings.containsKey(userId)) {
      print('Booking details for user $userId:');
      userBookings[userId]!.forEach((title) {
        print('Movie: $title');
      });
    } else {
      throw Exception('No bookings found for user $userId.');
    }
  }
}

void main() {
  try {
    Movie movie1 = Movie(1, 'Inception', 5, DateTime(2025, 1, 1, 19, 0));
    Movie movie2 = Movie(2, 'Interstellar', 3, DateTime(2025, 1, 2, 20, 0));

    Booking booking = Booking();

    booking.bookTicket(1, movie1);
    booking.bookTicket(1, movie2);

    booking.displayBookingDetails(1);
  } catch (e) {
    print('Error: $e');
  }
}
