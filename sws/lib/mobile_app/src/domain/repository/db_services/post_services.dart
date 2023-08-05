import 'dart:developer';

import 'package:firedart/firestore/firestore.dart';
import 'package:sws/mobile_app/src/domain/models/custom_match/live_match.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/news-model.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/top_news_model.dart';

class PostServices {
  static Future<List<News>> getAllNews() async {
    List<News> news = [];
    var map = await Firestore.instance.collection("news").get();
    for (final item in map) {
      try {
        News nw = News.fromJson(item.map);
        nw.docID = item.id;
        news.add(nw);
      } catch (e) {
        log("GETTING News ERROR$e");
      }
    }
    return news;
  }

  static Future<List<TopNews>> getAllTopNews() async {
    List<TopNews> news = [];
    var map = await Firestore.instance.collection("top_news").get();
    for (final item in map) {
      try {
        TopNews topNews = TopNews.fromJson(item.map);
        topNews.docID = item.id;
        news.add(topNews);
      } catch (e) {
        log("GETTING TopNews ERROR* $e");
      }
    }
    return news;
  }

  static Future<List<LiveMatch>> getAllLiveMatches() async {
    List<LiveMatch> matches = [];
    var map = await Firestore.instance.collection("live").get();
    for (final item in map) {
      try {
        LiveMatch liveMatch = LiveMatch.fromJson(item.map);
        liveMatch.docID = item.id;
        matches.add(liveMatch);
      } catch (e) {
        log("GETTING LiveMatch ERROR* $e");
      }
    }
    return matches;
  }
}
