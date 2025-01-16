part of 'kp_screen.dart';

abstract class KpController extends State<KpScreen> {

  final SpeaceWeatherService _kpService = SpeaceWeatherService();
  List<KpData> _kpDataList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      List<KpData> data = await _kpService.fetchKpData();
      setState(() {
        _kpDataList = data;
        _isLoading = false;
      });
    } catch(e) {
      setState(() {
        _isLoading = false;
      });
      if (kDebugMode) {
        print('Error lors du chargement des données: $e');
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