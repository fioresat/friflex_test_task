import 'package:bloc/bloc.dart';
import 'package:friflex_test_task/consts/consts.dart';
import 'package:friflex_test_task/model/weather_model.dart';
import 'package:friflex_test_task/service/fetch_service.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  ///В самом начале оказываемся на первом экране
  AppBloc() : super(const FirstScreenState()) {
    ///Вызвали ивент перехода на первый экран
    on<AppEventGoToFirstScreen>((event, emit) {
      ///Эмитится первый экран
      emit(const FirstScreenState());
    });

    ///Вызвали ивент получения информации о погоде и перехода на второй экран
    on<AppEventGetForecastAndGoToSecondScreen>((event, emit) async {
      /// На время всех запросов видим экран загрузки
      emit(const LoadingState());

      ///Делаем запрос на сервер
      try {
        final dataDecoded =
            await FetchService().getDataForecast(event.cityName);
        ///Если город такой не нашелся, то показываем экран ошибки
        if (dataDecoded == null) {
          emit(
            const ErrorState(message: Consts.weatherErrorMessage),
          );
        } else {
          ///При успехе создали лист моделек
          final List<WeatherModel> weatherModels = [];
          ///Прошли циклом по json, взяли тот, где 8 запросов за сутки
          for (int i = 0; i < 17; i += 8) {
            weatherModels.add(WeatherModel.fromJsonForecast(dataDecoded, i));
          }
          ///Эмитится второй экран с нужной информацией о погоде,
          ///но знает всю погоду на три дня вперёд,
          ///чтобы поделиться с третьим экраном при необходимости
          emit(
            SecondScreenLoadedState(weatherModels: weatherModels),
          );
        }
      } on Exception catch (e) {
        ///Если поймали ошибку
        ///Эмитится экран ошибки и показывается снэк бар
        emit(
          ErrorState(message: e.toString()),
        );
      }
    });

    ///Вызвали ивент перехода на третий экран
    on<AppEventGoToThirdScreen>((event, emit) {
      ///Сортируем по температуре
      event.weatherModels
          .sort((a, b) => a.temperature.compareTo(b.temperature));

      ///Эмитится третий экран с уже имеющейся информацией о погоде
      emit(
        ThirdScreenLoadedState(weatherModels: event.weatherModels),
      );
    });

    ///Вызвали ивент перехода на второй экран
    on<AppEventGoToSecondScreen>((event, emit) {
      ///Сортируем обратно по дате
      event.weatherModels.sort((a, b) => a.date.compareTo(b.date));

      ///Эмитится второй экран с уже имеющейся информацией о погоде
      emit(
        SecondScreenLoadedState(weatherModels: event.weatherModels),
      );
    });
  }
}
