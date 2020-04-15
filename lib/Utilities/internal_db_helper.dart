class Internal_Database_Manager {
  Internal_Database_Manager(
      {this.gameName,
      this.noOfTrophiesAchieved,
      this.totalNoOfTrophies,
      this.trophiesAchieved});
  final String gameName;
  final int noOfTrophiesAchieved;
  final int totalNoOfTrophies;
  final List<bool> trophiesAchieved;

  String listDecoder() {}

  String listEncoder() {}
}

void main() {
  List<bool> b = [true, false, false, false, true, false];
  String encoded = "";

  int len = b.length;
  for (int i = 0; i < len - 1; i++) {
    if (b[i]) {
      encoded += 'true|';
    } else {
      encoded += 'false|';
    }
  }
  if (b[len - 1]) {
    encoded += 'true';
  } else {
    encoded += 'false';
  }
  List<bool> decoded = [];
  for (String x in encoded.split('|')) {
    if (x == 'true') {
      decoded.add(true);
    } else {
      decoded.add(false);
    }
  }
  print(decoded);
}
