MatchStatus matchStatus(String status) {
  if (status.length <= 5) {
    return MatchStatus(title: "$status'", code: 1);
  } else if (status.toUpperCase() == "FINISHED") {
    return MatchStatus(title: "Yakunlangan", code: 100);
  } else {
    return MatchStatus(title: status, code: 0);
  }
}

class MatchStatus {
  String title;
  int code;

  MatchStatus({
    required this.title,
    required this.code,
  });
}
