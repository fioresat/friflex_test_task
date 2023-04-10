import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_test_task/bloc/app_bloc.dart';
import 'package:friflex_test_task/consts/consts.dart';

///Первый экран с поиском, AppBar и окошко с поиском
class FirstScreen extends StatelessWidget {
  final String? errorText;
  const FirstScreen({Key? key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text(Consts.title)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    labelText: Consts.labelText,
                    errorText: errorText,
                  ),
                  onSubmitted: (String city) {
                    context.read<AppBloc>().add(
                          AppEventGetForecastAndGoToSecondScreen(
                            cityName: city,
                          ),
                        );
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  context.read<AppBloc>().add(
                        AppEventGetForecastAndGoToSecondScreen(
                          cityName: cityController.text,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
