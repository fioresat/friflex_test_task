part of 'app_bloc.dart';

@immutable
abstract class AppState {
  const AppState();
}

///Состояние соответствующее первому экрану приложения
class FirstScreenState extends AppState {
  const FirstScreenState();
}

///Состояние на время осуществления запроса и загрузки
@immutable
class LoadingState extends AppState {
  const LoadingState();
}

///Состояние на случай отсутсвия интернета или ошибки из api
@immutable
class ErrorState extends AppState {
  final String message;
  const ErrorState({required this.message});
}

///Состояние соответствующее второму экрану приложения
@immutable
class SecondScreenLoadedState extends AppState {
  final List<WeatherModel> weatherModels;

  const SecondScreenLoadedState({required this.weatherModels,});
}

///Состояние соответствующее третьемуэкрану приложения
@immutable
class ThirdScreenLoadedState extends AppState {
  final List<WeatherModel> weatherModels;

  const ThirdScreenLoadedState({required this.weatherModels,});
}
