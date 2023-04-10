part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

///Получить информацию о погоде в выбранном городе и при успехе перейти на второй экран
@immutable
class AppEventGetForecastAndGoToSecondScreen implements AppEvent {
  final String cityName;

  const AppEventGetForecastAndGoToSecondScreen({
    required this.cityName,
  }) : super();
}

///Взять информацию о погоде из списка и пойти на третий экран
@immutable
class AppEventGoToThirdScreen implements AppEvent {
  final List<WeatherModel> weatherModels;

  const AppEventGoToThirdScreen({
    required this.weatherModels,
  }) : super();
}

///Перейти на первый экран
@immutable
class AppEventGoToFirstScreen implements AppEvent {
  const AppEventGoToFirstScreen();
}

///Взять информацию о погоде из списка и пойти на второй экран
@immutable
class AppEventGoToSecondScreen implements AppEvent {
  final List<WeatherModel> weatherModels;

  const AppEventGoToSecondScreen({
    required this.weatherModels,
  }) : super();
}


