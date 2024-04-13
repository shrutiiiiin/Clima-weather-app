import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class loadingscreen extends StatefulWidget {
  @override
  State<loadingscreen> createState() => _loadingscreenState();
}
class _loadingscreenState extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    // getLocationData(context);
  }
  void getLocation() async {
    Location location = Location();
    try {
      await location.getCurrentLocation();
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));
    }
    catch(e){
      print('Error getting location and weather data: $e');
    }
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.lightBlueAccent,
            size: 50,
          ),),
        );
  }
}
