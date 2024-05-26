import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/data/cat_facts_repository.dart';
import 'package:routing_shell_ex/models/cat_fact.dart';

final catFactsProvider = FutureProvider.autoDispose<CatFact>((ref) async {
  final catFactsRepo = ref.read(catFactsRepositoryProvider);
  final cancelToken = CancelToken();

  ref.onDispose(() {
    cancelToken.cancel();
  });

  // Don't fetch a new fact if we already have one
  // We will get a new fact when the user forces it via ref.refresh(catFactsProvider).
  ref.keepAlive();
  return catFactsRepo.getFact(cancelToken: cancelToken);
});

final catFactsRepositoryProvider = Provider<CatFactsRepository>((ref) {
  return CatFactsRepository();
});
