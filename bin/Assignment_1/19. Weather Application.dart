// Define the WeatherData class
class WeatherData {
  final String city;
  final double temperature;
  final String condition;

  WeatherData({required this.city, required this.temperature, required this.condition});

  @override
  String toString() => '$city: $temperature°C, $condition';
}

// Define the WeatherApp class
class WeatherApp {
  final Set<String> _favoriteCities = {};

  Future<WeatherData> fetchWeatherData(String city) async {
    print('Fetching weather data for $city...');
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Simulate weather data
    final randomTemperature = 20 + (10 * (city.hashCode % 5));
    final conditions = ['Sunny', 'Rainy', 'Cloudy', 'Windy', 'Snowy'];
    final condition = conditions[city.hashCode % conditions.length];

    return WeatherData(city: city, temperature: randomTemperature.toDouble(), condition: condition);
  }

  void addFavoriteCity(String city) {
    if (_favoriteCities.add(city)) {
      print('$city added to favorites.');
    } else {
      print('$city is already in favorites.');
    }
  }

  void listFavoriteCities() {
    if (_favoriteCities.isEmpty) {
      print('No favorite cities.');
      return;
    }

    print('Favorite Cities:');
    for (var city in _favoriteCities) {
      print('- $city');
    }
  }

  Future<void> displayWeather(String city) async {
    try {
      final weather = await fetchWeatherData(city);
      print('Current Weather: $weather');
    } catch (e) {
      print('Error fetching weather data for $city: $e');
    }
  }
}

void main() async {
  final weatherApp = WeatherApp();

  // Fetch and display weather for a city
  await weatherApp.displayWeather('New York');

  // Add favorite cities
  weatherApp.addFavoriteCity('New York');
  weatherApp.addFavoriteCity('Los Angeles');
  weatherApp.addFavoriteCity('New York'); // Duplicate

  // List favorite cities
  weatherApp.listFavoriteCities();

  // Fetch and display weather for another city
  await weatherApp.displayWeather('Los Angeles');
}
