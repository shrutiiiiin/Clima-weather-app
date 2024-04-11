import 'package:clima/main.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
   LocationScreen({this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temperature;
  late int condition;
  late String cityName;
  @override
  void initState() {
    super.initState();
    UpdateUI(widget.locationWeather);
  }
  void UpdateUI(dynamic weatherData){
     temperature = weatherData['main']['temp'];
     condition = weatherData['weather'][0]['id'];
     cityName = weatherData['name'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          Icon(Icons.menu),
        ],

      ),
    );
  }
}












