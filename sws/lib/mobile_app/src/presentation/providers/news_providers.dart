import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sws/mobile_app/src/domain/models/custom_match/custom_match_model.dart';
import 'package:sws/mobile_app/src/domain/models/custom_match/live_match.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/news-model.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/top_news_model.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/video_news.dart';
import 'package:sws/mobile_app/src/domain/repository/db_services/post_services.dart';

final getTopNewsProvider = FutureProvider<List<TopNews>>((ref) async {
  List<TopNews> list = [];
  final data = await PostServices.getAllTopNews();
  list.addAll(data);

  return list;
});

final getAllNewsProvider = FutureProvider<List<News>>((ref) async {
  List<News> list = [];
  final data = await PostServices.getAllNews();
  list.addAll(data);

  return list;
});

final getVideoNewsProvider = FutureProvider<List<VideoNews>>((ref) async {
  List<VideoNews> list = [];
  final data = await PostServices.getAllVideo();
  list.addAll(data);

  return list;
});

final getLiveMatchesProvider = FutureProvider<List<LiveMatch>>((ref) async {
  List<LiveMatch> list = [];
  final data = await PostServices.getAllLiveMatches();
  list.addAll(data);

  return list;
});

final getCustomMatchesProvider = FutureProvider<List<CustomMatch>>((ref) async {
  List<CustomMatch> list = [];
  final data = await PostServices.getAllMatches();
  list.addAll(data);

  return list;
});
