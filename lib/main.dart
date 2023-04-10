import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_test_task/ui/error_screen.dart';
import 'package:friflex_test_task/ui/first_screen.dart';
import 'package:friflex_test_task/ui/loading_screen.dart';
import 'package:friflex_test_task/ui/second_screen.dart';
import 'package:friflex_test_task/ui/third_screen.dart';

import 'bloc/app_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Включаем Bloc
    return BlocProvider<AppBloc>(
      create: (_) => AppBloc()
        ..add(
          const AppEventGoToFirstScreen(),
        ),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,

        ///Consumer, чтобы показывал SnackBar
        home: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            if (appState is ErrorState) {
              _showSnackBar(context, appState.message);
            }
          },
          builder: (context, state) {
            ///Если такое-то сотояние, то показываем такой-то экран
            if (state is FirstScreenState) {
              return const FirstScreen();
            } else if (state is SecondScreenLoadedState) {
              return SecondScreen(
                weatherModels: state.weatherModels,
              );
            } else if (state is ThirdScreenLoadedState) {
              return ThirdScreen(
                weatherModels: state.weatherModels,
              );
            } else if (state is LoadingState) {
              return const LoadingScreen();
            } else if (state is ErrorState) {
              return const ErrorScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  ///Функция отображения SnackBar
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height / 2,

        ///Чтобы ровно в середине
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      behavior: SnackBarBehavior.floating,

      ///Чтобы не привязана к низу
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.redAccent,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
