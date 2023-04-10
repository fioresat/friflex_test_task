import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:friflex_test_task/consts/consts.dart';

///Ходит в интернет
class FetchService {
  Future<dynamic> getDataForecast(String cityName) async {
    final fullUrl =
        '${Consts.baseUrl}${Consts.getForecastRequest}?q=$cityName&appid=${Consts.openWeatherMapKey}&units=metric';

    http.Response response = await http.get(Uri.parse(fullUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body;
    }
  }
}
