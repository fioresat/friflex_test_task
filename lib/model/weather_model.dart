///Модель для погоды; содержит название города, температуру, скорость ветра, влажность, дату в виде таймстемпа
class WeatherModel {
  final String cityName;
  final double temperature;
  final double windSpeed;
  final double humidity;
  final int date;

  WeatherModel({
    this.date = 0,
    this.cityName = '',
    this.windSpeed = 0,
    this.humidity = 0,
    this.temperature = 0,
  });

  WeatherModel.fromJsonForecast(Map<String, dynamic> json, int index)
      : temperature = json['list'][index]['main']['temp'].toDouble(),
        humidity = json['list'][index]['main']['humidity'].toDouble(),
        cityName = json['city']['name'],
        date = json['list'][index]['dt'],
        windSpeed = json['list'][index]['wind']['speed'].toDouble();

  @override
  String toString() {
    return cityName;
  }
}
