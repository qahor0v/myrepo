import 'package:sws/mobile_app/src/domain/models/custom_match/custom_event.dart';

class CustomMatch {
  String id;
  String docID;
  String homeLogo;
  String awayLogo;
  String leagueLogo;
  String league;
  String matchStatus;
  String matchTime;
  String matchDate;
  String referee;
  String stadium;
  String homeScore;
  String awayScore;
  List<CustomEvent> events;

  CustomMatch({
    required this.id,
    required this.docID,
    required this.homeLogo,
    required this.awayLogo,
    required this.leagueLogo,
    required this.league,
    required this.matchStatus,
    required this.matchTime,
    required this.matchDate,
    required this.referee,
    required this.stadium,
    required this.homeScore,
    required this.awayScore,
    required this.events,
  });

  factory CustomMatch.fromJson(Map<String, dynamic> json) {
    List<CustomEvent> eventsList = [];
    if (json['events'] != null) {
      var eventsData = json['events'] as List;
      eventsList = eventsData
          .map((eventJson) => CustomEvent.fromJson(eventJson))
          .toList();
    }

    return CustomMatch(
      id: json['id'] as String,
      docID: json['docID'] as String,
      homeLogo: json['homeLogo'] as String,
      awayLogo: json['awayLogo'] as String,
      leagueLogo: json['leagueLogo'] as String,
      league: json['league'] as String,
      matchStatus: json['matchStatus'] as String,
      matchTime: json['matchTime'] as String,
      matchDate: json['matchDate'] as String,
      referee: json['referee'] as String,
      stadium: json['stadium'] as String,
      homeScore: json['homeScore'] as String,
      awayScore: json['awayScore'] as String,
      events: eventsList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> eventsJsonList =
        events.map((event) => event.toJson()).toList();
    return {
      'id': id,
      'docID': docID,
      'homeLogo': homeLogo,
      'awayLogo': awayLogo,
      'leagueLogo': leagueLogo,
      'league': league,
      'matchStatus': matchStatus,
      'matchTime': matchTime,
      'matchDate': matchDate,
      'referee': referee,
      'stadium': stadium,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'events': eventsJsonList,
    };
  }
}
