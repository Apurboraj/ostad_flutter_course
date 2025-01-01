import 'dart:async';
import 'dart:math';

class City {
  String name;
  double temperature;
  String condition;
  DateTime lastUpdated;

  City({
    required this.name,
    required this.temperature,
    required this.condition,
  }) : lastUpdated = DateTime.now();

  @override
  String toString() {
    return '$name: ${temperature.toStringAsFixed(1)}°C, $condition (Last updated: $lastUpdated)';
  }
}

class WeatherMonitor {
  final Map<String, City> _cities = {};

  void addCity(City city) {
    _cities[city.name] = city;
  }

  Future<void> updateWeather(String cityName) async {
    if (!_cities.containsKey(cityName)) {
      print('City $cityName not found.');
      return;
    }

    print('Fetching weather data for $cityName...');
    await Future.delayed(Duration(seconds: 2)); // Simulate API call

    // Simulate new weather data (random changes)
    final random = Random();
    final temperatureChange = random.nextDouble() * 10 - 5; // -5 to +5 change
    final conditions = ['Sunny', 'Rainy', 'Cloudy', 'Snowy', 'Windy'];
    final newCondition = conditions[random.nextInt(conditions.length)];

    _cities[cityName]!.temperature += temperatureChange;
    _cities[cityName]!.condition = newCondition;
    _cities[cityName]!.lastUpdated = DateTime.now();

    print('Weather updated for $cityName.');
  }

  void displayCitiesByTemperature() {
    if (_cities.isEmpty) {
      print('No cities added yet.');
      return;
    }

    final sortedCities = _cities.values.toList()
      ..sort((a, b) => a.temperature.compareTo(b.temperature));

    print('\nCities sorted by temperature:');
    sortedCities.forEach(print);
  }

  void displayCitiesByCondition(String condition) {
    final filteredCities = _cities.values.where((city) => city.condition == condition);

    if (filteredCities.isEmpty) {
      print('No cities found with $condition condition.');
      return;
    }

    print('\nCities with $condition condition:');
    filteredCities.forEach(print);
  }
}

void main() async {
  final weatherMonitor = WeatherMonitor();

  weatherMonitor.addCity(City(name: 'London', temperature: 15.0, condition: 'Cloudy'));
  weatherMonitor.addCity(City(name: 'New York', temperature: 22.0, condition: 'Sunny'));
  weatherMonitor.addCity(City(name: 'Tokyo', temperature: 18.0, condition: 'Rainy'));
  weatherMonitor.addCity(City(name: 'Sydney', temperature: 25.0, condition: 'Sunny'));

  weatherMonitor.displayCitiesByTemperature();
  weatherMonitor.displayCitiesByCondition('Sunny');

  await weatherMonitor.updateWeather('London');
  await weatherMonitor.updateWeather('Tokyo');

  weatherMonitor.displayCitiesByTemperature();
  weatherMonitor.displayCitiesByCondition('Rainy');
}