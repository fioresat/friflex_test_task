import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_test_task/bloc/app_bloc.dart';
import 'package:friflex_test_task/consts/consts.dart';

///Экран ошибки, AppBar и текст с ошибкой
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
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
              const AppEventGoToFirstScreen(),
            );
          },
        ),
      ),
      body: const Center(
        child: Text(Consts.errorMessage),
      ),
    );
  }
}
