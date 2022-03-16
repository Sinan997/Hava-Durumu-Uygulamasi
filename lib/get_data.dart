import 'package:dio/dio.dart';

class WeatherData {
  String apiKey = "6068aaec557a8a322aeb5ccf9b005451";
  String? cityName;
  double? currentTemperature;
  String? weatherId;
  WeatherData({required this.cityName});
  // Future<void> getCurrentWeather() async {
  //   var url = Uri.parse(
  //       "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6068aaec557a8a322aeb5ccf9b005451&units=metric");
  //   Response response = await get(url);
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     var currentWeather = jsonDecode(data);
  //
  //     try {
  //       currentTemperature = currentWeather["main"]["temp"];
  //       weatherId = currentWeather["weather"][0]["id"].toString();
  //     } catch (e) {
  //       rethrow;
  //     }
  //   } else {}
  // }
  Future<void> getCurrentWeather() async {
    var response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6068aaec557a8a322aeb5ccf9b005451&units=metric');
    if (response.statusCode == 200) {
      var currentWeather = response.data;

      try {
        currentTemperature = currentWeather["main"]["temp"];
        weatherId = currentWeather["weather"][0]["id"].toString();
      } catch (e) {
        rethrow;
      }
    } else {}
  }
}
