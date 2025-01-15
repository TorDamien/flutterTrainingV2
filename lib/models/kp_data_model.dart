class KpData {
  final String time_tag;
  final int kp_index;
  final double estimated_kp;
  final String kp;

  KpData({
    required this.time_tag,
    required this.kp_index,
    required this.estimated_kp,
    required this.kp,
  });

  // Convertir un objet JSON en instance de la classe kpData
  factory KpData.fromJson(Map<String, dynamic> json) {
    return KpData(
      time_tag: json['time_tag'],
      kp_index: json['kp_index'],
      estimated_kp: json['estimated_kp'],
      kp: json['kp'],
    );
  }

  @override
  String toString() {
    return 'KpData{time_tag: $time_tag, kp_index: $kp_index, estimated_kp: $estimated_kp, kp: $kp}';
  }

}