import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import '../services/weather.dart';
import '../utilities/constants.dart';


class loadingscreen extends StatefulWidget {
  @override
  State<loadingscreen> createState() => _loadingscreenState();
}
class _loadingscreenState extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData(BuildContext context) async {
    var weatherData = await WeatherModel().getLocationWeather();
     Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: Center(
          child: SpinKitThreeBounce(
            color: Colors.lightBlueAccent,
            size: 50,
          ),),
        );
  }
}
