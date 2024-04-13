import 'package:clima/services/location.dart';
import 'networking.dart';

const apiKey = '496781d96d32d174fdb6b60abc1f211f';
const openweatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel
{
  late double latitude;
  late double longitude;
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
      return {'emoji': '🌩', 'imagePath': 'assets/thunderstorm.png'};
    } else if (condition < 400) {
      return {'emoji': '🌧', 'imagePath': 'assets/rain.png'};
    } else if (condition < 600) {
      return {'emoji': '☔️', 'imagePath': 'assets/rainy.png'};
    } else if (condition < 700) {
      return {'emoji': '☃️', 'imagePath': 'assets/snow.png'};
    } else if (condition < 800) {
      return {'emoji': '🌫', 'imagePath': 'assets/mist.png'};
    } else if (condition == 800) {
      return {'emoji': '☀️', 'imagePath': 'assets/clear.png'};
    } else if (condition <= 804) {
      return {'emoji': '☁️', 'imagePath': 'assets/clouds.png'};
    } else {
      return {'emoji': '🤷‍', 'imagePath': 'assets/unknown.png'};
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