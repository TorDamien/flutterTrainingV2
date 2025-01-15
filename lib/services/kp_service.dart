import 'package:flutter_training/commons.dart';
import 'package:http/http.dart' as http;

class KpService {

  static const String _url = 'https://services.swpc.noaa.gov/json/planetary_k_index_1m.json';

  Future<List<KpData>> fetchKpData() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => KpData.fromJson(json)).toList();
      } else {
        throw Exception('Error while trying to load data on code http: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}