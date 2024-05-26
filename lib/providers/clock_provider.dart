import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/models/clock.dart';

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
