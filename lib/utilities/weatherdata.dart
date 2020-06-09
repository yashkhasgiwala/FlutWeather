import 'networking.dart';

class Weather {
  String city;
  var weatherData;
  Future<dynamic> getCityWeather(city) async {
    Network n = Network(city);
    var weatherData = await n.getData();
    return weatherData;
  }
}
