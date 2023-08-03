import 'package:sws/mobile_app/src/domain/models/news_models/news_body.dart';

class News {
  String id;
  String docID;
  String createdTime;
  String author;
  String source;
  bool useVideo;
  bool fromYoutube;
  String title;
  List<NewsBody> body;
  String banner;

  News({
    required this.id,
    required this.docID,
    required this.createdTime,
    required this.author,
    required this.source,
    required this.useVideo,
    required this.fromYoutube,
    required this.title,
    required this.body,
    required this.banner,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    List<NewsBody> newsBodyList = [];
    if (json['body'] != null) {
      var bodyList = json['body'] as List;
      newsBodyList =
          bodyList.map((bodyJson) => NewsBody.fromJson(bodyJson)).toList();
    }

    return News(
      id: json['id'] as String,
      docID: json['docID'] as String,
      createdTime: json['createdTime'] as String,
      author: json['author'] as String,
      source: json['source'] as String,
      useVideo: json['useVideo'] as bool,
      fromYoutube: json['fromYoutube'] as bool,
      title: json['title'] as String,
      body: newsBodyList,
      banner: json['banner'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> bodyJsonList =
        body.map((newsBody) => newsBody.toJson()).toList();
    return {
      'id': id,
      'docID': docID,
      'createdTime': createdTime,
      'author': author,
      'source': source,
      'useVideo': useVideo,
      'fromYoutube': fromYoutube,
      'title': title,
      'body': bodyJsonList,
      'banner': banner,
    };
  }
}
