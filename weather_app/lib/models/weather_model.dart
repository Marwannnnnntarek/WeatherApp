class WeatherModel {
  final String cityName;
  final double maxTemp;
  final double minTemp;
  final String country;
  final DateTime localTime;
  final double currentTemp;
  final String weatherCondition;
  final String weatherConditionIcon;

  WeatherModel({
    required this.country,
    required this.localTime,
    required this.currentTemp,
    required this.weatherCondition,
    required this.weatherConditionIcon,
    required this.cityName,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Json) {
    return WeatherModel(
      country: Json['location']['country'],
      localTime: DateTime.parse(Json['location']['localtime']),
      currentTemp: Json['current']['temp_c'],
      weatherCondition: Json['current']['condition']['text'],
      weatherConditionIcon: Json['current']['condition']['icon'],
      cityName: Json['location']['name'],
      maxTemp: Json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: Json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
