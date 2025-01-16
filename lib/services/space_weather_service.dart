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

  Future<List<Map<String, dynamic>>> fetchForecastData() async {
    try {

      final response = await http.get(Uri.parse(_urlForecastKp));

      if (response.statusCode == 200) {
        final List<String> lines = response.body.split('\n');
        final List<Map<String, dynamic>> forecastData = [];

        for (final line in lines) {
          if (line.startsWith('2')) { // A voir si on se contente de cette condition qu'il faudra actualiser en l'an 3000 sinon faut mettre un regex en place
            final List<String> parts = line.split(' '); // 0 = année, 1 = mois, 2 = jour, 3 = radio flux, 4 = A index et 5 = Kp index
            final String date = '${parts[2]} ${parts[1]}';
            final int kp = int.parse(parts[5]);
            forecastData.add({'date': date, 'kp': kp});
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