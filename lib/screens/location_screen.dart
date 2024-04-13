import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';

import '../utilities/constants.dart';
import 'city_screen.dart';
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
  late String weatherMessage;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition)['emoji'] ?? '';
      weatherMessage = weather.getMessage(temperature);
      String imagePath = weather.getWeatherIcon(condition)['imagePath'] ?? '';
      // weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/blueSky.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 25.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      // if (typedName != null) {
                      //   var weatherData =
                      //   await weather.getCityWeather(typedName);
                      //   updateUI(weatherData);
                      // }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 150,
                      width: 250,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            width: 200, // Set the desired width for the text
                            height: 100, // Set the desired height for the text
                            child: Text(
                              "$weatherMessage in $cityName",
                              style: TextStyle(fontSize: 36, fontFamily: 'Spartan MB'),
                            ),
                          ),
                          SizedBox(width: 100,),
                          Image(image: AssetImage('images/world map.png'),
                            // height: 150,
                            //   width: 250,
                          ),
                        ],
                      )

                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  
                ],
              )
              // Padding(
              //   padding: EdgeInsets.only(left: 15.0),
              //   child: Row(
              //     children: <Widget>[
              //       Text(
              //         '$temperature°',
              //         style: kTempTextStyle,
              //       ),
              //       Text(
              //         weatherIcon,
              //         style: kConditionTextStyle,
              //       ),
              //     ],
              //   ),
              // ),

              // Padding(
              //   padding: EdgeInsets.only(right: 15.0),
              //   child: Text(
              //     '$weatherMessage in $cityName',
              //     textAlign: TextAlign.right,
              //     style: kMessageTextStyle,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}











