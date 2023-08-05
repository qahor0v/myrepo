class CustomMatch {
  String id;
  String docID;
  String home;
  String away;
  String homeLogo;
  String awayLogo;
  String stage;
  String league;
  String matchStatus;
  String matchTime;
  String matchDate;
  String referee;
  String stadium;
  String homeScore;
  String awayScore;
  List<String> events;

  CustomMatch({
    required this.id,
    required this.docID,
    required this.homeLogo,
    required this.awayLogo,
    required this.stage,
    required this.league,
    required this.matchStatus,
    required this.matchTime,
    required this.matchDate,
    required this.referee,
    required this.stadium,
    required this.homeScore,
    required this.awayScore,
    required this.events,
    required this.away,
    required this.home,
  });

  factory CustomMatch.fromJson(Map<String, dynamic> json) {
    return CustomMatch(
      id: json['id'] as String,
      docID: json['docID'] as String,
      homeLogo: json['homeLogo'] as String,
      awayLogo: json['awayLogo'] as String,
      stage: json['stage'] as String,
      league: json['league'] as String,
      matchStatus: json['matchStatus'] as String,
      matchTime: json['matchTime'] as String,
      matchDate: json['matchDate'] as String,
      referee: json['referee'] as String,
      stadium: json['stadium'] as String,
      homeScore: json['homeScore'] as String,
      awayScore: json['awayScore'] as String,
      events: json['events'] as List<String>,
      home: json['home'] as String,
      away: json['away'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'docID': docID,
      'homeLogo': homeLogo,
      'awayLogo': awayLogo,
      'stage': stage,
      'league': league,
      'matchStatus': matchStatus,
      'matchTime': matchTime,
      'matchDate': matchDate,
      'referee': referee,
      'stadium': stadium,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'events': events,
      'away': away,
      'home': home,
    };
  }
}
