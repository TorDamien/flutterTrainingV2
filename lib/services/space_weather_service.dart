import 'package:flutter_training/commons.dart';
import 'package:http/http.dart' as http;

class SpeaceWeatherService {

  static const String _urlCurrentKp = 'https://services.swpc.noaa.gov/json/planetary_k_index_1m.json';
  static const String _urlForecastKp = 'https://services.swpc.noaa.gov/text/27-day-outlook.txt';

  Future<List<KpData>> fetchKpData() async {
    try {
      final response = await http.get(Uri.parse(_urlCurrentKp));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => KpData.fromJson(json)).toList();
      } else {
        throw Exception('Error while trying to load current kp data on code http: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ForecastData>> fetchForecastData() async {
    try {

      final response = await http.get(Uri.parse(_urlForecastKp));

      if (response.statusCode == 200) {

        final List<String> lines = response.body.split('\n');
        final List<ForecastData> forecastData = [];
        bool todayForecastPassed = false;
        List months = ['jan', 'feb', 'mar', 'apr', 'may','jun','jul','aug','sep','oct','nov','dec'];
        var CurrentDate = new DateTime.now();

        final RegExp regex = RegExp(r'(\d{4})\s+([A-Za-z]+)\s+(\d{1,2})\s+(\d+)\s+(\d+)\s+(\d+)');
        for (final line in lines) {
          final matchRegexLine = regex.firstMatch(line);

          print(matchRegexLine?.group(3)!);
          if (matchRegexLine?.group(2)!.toLowerCase() == months[CurrentDate.month-1] && matchRegexLine?.group(3)! == DateTime.now().day.toString()) {
            todayForecastPassed = true;
          }

          if (matchRegexLine != null && todayForecastPassed) {
            final String mois = matchRegexLine.group(2)!;
            final String jour = matchRegexLine.group(3)!;
            final int kp = int.parse(matchRegexLine.group(6)!);

            forecastData.add(ForecastData(mois: mois, jour: jour, kp: kp));
          }
        }
        return forecastData;
      } else {
        throw Exception('Error while trying to load forecast kp data on code http: ${response.statusCode}');
      }
    } catch (e) {
     throw Exception('Failed to load data');
    }
  }
}