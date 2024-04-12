import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
class LocationScreen extends StatefulWidget {
  final locationWeather;
   LocationScreen({this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  @override
  void initState() {
    super.initState();
    UpdateUI(widget.locationWeather);
  }
  void UpdateUI(dynamic weatherData){
     double temp = weatherData['main']['temp'];
     temperature = temp.toInt();
     var condition = weatherData['weather'][0]['id'];
     weatherIcon = weather.getWeatherIcon(condition);
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












