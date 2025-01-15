class CustomDateUtils {

  // Renvoie l'heure UTC actuelle arrondie à l'heure la plus proche
  static String getCurrentRoundedUtcHour() {
    String currentUtcHour = DateTime.now().toUtc().toIso8601String().substring(0, 13);
    currentUtcHour = '$currentUtcHour:00:00';
    return currentUtcHour;

  }

}