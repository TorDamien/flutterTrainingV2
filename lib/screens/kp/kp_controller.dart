part of 'kp_screen.dart';

abstract class KpController extends State<KpScreen> {

  final CacheProvider _cacheProvider = CacheProvider();
  List<KpData> _kpDataList = [];
  List<ForecastData> _forecastDataList = [];
  bool _isKpLoading = true;
  bool _isForecastLoading = true;

  @override
  void initState() {
    super.initState();
    _loadKpData();
    _loadForecastData();
  }

  Future<void> _loadKpData() async {
    try {
      List<KpData> data = await _cacheProvider.getKpData();
      setState(() {
        _kpDataList = data;
        _isKpLoading = false;
      });
    } catch(e) {
      setState(() {
        _isKpLoading = true;
      });
      if (kDebugMode) {
        print('Error lors du chargement des données: $e');
      }
    }
  }

  Future<void> _loadForecastData() async {
    try {
      List<ForecastData> data = await _cacheProvider.getForecastData();
      setState(() {
        _forecastDataList = data;
        _isForecastLoading = false;
      });
    } catch(e) {
      setState(() {
        _isForecastLoading = true;
      });
      if (kDebugMode) {
        print('Error while loading forecast data: $e');
      }
    }
  }

  int getCurrentKpIndex() {
    final String currentUtcHour = CustomDateUtils.getCurrentRoundedUtcHour();
    if (kDebugMode) {
      print('Current UTC hour: $currentUtcHour');
    }

    if (_kpDataList.isEmpty) {
      return -1;
    } else {

      try {
        return _kpDataList.firstWhere((kpData) => kpData.time_tag == currentUtcHour).kp_index;
      } catch (e) {
        if (kDebugMode) {
          print('Error while trying to get current Kp data: $e');
        }
        return -1;
      }
    }
  }

}