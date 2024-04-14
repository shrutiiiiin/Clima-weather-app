import 'package:clima/services/location.dart';
import 'networking.dart';

const apiKey = '496781d96d32d174fdb6b60abc1f211f';
const openweatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel
{
  late double latitude;
  late double longitude;

  Future<dynamic> getCityWeather(String cityName)async{
    NetworkHelper networkHelper = NetworkHelper('$openweatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper('$openweatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Map<String, String> getWeatherIcon(int condition) {


    if (condition < 300) {
      return {'emoji': '🌩', 'imagePath': 'images/storm.png'};
    } else if (condition < 400) {
      return {'emoji': '🌧', 'imagePath': 'images/Rain cloud.png'};
    } else if (condition < 600) {
      return {'emoji': '☔️', 'imagePath': 'images/Rain cloud.png'};
    } else if (condition < 700) {
      return {'emoji': '☃️', 'imagePath': 'images/night.png'};
    } else if (condition < 800) {
      return {'emoji': '🌫', 'imagePath': 'images/mist.png'};
    } else if (condition == 800) {
      return {'emoji': '☀️', 'imagePath': 'images/sunny side up eggs.png'};
    } else if (condition <= 804) {
      return {'emoji': '☁️', 'imagePath': 'images/cloud.png'};
    } else {
      return {'emoji': '🤷‍', 'imagePath': 'images/home map pin.png'};
    }
  }


  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}