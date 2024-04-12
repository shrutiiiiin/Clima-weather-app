import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import '../services/weather.dart';
import '../utilities/constants.dart';

const apiKey = '496781d96d32d174fdb6b60abc1f211f';
class loadingscreen extends StatefulWidget {
  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    //var weatherData = await WeatherModel().getLocationWeather();
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

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
