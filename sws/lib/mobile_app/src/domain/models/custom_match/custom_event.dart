class CustomEvent {
  String title;
  String time;
  int code;

  CustomEvent({
    required this.title,
    required this.time,
    required this.code,
  });

  factory CustomEvent.fromJson(Map<String, dynamic> json) {
    return CustomEvent(
      title: json['title'] as String,
      time: json['time'] as String,
      code: json['code'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'time': time,
      'code': code,
    };
  }
}
