class LiveMatch {
  String docID;
  String id;
  String title;
  String banner;
  bool useWebView;
  bool fromYouTube;
  String url;

  LiveMatch({
    required this.docID,
    required this.id,
    required this.title,
    required this.banner,
    required this.useWebView,
    required this.fromYouTube,
    required this.url,
  });

  factory LiveMatch.fromJson(Map<String, dynamic> json) {
    return LiveMatch(
      docID: json['docID'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      banner: json['banner'] as String,
      useWebView: json['useWebView'] as bool,
      fromYouTube: json['fromYouTube'] as bool,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docID': docID,
      'id': id,
      'title': title,
      'banner': banner,
      'useWebView': useWebView,
      'fromYouTube': fromYouTube,
      'url': url,
    };
  }
}
