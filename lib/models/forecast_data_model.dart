class ForecastData {
  final String mois;
  final String jour;
  final int kp;

  ForecastData({
    required this.mois,
    required this.jour,
    required this.kp,
  });

  @override
  String toString() {
    return 'ForecastData{mois: $mois, jour: $jour kp: $kp}';
  }

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return ForecastData(
      mois: json['mois'],
      jour: json['jour'],
      kp: json['kp'],
    );
  }

}

class ForecastCache {
  final List<ForecastData> forecastList;

  ForecastCache({
    required this.forecastList,
  });
}