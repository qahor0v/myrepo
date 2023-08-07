import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sws/mobile_app/src/presentation/providers/key_provider.dart';
import 'package:web_socket_channel/io.dart';

final liveMatchesProvider = StateProvider((ref) {
  final channel = IOWebSocketChannel.connect(
      'wss://wss.apifootball.com/livescore?Widgetkey=${ref.watch(keyProvider)!.key}&timezone=+03:00');
  return channel.stream;
});
