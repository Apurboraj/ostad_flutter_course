// Define the Movie class
class Movie {
  final int id;
  final String title;
  int availableSeats;
  final DateTime showTime;

  Movie({required this.id, required this.title, required this.availableSeats, required this.showTime});

  @override
  String toString() => 'Movie: $title (ID: $id), Seats Available: $availableSeats, ShowTime: ${showTime.toLocal()}';
}

// Define the Booking class
class Booking {
  final String userName;
  final Movie movie;
  final int seatsBooked;

  Booking({required this.userName, required this.movie, required this.seatsBooked});

  @override
  String toString() => 'Booking for $userName: $seatsBooked seats for "${movie.title}"';
}

// Define the MovieBookingSystem class
class MovieBookingSystem {
  final List<Movie> _movies = [];
  final Map<String, List<Booking>> _bookings = {}; // UserName -> List of Bookings

  void addMovie(Movie movie) {
    _movies.add(movie);
    print('Added movie: ${movie.title}');
  }

  void listMovies() {
    if (_movies.isEmpty) {
      print('No movies available.');
      return;
    }

    print('Available Movies:');
    for (var movie in _movies) {
      print('- $movie');
    }
  }

  void bookTickets(String userName, int movieId, int seats) {
    try {
      final movie = _movies.firstWhere(
            (m) => m.id == movieId,
        orElse: () => throw Exception('Movie with ID $movieId not found.'),
      );

      if (seats <= 0) {
        throw Exception('Invalid number of seats: $seats.');
      }

      if (movie.availableSeats < seats) {
        throw Exception('Not enough seats available for "${movie.title}".');
      }

      movie.availableSeats -= seats;
      final booking = Booking(userName: userName, movie: movie, seatsBooked: seats);

      if (_bookings.containsKey(userName)) {
        _bookings[userName]!.add(booking);
      } else {
        _bookings[userName] = [booking];
      }

      print('Successfully booked $seats seats for "${movie.title}" for user $userName.');
    } catch (e) {
      print(e);
    }
  }

  void displayBookings(String userName) {
    final userBookings = _bookings[userName];
    if (userBookings == null || userBookings.isEmpty) {
      print('No bookings found for user $userName.');
      return;
    }

    print('Bookings for $userName:');
    for (var booking in userBookings) {
      print('- $booking');
    }
  }
}

void main() {
  final system = MovieBookingSystem();

  // Add movies
  system.addMovie(Movie(
    id: 1,
    title: 'Inception',
    availableSeats: 50,
    showTime: DateTime.now().add(Duration(hours: 5)),
  ));
  system.addMovie(Movie(
    id: 2,
    title: 'The Matrix',
    availableSeats: 30,
    showTime: DateTime.now().add(Duration(hours: 3)),
  ));

  // List movies
  system.listMovies();

  // Book tickets
  system.bookTickets('Alice', 1, 3); // Successful booking
  system.bookTickets('Bob', 1, 60); // Not enough seats
  system.bookTickets('Alice', 3, 2); // Movie not found

  // Display bookings
  system.displayBookings('Alice');
  system.displayBookings('Bob');
}
