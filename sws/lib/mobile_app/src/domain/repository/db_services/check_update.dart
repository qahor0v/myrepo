import 'package:firedart/firedart.dart';

class UpdateChecker {
  String key;
  bool update;
  String url;

  UpdateChecker({
    required this.url,
    required this.update,
    required this.key,
  });

  static Future<UpdateChecker?> get() async {
    var map = await Firestore.instance.collection("updates").get();
    try {
      UpdateChecker checker = UpdateChecker(
          url: map.first.map['url'],
          update: map.first.map['update'],
          key: map.first.map['key']);
      return checker;
    } catch (e) {
      return null;
    }
  }
}
