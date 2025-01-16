class KpData {
  final String time_tag;
  final int kp_index;

  KpData({
    required this.time_tag,
    required this.kp_index,
  });

  // Convertir un objet JSON en instance de la classe kpData
  factory KpData.fromJson(Map<String, dynamic> json) {
    return KpData(
      time_tag: json['time_tag'],
      kp_index: json['kp_index'],
    );
  }

  @override
  String toString() {
    return 'KpData{time_tag: $time_tag, kp_index: $kp_index}';
  }

}