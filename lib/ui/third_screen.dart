import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_test_task/bloc/app_bloc.dart';
import 'package:friflex_test_task/consts/consts.dart';
import 'package:friflex_test_task/model/weather_model.dart';
import 'package:friflex_test_task/ui/weather_card.dart';


///Третий экран. AppBar, Название города и карточки с погодой на три дня, отсортированные по температуре
class ThirdScreen extends StatelessWidget {
  final List<WeatherModel> weatherModels;

  const ThirdScreen({
    Key? key,
    required this.weatherModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(Consts.title),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<AppBloc>().add(
                  AppEventGoToSecondScreen(
                    weatherModels: weatherModels,
                  ),
                );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              weatherModels[0].cityName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: weatherModels.length,
                itemBuilder: (context, index) {
                  return WeatherCard(
                    weatherModel: weatherModels[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
