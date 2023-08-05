class VideoNews {
  String id;
  String docID;
  String title;
  String banner;
  String createdTime;
  String source;
  String text;
  bool fromYouTube;
  String videoID;

  VideoNews({
    required this.id,
    required this.docID,
    required this.title,
    required this.banner,
    required this.createdTime,
    required this.source,
    required this.text,
    required this.fromYouTube,
    required this.videoID,
  });

  factory VideoNews.fromJson(Map<String, dynamic> json) {
    return VideoNews(
      id: json['id'] as String,
      docID: json['docID'] as String,
      title: json['title'] as String,
      banner: json['banner'] as String,
      createdTime: json['createdTime'] as String,
      source: json['source'] as String,
      text: json['text'] as String,
      fromYouTube: json['fromYouTube'] as bool,
      videoID: json['videoID'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'docID': docID,
      'title': title,
      'banner': banner,
      'createdTime': createdTime,
      'source': source,
      'text': text,
      'fromYouTube': fromYouTube,
      'videoID': videoID,
    };
  }
}
