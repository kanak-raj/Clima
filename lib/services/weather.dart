import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiid = '59474309952205287fbcb421c621f750';
String apisite = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    Networkdata netdata =
        Networkdata('$apisite?q=$cityname&appid=$apiid&units=metric');
    var weatherData = await netdata.getdata();
    return weatherData;
  }

  Future<dynamic> getlocationwther() async {
    Location location = Location();
    await location.getcurrentlocation();
    Networkdata netdata = Networkdata(
        '$apisite?lat=${location.latitude}&lon=${location.longitude}&appid=$apiid&units=metric');
    var weatherData = await netdata.getdata();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(double temp) {
    if (temp > 25.0) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20.0) {
      return 'Time for shorts and ๐';
    } else if (temp < 10.0) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
