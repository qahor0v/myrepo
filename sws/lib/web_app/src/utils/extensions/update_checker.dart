import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateCheckerWeb {
  String key;
  bool update;
  String url;

  UpdateCheckerWeb({
    required this.url,
    required this.update,
    required this.key,
  });

  static Future<UpdateCheckerWeb?> get() async {
    var map = await FirebaseFirestore.instance.collection('updates').get();

    //Firestore.instance.collection("updates").get();
    try {
      UpdateCheckerWeb checker = UpdateCheckerWeb(
          url: map.docs.first['url'],
          update: map.docs.first['update'],
          key: map.docs.first['key']);
      return checker;
    } catch (e) {
      return null;
    }
  }
}
