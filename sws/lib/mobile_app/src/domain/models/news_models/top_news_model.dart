class TopNews {
  String id;
  String docID;
  String createdTime;
  String source;
  bool useVideo;
  bool fromYoutube;
  String title;
  String text;
  String banner;
  String video;

  TopNews({
    required this.id,
    required this.docID,
    required this.createdTime,
    required this.source,
    required this.useVideo,
    required this.fromYoutube,
    required this.title,
    required this.text,
    required this.banner,
    required this.video,
  });

  factory TopNews.fromJson(Map<String, dynamic> json) {
    return TopNews(
      id: json['id'] as String,
      docID: json['docID'] as String,
      createdTime: json['createdTime'] as String,
      source: json['source'] as String,
      useVideo: json['useVideo'] as bool,
      fromYoutube: json['fromYoutube'] as bool,
      title: json['title'] as String,
      text: json['text'] as String,
      banner: json['banner'] as String,
      video: json['video'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'docID': docID,
      'createdTime': createdTime,
      'source': source,
      'useVideo': useVideo,
      'fromYoutube': fromYoutube,
      'title': title,
      'text': text,
      'banner': banner,
      "video": video,
    };
  }
}
