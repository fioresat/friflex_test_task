import 'package:flutter/material.dart';
import 'package:friflex_test_task/model/weather_model.dart';
import 'package:intl/intl.dart';

///Карточка с погодой, показывает дату, температуру, влажность и ветер
class WeatherCard extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherCard({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(weatherModel.date*1000);
    final DateFormat formatter = DateFormat('dd.MM.yy');
    final String formatted = formatter.format(date);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(horizontal: 105),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatted,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '${weatherModel.temperature.toInt()}°',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Влажность ${weatherModel.humidity.toInt()} %',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Ветер ${weatherModel.windSpeed.toInt()} м/с',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
