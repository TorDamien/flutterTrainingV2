import 'package:flutter_training/commons.dart';

class CacheProvider with ChangeNotifier {

  final SpeaceWeatherService _spaceWeatherService = SpeaceWeatherService();
  KpCache? _kpCache;
  ForecastCache? _forecastCache;


  Future<List<KpData>> getKpData() async {
    
    if (_kpCache != null && DateTime.now().difference(_kpCache!.lastUpdated) < const Duration(hours: 1)) {
      return _kpCache!.kpList;
    }

    final newData = await _spaceWeatherService.fetchKpData();
    _kpCache = KpCache(kpList: newData, lastUpdated: DateTime.now());
    notifyListeners();

    return newData;
  }

  Future<List<ForecastData>> getForecastData() async {

    if (_forecastCache != null) {
      return _forecastCache!.forecastList;
    }

    final newForecastData = await _spaceWeatherService.fetchForecastData();
    _forecastCache = ForecastCache(forecastList: newForecastData);
    notifyListeners();

    return newForecastData;
  }
}