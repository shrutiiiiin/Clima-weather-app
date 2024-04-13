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
  late String imagePath;
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
        imagePath = 'images/home map pin.png';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition)['emoji'] ?? '';
      weatherMessage = weather.getMessage(temperature);
      imagePath = weather.getWeatherIcon(condition)['imagePath'] ?? '';
      // weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 190,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              width: 150, // Set the desired width for the text
                              height: 190,
                              child: Text(
                                "$weatherMessage in $cityName",
                                style: TextStyle(fontSize: 34, fontFamily: 'Spartan MB'),
                              ),
                             ),
                          ),
                          Image.asset(
                            imagePath,
                            height: 150,
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                color: Color(0xFFDFBFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$weatherIcon',style: TextStyle(fontSize: 80),),

                  Row(
                    children: [
                      Text('the temperature is', style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Spartan MB' ),),
                      SizedBox(width: 10,),
                      Text(
                      '$temperature', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Spartan MB', fontSize: 32, color: Colors.white ),
                    ),
                    ],
                  )

                ],
              ),
            )




                  // Text('$weatherIcon',style: TextStyle(fontSize: 45),),


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

    );
  }
}











