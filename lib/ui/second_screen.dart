import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_test_task/bloc/app_bloc.dart';
import 'package:friflex_test_task/consts/consts.dart';
import 'package:friflex_test_task/model/weather_model.dart';
import 'package:friflex_test_task/ui/weather_card.dart';

///Второй экран. AppBar, Название города и карточка с погодой на сегодня
class SecondScreen extends StatelessWidget {
  final List<WeatherModel> weatherModels;

  const SecondScreen({
    Key? key,
    required this.weatherModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherModel = weatherModels[0];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(Consts.title),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<AppBloc>().add(
                  const AppEventGoToFirstScreen(),
                );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              context.read<AppBloc>().add(
                    AppEventGoToThirdScreen(
                        weatherModels: weatherModels),
                  );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            WeatherCard(
              weatherModel: weatherModel,
            ),
          ],
        ),
      ),
    );
  }
}
