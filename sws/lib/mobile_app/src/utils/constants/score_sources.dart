import 'package:sws/mobile_app/src/utils/constants/keys.dart';

class ScoreRequestURLs {
  static String getCountries =
      "https://apiv3.apifootball.com/?action=get_countries&APIkey=$scoreKEY";

  static String getCompetitions(String id) =>
      "https://apiv3.apifootball.com/?action=get_leagues&country_id=$id&APIkey=$scoreKEY";

  static String getTeams(String id) =>
      "https://apiv3.apifootball.com/?action=get_teams&league_id=$id&APIkey=$scoreKEY";

  static String getStandings(String id) =>
      "https://apiv3.apifootball.com/?action=get_standings&league_id=$id&APIkey=$scoreKEY";

  static String getEvents(String id) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(hours: 12));
    DateTime tomorrow = now.add(const Duration(hours: 12));
    return "https://apiv3.apifootball.com/?action=get_events&from=${yesterday.year}-${yesterday.month}-${yesterday.day}&to=${tomorrow.year}-${tomorrow.month}-${tomorrow.day}&league_id=$id&APIkey=$scoreKEY";
  }
}

class ScoreIDs {
  ///Countries
  static const String uzb = "116";
  static const String saudi = "97";
  static const String usa = "114";
  static const String ru = "95";
  static const String en = "44";
  static const String es = "6";
  static const String it = "5";
  static const String ger = "4";
  static const String fr = "3";
  static const String turk = "111";
  static const String port = "92";
  static const String euroCups = "1";
  static const String europe = "160";
  static const String world = "133";

  ///Leagues
  static const String uzSuperLeague = "335";
  static const String saudiProLeague = "278";
  static const String usaMLS = "332";
  static const String ruPL = "344";
  static const String enChampionship = "153";
  static const String enLeagueCup = "147";
  static const String epl = "152";
  static const String esCopaDelRey = "300";
  static const String laliga = "302";
  static const String serieA = "207";
  static const String serieB = "206";
  static const String coppaIT = "205";
  static const String bundesliga = "175";
  static const String league1 = "168";
  static const String turkeySuperLeague = "322";
  static const String portugalLeague = "266";
  static const String ucl = "3";
  static const String uel = "4";
}

class Turnir {
  final String name;
  final String id;

  Turnir({
    required this.name,
    required this.id,
  });

  static List<Turnir> all = [
    Turnir(name: "Angliya Premier ligasi", id: ScoreIDs.epl),
    Turnir(name: "LaLiga", id: ScoreIDs.laliga),
    Turnir(name: "Italiya A Seriyasi", id: ScoreIDs.serieA),
    Turnir(name: "Fransiya 1-ligasi", id: ScoreIDs.league1),
    Turnir(name: "Germaniya Bundesligasi", id: ScoreIDs.bundesliga),
    Turnir(name: "O'zbekiston Superligasi", id: ScoreIDs.uzSuperLeague),
    Turnir(name: "Saudiya Arabistoni Pro-Ligasi", id: ScoreIDs.saudiProLeague),
    Turnir(name: "AQSH MLS Ligasi", id: ScoreIDs.usaMLS),
    Turnir(name: "Rossiya Premier Ligasi", id: ScoreIDs.ruPL),
    Turnir(name: "Angliya Chempionship Ligasi", id: ScoreIDs.enChampionship),
    Turnir(name: "Italiya B Seriyasi", id: ScoreIDs.serieB),
    Turnir(name: "Turkiya Superligasi", id: ScoreIDs.turkeySuperLeague),
    Turnir(name: "Portugaliya ligasi", id: ScoreIDs.portugalLeague),
  ];

  static Turnir uel = Turnir(
    name: "UEFA Yevropa ligasi",
    id: ScoreIDs.uel,
  );

  static Turnir ucl = Turnir(
    name: "UEFA chempionlar ligasi",
    id: ScoreIDs.ucl,
  );

  static Turnir copaItaly = Turnir(
    name: "Italiya kubogi",
    id: ScoreIDs.coppaIT,
  );

  static Turnir copaDelRey = Turnir(
    name: "Ispaniya Qirollik kubogi",
    id: ScoreIDs.esCopaDelRey,
  );

  static Turnir copaEnglish = Turnir(
    name: "Angliya liga kubogi",
    id: ScoreIDs.enLeagueCup,
  );
}
