import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sws/mobile_app/src/domain/repository/db_services/check_update.dart';

final keyProvider = StateProvider<UpdateChecker?>((ref) => null);
