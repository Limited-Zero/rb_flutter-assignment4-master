import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  WeatherState createState() => WeatherState();
}


class WeatherState extends State<Weather> {
  // Initialize default values for the city, description, temperature, and loading state
  String _city = 'Barrie, Ontario, Canada';
  String _description = '';
  double _temp = 0;
  bool _isLoading = true;

  // Call _getWeatherData() to retrieve weather information for the default city when the app starts
  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  // Retrieve weather data using the OpenWeatherMap API
  Future<void> _getWeatherData() async {
    // Use http package to send a GET request to the OpenWeatherMap API with the city name and API key
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=86d3d58a2e9705578df0920ccb59ef55'));

    // If the response status code is 200, parse the JSON response and update the state with the weather information
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _description = data['weather'][0]['description'];
        _temp = data['main']['temp'] - 273.15;
        _isLoading = false;
      });
    } else {
      // If the response status code is not 200, throw an exception
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Create a scaffold with an app bar and a body
      appBar: AppBar(title: const Text('My Weather Tool')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Add a text field for the user to enter a city name
          TextField(
            decoration: const InputDecoration(hintText: 'Enter city name'),
            onChanged: (value) {
              // Update the _city variable with the user's input
              setState(() {
                _city = value;
              });
            },
          ),
          // Add a button to retrieve weather information for the current city
          ElevatedButton(
            onPressed: _getWeatherData,
            child: const Text('Get Weather'),
          ),
          // Add a column that displays the weather information
          Expanded(
            child: _isLoading
            // If the weather data is still being loaded, display a progress indicator
                ? const Center(child: CircularProgressIndicator())
            // If the weather data has been loaded, display the weather description, temperature, and a home button
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _description,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 16),
                Text(
                  '${_temp.toStringAsFixed(1)}°C',
                  style: const TextStyle(fontSize: 48),
                ),
                ElevatedButton(
                  // Click HOME go to Home Page
                  onPressed: () => context.go('/'),
                  child: const Text('Home'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
